# We want to understand how powerful activerecord is
# Understand its limitations
# How to avoid N+1 queries

# What is ActiveRecord
    # Class we inherit from for our modles
    # It has bunch of methods

# ActiveRecord Querying vs SQL
    # Ruby interface for querying database
    # MirrorsSQL queries
    # Pros: less overall database access code, more convenient

# What is an ActiveRecord::Relation?
    # Most queries don't return Ruby objects
        # Instead return instances of ActiveRecord:Relation
    # They are lazy
    # They allow for chaining

# ActiveRecord Finder Methods
    # Do not return relations, instead returns Ruby objects
    # Examples: #find(), #find_by(), #first, #last
        # These methods return model instances
    # Executes method immediately

# Code Demo: Look at bluebird

# Go to the terminal and type in "rails c"
User.first
User.last
User.find(22) #you need to put in the id number
User.find(200) #this will show error... couldn't find user with ID = 200
User.find_by(username: 'mish_mosh') #this will return an object... you can use find_by for any column that exists in the table
User.find_by(username: 'fish') #this did not error out. It returns nil... different from "find" and "find_by"... if it doesn't find anything, it will just say nil
User.find_by(age: 99) #it will only return one object... the first thing that it finds
User.find_by("username LIKE 'mish%'") #we put all this in quotation because this is a sql command. We are matching only the first part of the username. Do double quotation for outside and single for the inside

# ActiveRecord Queries with Conditions
    # where/where.not allows you to specify exact value to match, range of values, or multiples values to find
    # Ways to pass in conditions (4 different ways of doing the same thing):
        User.where("email = 'foo@bar.com'")
        User.where(email: "foo@bar.com")
        User.where("email = (?)", "foo@bar.com")
        User.where("email = :youremail", youremail: "foo@bar.com")

# Chaining ActiveRecord Queries
    # More ActiveRecord methods
        # group(): returns distinct records grouped by the passed attribute
        # having(): filters grouped records that match the passed statement
            # must be used with group
        # order(): returns records ordered by passed attribute
        # offset(): offsets the ordered records by the number passed
        # limit(): limits the returned records to the number passed
    # Calculation/Aggregations: this has to be at the end of your query. Can't chain other things to it
        # count()
        # sum() 
        # average()
        # minmum()
        # maximum()

# Code Demo: Look at bluebird (user.rb)

# Go to the terminal and type in "rails c"

# Find all instructors between the ages of 90 to 100 inclusive
    User.where("age BETWEEN 90 to 100")
    User.where(age: 90..100)
    
# Find all users that are not JavaScript affiliated (use where not)
    User.where.not("political_affiliation = 'JavaScript'")

# Find all instructors in this list and order by ascending
    instructors = ["mish_mosh", "wakka_wakka", "jen_ken_intensifies"]

    # User.where.in(["mish_mosh", "wakka_wakka", "jen_ken_intensifies"]).order("username") wont work
    User.where("username IN (?)", instructors).order("username")
    User.where(username: instructors).order("uswername") #rails magic

    _.is_a?(Array) # "_" captures the result of the last output... also, this command shows that our output from the last one is not an array. Our output .class is User::ActiveRecord_Relation

# Joins
    # Uses associations to join tables
    # joins() / left_outer_joins()
        # takes association names as parameters
    # returns ActiveRecord::Relation

# Using Select
    # use select to select column names you want returned in your results
    # users = User.select(:name, :email)
    # users = User.select("name, email")

    # when using joins, you must include the joined table's columns in select in order to have access to columns from the joins table
    # default is only columns from primary table
    # users = User.joins(:post).select("user.*, posts.*")

# Pluck
    # accepts column names as arguments
    # returns an array of values of the specified columns
    # triggers an immediate query
    # others scopes must be constructed earlier
    # cannot be chained with any further scopes
        # must be at the end of the query

# Code Demo: Look at bluebird (chirp.rb)

# N+1 Queries
    # When you execute a query and then you try to run queries for each member of the collection
    chirps = user.chirps
    res = {}
    chirps.each do |chirp|
        res[chirp] = chirp.likes.count
    end
    # You make 1 query for user.chirps. For N chirps, you make a query to find the likes for each chirp. This is an N+1 query

# Includes and Eager Loading for N+1 Queries
    # includes takes association names as parameters
    # allows us to chain onto our queries and pre-fetch associations
        # generates a 2nd query to pre-fetch associated data
    # Eager loading is pre-fetching associated objects using as few queries as possible and caching the results.

    chirps = user.chirps.includes(:likes)
    res = {}
    chirps.each do |chirp|
        res[chirp] = chirp.likes.length
    end

# Joins for N+1 Queries
    # Creates a single query fetching all data into a single table
    # Ideally used when using aggregation on the associated data e.g. count

    chirps = user
        .chirps 
        .select("chirps.*, COUNT(*) as likes_count")
        .joins(:likes)
        .group("chirps.id")

    chirps.map do |chirp|
        [chirp.body, chirp.likes_count]
    end
