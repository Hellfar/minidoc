Rails new server
================

## Generate a new project with Rails

```
    $ rails new PROJECT_NAME
    $ cd PROJECT_NAME
    $ bundle install
```

## Additionnal gems that you may required

- pry-rails
- devise
- pundit
- doorkeeper
- figaro
- kaminari
- api-pagination
- digest-sha3
- sdoc
- (seed_dump)

(`bundle install`)

## Pre-installation steps to follow

```
    $ # devise
    $ rails generate devise:install
    $ rails g devise:views
    $ rails generate devise User
    $ rake db:migrate
    $ # pundit
    $ rails g pundit:install
    $ # doorkeeper
    $ rails generate doorkeeper:install
    $ rails generate doorkeeper:migration
    $ rake db:migrate
```

## Configuration
You may replace your `resource_owner_authenticator` block in `config/initializers/doorkeeper.rb` with something similar:

```
    resource_owner_authenticator do
      current_user || head(401)
    end
```

## Initialization

Add `app/views/pages/index.html.erb` and complete it as your home page.
Update `config/routes.rb` so it routes to your your home page as a default page, example:

```
    root to: "pages#index"
```
