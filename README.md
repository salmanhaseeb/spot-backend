# README

Here are the steps to run this Spot Management System:

- Install Ruby 3.0.0
    Make sure that you have Ruby 3.0.0 installed on your machine. If not, you can install it using a version manager like RVM or rbenv.

- Install Rails 7.0.4
    You can install the required version of Rails by running the following command:
    gem install rails -v 7.0.4

- Install dependencies
    Navigate to the project directory and run the following command to install the required dependencies:
    bundle install

- Create the database
    Make shure ypu have postgresql 
    Create a database for your application by running the following command:
    rails db:create

- Migrate the database
    Run the following command to migrate the database:
    rails db:migrate
    
- Start the Rails server
    Start the Rails server by running the following command:
    rails server

Relational Schema

Table 1: Spots
Columns:

    id (auto generated primary key)
    title (string, not null)
    description (text, not null)
    price (float, not null)
    created_at (datetime, not null)
    updated_at (datetime, not null)

Table 2: Images
Columns:

    id (auto generated primary key)
    spot_id (bigint, not null, foreign key referencing to spots table)
    primary (boolean)
    created_at (datetime, not null)
    updated_at (datetime, not null)

Table 3: Reviews
Columns:

    id (auto generated primary key)
    spot_id (bigint, not null, foreign key referencing to spots table)
    reviewer_name (string, not null)
    comment (string)
    star (integer, not null)
    created_at (datetime, not null)
    updated_at (datetime, not null)


