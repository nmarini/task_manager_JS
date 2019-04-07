# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
Using Ruby version 2.3.6
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
A User has many Tasks and has many Lists, and a List has many Tasks, a Task has many Users
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
A List belongs to a user,, a task belongs to a list, a users_task belongs to a user and blongs to a task
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
A User has many Tasks through Users_Task, a Task has many Users through Users_Task
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
Includes the attribute 'accepted', which is defaulted to false until the User 'accepts' the task (i.e. change the value of 'accepted' to true)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Validates User(:name, :email, :password, :passwod_confirmation), Task(:title), List(:title)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
UsersTask.unaccepted_by(user) = returns true or false depending on if user has accepted the users_task
UsersTask.false_accepted = returns all Users who have not accepted their users_task
- [x] Include signup (how e.g. Devise)
get '/signup' => 'users#new'
- [x] Include login (how e.g. Devise)
get '/login' => 'session#new'
- [x] Include logout (how e.g. Devise)
get '/logout' => 'session#destroy'
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
get '/auth/facebook/callback' => 'session#create'
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
Lists are nested under Users
Tasks are nested under Lists
Users are nested under tasks 
Tasks are nested under Users
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
lists/:id/task/new
users/:id/list/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
Validations for forms on Users, Lists, and Tasks forms are included

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
