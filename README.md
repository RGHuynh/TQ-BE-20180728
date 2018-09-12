# Location Base With Rails Backend API

Rails 5.0 API example application that provides user with authentication, check-in, finding venue, and other users who are checked in. The application uses:

* [FourSquare](https://developer.foursquare.com/) API for finding venues
* [JWT](https://jwt.io/) for management and authentication
* [Unplugg](https://unplu.gg/test_api.html) API for time-series prediction
* Ruby on Rails for back-end framework

# What Is Implemented 

This backend API provides:

* Create user account
* Provide authentication for users
* List venues new user current location
* Check in user to venue
* Provide popular venue locatioin
* List other checked in users
* Provide recomended venue

# Dependencies

Before genearting your application, you will need:

* The Ruby language - version 2.3.5
* The Rails gem - version 5.2.1

# Getting Started

## Gems

Main gems used by the application 

* JWT - provides module to decode and encode user payload
* Dotenv-rails - helps hide important information that you do not want to expose to the public
* Rspec-rails - for testing your application
* Faraday - helps make HTTP calls easier and organize
* Haversine - helps to calculate latitude and lo

# Install the Required Gems

Install gem with command 
```
  bundle install
```

Create Postegres Database
```
  rails db:create
```
Run database migration
```
  rails db:mirgate
```

# Register for API keys

Register for FourSquare API development 
* Store client id key in .env file with key CLIENT_ID
* Store client secret in .env file with key CLIENT_SECRET

Register for Unplugg API
* Store the API key in .env file with key UNPLUG_SECRET
* Store callback URL in .env file with key CALLBACK_WEBHOOK

# API endpoints

Method | Endpoint | Header | Example
------------ | ------------- | ------------ | -----------
POST | /login | Login User | http://yourURL.com/login
POST | /users | Create User | http://yourURL.com/users
GET | /users/:id/venue_list | Get user a venue | http://yourURL.com/users/:id/venue_list
POST | /users/:id/user_list | Get user around venue | http://yourURL.com/users/:id/user_list
GET | /users/:id/recommend_venue | Return a recommended venue for user | http://yourURL.com/users/:id/recommend_venue
POST | /users/:id/checkins | Check into venue | http://yourURL.com/users/:id/checkins