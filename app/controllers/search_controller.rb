class SearchController < ApplicationController
  def index
    @results = search_for_articles

    create_search_object

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
            turbo_stream.update('articles',
                                partial: 'articles/articles',
                                locals: { articles: @results })
      end
    end
  end

  def suggestions
    @results = search_for_previous_queries

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
            turbo_stream.update('suggestions',
                                partial: 'search/suggestions',
                                locals: { results: @results })
      end
    end
  end

  private

  def search_for_articles
    if params[:query].blank?
      Article.all
    else
      Article.search(params[:query], fields: %i[title], match: :word_start)
    end
  end

  def search_for_previous_queries
    if params[:query].blank?
      []
    else
      sql = "SELECT query FROM searches WHERE query LIKE '#{params[:query].downcase}%' GROUP BY query ORDER BY SUM(quantity) ASC LIMIT 10"
      searches_array = ActiveRecord::Base.connection.execute(sql)
      searches_array.map { |search| search['query'].titleize }
    end
  end

  def create_search_object
    query = params[:query].downcase
    search = Search.find_or_initialize_by(query:, user_id: current_user.id)

    if search.id.present?
      search.quantity += 1
    else
      search.quantity = 1
    end

    search.save!
  end
end
