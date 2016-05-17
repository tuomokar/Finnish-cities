# README

[![Build Status](https://travis-ci.org/tuomokar/Finnish-municipalities.svg?branch=master)](https://travis-ci.org/tuomokar/Finnish-municipalities)
[![Code Climate](https://codeclimate.com/github/tuomokar/Finnish-municipalities/badges/gpa.svg)](https://codeclimate.com/github/tuomokar/Finnish-municipalities)
[![Coverage Status](https://coveralls.io/repos/github/tuomokar/Finnish-municipalities/badge.svg?branch=master)](https://coveralls.io/github/tuomokar/Finnish-municipalities?branch=master)

This app is a project for the practical work course of Ruby on Rails Web server programming 
in the University of Helsinki in Spring 2016.

- [Documentation](https://github.com/tuomokar/Finnish-municipalities/wiki)
- [Heroku](http://seefinland.herokuapp.com/)

## Local use instructions
The app uses version 4.2.6 from Rails, and 2.3.0 from Ruby. If you want to download the project locally, any version from Rails 4 onwards probably works, and Ruby version from 2 onwards (or at least 2.2). Once you have compatible versions of those and the project donwloaded, go to the app's location in terminal/cmd, install the gems `bundle install`, run migrations `rake db:migrate` and type `rails s` to fire up the local server. You can find the app from `http://localhost:3000` address on your browser.

## Gems (outside the default gems included with Rails) used in the project:
- [Globalize](https://github.com/globalize/globalize): translates model attributes
- [Angular-turbolinks](https://github.com/cdunn/angular-turbolinks): fixes the issue with some of Angular's services messing with Rails' turbolinks
- [Tabulous](https://github.com/techiferous/tabulous): makes the page tabs simple
- [Bootstrap for Sass](https://github.com/twbs/bootstrap-sass): for Bootstrap
- [DynamicForm](https://github.com/joelmoss/dynamic_form): For easier error messages in Finnish (not having to start with the attribute's name)
- [ActiveRecord::ActsAs](https://github.com/hzamani/active_record-acts_as): To simulate the multi-table-inheritance
- [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails): creating objects in tests
- [ngannotate-rails](https://github.com/kikonen/ngannotate-rails): JavaScript assets automatically annotated (fixes issues with minifying)
- [CanCanCan](https://github.com/CanCanCommunity/cancancan): handles authorizations (or at least most of them)
