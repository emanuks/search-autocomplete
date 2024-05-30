# Search Autocomplete

#### Description

MVC Ruby on Rails project of a autocomplete search engine.

The search engine looks for the most searched phrases based on user input in realtime.

Each complete search a user does gets saved on the database as a possible suggestion. Repeated searches adds to the priority on showing this specific search as a suggestion for other users.

#### How to Run

You can message me for the master key.

`rails db:create`

`rails db:migrate`

`rails db:seed`

`rails assets:precompile`

`rails s`

#### How to Test

Seeding creates some valid search suggestions for the following inputs and any variation of this input string, like uppercase, lowercase, and substrings:

- Test
- New Test

Each new search submit creates a possible suggestion, you can populate it by typing your desired suggestions.
