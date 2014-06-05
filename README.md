DC-Tech-People
==============

Analyzing the demographics of #dctech.

In production at http://dctechpeople.herokuapp.com/

Contributing
============
This is a Ruby on Rails (3.2) application. To contribute:

- Fork or clone this repo locally
- Install dependencies
```sh
bundle install
```
- Run the following 3 rake commands to seed your database:
````sh
rake db:migrate
rake db:load_angel_dc_users
rake db:add_gender_to_users
```
- Get hacking and send a pull request!

Structure
============
- The 2 rake files that retreive the data from AnelList and assign gender to names are in:
````
lib/tasks
````
Feel free to add other services as separate rake tasks.
- The only model is a User, which contains their name, gender, probability of the gender (from http://genderize.io), photo url, and some extra columns for social urls from the AngelList API.
- The UsersHelper file:
````
app/helpers/users_helper.rb
````
contains some extra methods to easier aggregate the data
- The front-end code is on
````
/app/views/pages/home.html.haml
````
It uses Foundation (https://github.com/zurb/foundation-rails, http://foundation.zurb.com/docs/) and a tiny bit of custom scss:
````
/app/assets/stylesheets/global.css.scss
````
- There's a separate partial to create the male/female graphics
````
/app/views/users/_gender_graphic.html.haml
````
AngelList Data
==============
- The data gets updated nightly in production using Heroku's scheduler (https://devcenter.heroku.com/articles/scheduler)
- To update it locally, drop your data (rake db:drop) and re-run the three rake commands from earlier:
````sh
rake db:migrate
rake db:load_angel_dc_users
rake db:add_gender_to_users
````