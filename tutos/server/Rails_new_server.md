Rails new server
================

## Generate a new project with Rails

```
    $ rails new PROJECT_NAME
    $ cd PROJECT_NAME
    $ bundle install # (should be already done by the new command).
```

## Additionnal gems that you may required

- **figaro** (Environnement variables)
- **kaminari** (Pagination)
- **api-pagination** (Pagination headers)
- **digest-sha3** (Sha3 (for Sha3_512 fitting))
- **devise** (User class)
- **pundit** (Authorization)
- **doorkeeper** (Oauth (API authentification))
- **pg** (if postgres selected)
- **sqlite3** (if sqlite selected)
- **nested_scaffold** (in need of nesting resources, will help you with views nested etc...)
- **===========** (With Front-End)
- **foundation-rails** (foundation (quick design generation))
- **active_link_to**
- **rails_layout**
- **high_voltage** (Static pages at app/views/pages/)
- **===========** (development)
- **pry-rails** (fancy console)
- **sdoc** (doc generator)
- **seed_dump** (dump db into ruby script (usable as seeds))

(`bundle install`)

## Database

Edit your `config/database.yml` in order to fit the database system you've selected and name the databases.

```
    rake db:create
    rake db:migrate
```

### SQLite

```
```

### PostgresSQL

If you'd like to have `uuid` as id for your items in your models (which could be convinient for example if you don't want to give indication about how much items you have in your table), follow this steps:

```
    $ # if (using `pg`) you want to have uuid as id for your models (you'll have to ask it for every new model).
    $ # -- Go to `/examples/EnableUuidExtension.rb` to see what content to put into the migration.
    $ rails g migration EnableUuidExtension
```

```
    $ sudo su - postgres
    # psql postgres
   =# create role your_login with createdb login;
   =# alter user your_login with SUPERUSER;
   =# \q
```

## Pre-installation steps to follow

```
    $ # devise
    $ rails g devise:install
    $ # -- Follow the instructions
    $ rails g devise User
    $ rake db:migrate
    $
    $ # pundit
    $ rails g pundit:install
    $
    $ # doorkeeper
    $ rails g doorkeeper:install
    $ rails g doorkeeper:migration
    $ rake db:migrate
    $
    $ # with front
    $ rails g devise:views
    $ rails g doorkeeper:views
```

## Configuration

### Doorkeeper

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

## Rake

Add this task to your `Rakefile` so you will be able to manage the rails process easier.

```
    desc 'stop rails'
    task :stop do
      pid_file = 'tmp/pids/server.pid'
      if File.exist? pid_file then
        pid = File.read(pid_file).to_i
        Process.kill 15, pid
        File.delete pid_file
      else
        puts "Rails was not running."
      end
    end

    desc 'print the pid of rails'
    task :pid do
      pid_file = 'tmp/pids/server.pid'
      if File.exist? pid_file then
        puts File.read(pid_file).to_i
      else
        puts "Rails is not running."
      end
    end
```
