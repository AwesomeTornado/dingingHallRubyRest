# Dining Hall

## Why I started this project
This project is intended to demonstrate some of my skills with Ruby on Rails and the [RailsRESTframework](https://github.com/gregschmit/rails-rest-framework) developed by Greg Schmit, Sr. Software Engineer at RGNets.

This is my first time ever touching Ruby, and it's been difficult. At the same time, I've really loved the opportunity to learn a new programming language. It has been a great experience so far, and I think I'll continue using it.

## What this project is

This project is a simple API to keep track of which dining halls are serving which foods at which times. It exposes 3 database tables that can be interacted with.

#### Locations

 - Represents a location students can eat at
 - Can have many `menus` (many to many)

#### Menus

 - Represents a collection of foods all put out for students to eat at the same time
 - Can have many `foods` (many to many)
 - Can have many `locations` (many to many)

#### Foods

 - Represents a food that can be prepared
 - Can have many `menus` (many to many)

Each table can have elements added and removed from it, with strict validation.
Each element can be modified without deleting and then replacing it.
While the API does not require a frontend, there are a few simple forms that can be used to add elements to the database.
