# Introduction to Rails

## MVC

* **Model**
  * It's a doorkeeper to external data abstractions.
* **View**
  * Presents model states to the world.
* **Controller**
  * The man in between both worlds. It receives requests, gather the data from Models and delegate to the proper view.

Being strict those responsibilities are independent and one must not interfere with each other.

## Rails File Structure

* **app**
  * assets: images, CSS and JavaScript
  * controllers
  * helpers: business logic that is very close to the views. Useful for preventing duplicated and complex code
  * jobs: asynchronous tasks
  * mailers: views for emails
  * models
  * views
* bin
* **config**
  * environments: you have different requirements developing, testing and under production. This allows you to configure your application properly
  * initializers: ran before starting the application with configurations that are expected to get set during rails initialization
  * locales: translations
  * application.rb: main configuration file
  * boot.rb
  * database.yml: information on how to connect to the database
  * environment.rb: includes every other environment
  * routes.rb: tells the applications which URLs are mapped to which controller method
  * secrets.yml: security setting to avoid mainly MIM attacks. Your production token MUST be kept secret!
* **db**
  * migrate: holds atomic transformations to the database keeping the evolution history
  * schema.rb: the concrete representation of the current database structure
  * seeds.rb: data the must be present when your application gets installed
* lib: Code that has no direct link with your application core but still is necessary in some way
* log
* public: everything under this folder is directly accessible
* tmp
* vendor: code that you are not the maintainer but neither is packaged
* Gemfile: dependencies list
* Gemfile.lock: lock after interdependency resolution
* Rakefile
* config.ru

## Naive Mistakes

Rails is a **framework** for web development. If you do not want to comply with its standards (convention over configuration, DRY - don't repeat yourself) you are going to have a hard life. There is no free lunch. Said that we have this list:

* Business logic mixed with views or controllers
* bundler through Gemfile is one the best dependency manager available. Be wise and abuse it
  * before implementing something common look for a gem that does the job for you
  * look first for the most popular ones on rubygems.org
  * check for activity. If it has stalled for long it probably will give you more compatibility problems than a solution to your problem
* Do always keep your gems up to date. It's a small cost amortized over the days but a huge cost if done only once a time large time interval
* Install RVM (rvm.io). It handles multiple Rubies enabling you to keep up to date with the releases
* Read the rails guide (guide.rubyonrails.org) if it is not enough try to read code from known applications and reach experienced developers