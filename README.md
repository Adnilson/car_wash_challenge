# README

# Cars up for a wash

## Instructions

### Configure environment variables

Create an .env file and copy contents from example-env

e.g.

`cp example-env .env`


### Build the app for development

`docker-compose build`

* Enliven the containers

`docker-compose up`

* Set up the database

`docker-compose run web rails db:create`

`docker-compose run web rails db:schema:load`

`docker-compose run web rails db:seed`

This seeding will create the Maker and Model tables for the cars


* Run tests

`docker-compose run web rails test`

* Use the app on debug mode

`docker-compose run --service-ports web`
