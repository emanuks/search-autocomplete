class Article < ApplicationRecord
  searchkick word_start: %i[title]
end
