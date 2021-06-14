# From Zero to Deployment

- Ruby on Rails(Rails) is free and OpenSource Web deployment framework written in the Ruby programming language.
- Rails has rapidly become famous as a tool for developing full-scale Web-serveces, and has been adopted not only by world-famous companies such as [GitHub](https://github.co.jp/), [Airbnb](https://www.airbnb.jp/), [SoundCloud](https://ja.wikipedia.org/wiki/SoundCloud), [Disney](https://www.disney.co.jp/), [Hulu](https://www.hulu.jp/), and [Shopify](https://www.shopify.jp/), but also by services such as [note](https://note.com/), [Cookpad](https://cookpad.com/), [Progate](https://prog-8.com/?utm_source=rails_tutorial), and [Qiita](https://qiita.com/) in Japan.

- Rails6 is addition to [email routing] and [rich text features], and introduces new advanced features such as [parallel test] and [support for multiple databases].

## Prerequisite knowledge

![Study_road_map](study_map.png)





## Try to move it

### What does it mean to be "Proficient"?

![Proficient_sheet](tech_support_cheat_sheet_ja.png)

### Develptment environment

- Using Cloud9(AWS) as a development environment

### Installing Rails

> Configuration the `.gemrc` file not to install the Ruby document.

`$ echo "gem: --no-document" >> ~/.gemrc`

> Installing Rails with a specific version

`$ gem install rails -v 6.0.3`

### First application

- create a simple application that displays the string "hello world!" on a web page

> Running `rails new`(specifiying the version number)

`rails _6.1.3.2\_ new hello_app`

> The Directory structure of a newly created Rails application

| **ディレクトリ** | **用途**                                                     |
| ---------------- | ------------------------------------------------------------ |
| `app/`           | Application code including Model, View, Controller, Helper etc |
| `app/assets`     | CSS(Cascading Style Sheet), JavaScript file, image and other assets |
| `bin/`           | binary executable file                                       |
| `config/`        | Application Settings                                         |
| `db/`            | Database-related files                                       |
| `doc/`           | Documantation for application, including manual              |
| `lib/`           | Library and module repository                                |
| `log/`           | Application log file                                         |
| `public/`        | Data that is directly exposed to the public(e.g. web browsers), such as error pages |
| `bin/rails`      | Rails scripts used for code generation, starting the console, launching the local web server, etc |
| `test/`          | Testing the Application                                      |
| `tmp/`           | Tempolary file                                               |
| `README.md`      | A brief description of the application                       |
| `Gemfile`        | Definition file of Gem required for the application          |
| `Gemfile.lock`   | a list to check the version of the gem used in application   |
| `config.ru`      | Configuration file for [Rack middleware](https://rack.github.io/) |
| `.gitignore`     | Patterns for specifying which files you don't want to include in Git |

### bundler

> Reflash the contents of the Gemfile

```ruby
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails',			'~> 6.1.3', '>= 6.1.3.2'
gem 'sqlite3', 		'~> 1.4'
gem 'puma', 			'~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', 	'~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', 	'~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
	gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
```

> Installing Gems

`$ bundle install`

### Model-View-Controller (MVC)

<img src="mvc_schematic.png" alt="Model-View-Controller" style="zoom:75%;" />

### Hello, world!

> Add `hello` to Application controller

```ruby
class ApplicationController < Actioncontroller::Base
  
  def hello
    render html: "hello world!"
  end
end
```

> Settings root routing

```ruby
Rails.application.routes.draw do
	root 'application#hello'
end
```

## Version Control with Git

- Benefits
  - You can follow the code history of a project
  - You can rollback files that have been accidentally deleted

### Install and Setup

> Settings Your name and email in Git

```shell
$ git config --global user.name "Your name"
$ git config --global user.email YOUR_EMAIL_ADDRESS
```

> Settings `git co` in check out aliases

`git config --global alias.co checkout`

> Settings Git to Retain Passwords for a Certain Amount of Time

`git config --global credential.helper "cache --timeout=86400"`

## Deploying

- Heroku is hosting platforms for Ruby web apps including Rails

### Setting up and deploying Heroku

> `Gemfile` with additions and sorting

```ruby
source 'https://rubygems.org'
...
group :production do
	gem 'pg', '~> 1.2', '>= 1.2.3'
end
```

> installing a non-production gem

`bundle install --without production`

> Create new application to Heroku

`heroku create`

# Toy Application

- Using scaffold generator
- Consider the REST(Representasional State Transfer) architecture

#### The sweet temptation of Scaffold is too easy.

- `scaffold` is very userful, but useless

## Planning the Application

### Designing Model of the user

> The user data model 

![users_model](demo_user_model.png)

### Designing Model of the Micropost

> The micropost data model

![micropost model](demo_micropost_model.png)

## Users resource

- Users resource can be regarded as an object that can be freely post/get/update/delete via the HTTP protocol

> Creating a users resource using scaffold

`rails generate scaffold User name:string email:string`

> Migrating database

`rails db:migrate`

## Exploring the user page

| **URL**       | **Action** | **Purpose**                          |
| ------------- | ---------- | ------------------------------------ |
| /users        | `index`    | Page to list all users               |
| /users/1      | `show`     | Page to display the user with id=`1` |
| /users/new    | `new`      | Page to create a new user            |
| /users/1/edit | `edit`     | Page to edit the user with id=`1`    |

## MVC Behavior

1. Send request from brower to the Rails server with the URL "/users"
2. "/users" request will be assigned to the index action in the Users controller by the Rails routing structure
3. Running index action and from there it queries the User model to "retrieve all users"(`User.all`) 
4. The User model receives a query and retrieves all users from the database
5. return the list of users retrieved from the database form the User model to the controller
6. The Users controller stores the list of users in the @users variable and passes it to the index view
7. The index view will be launched, and the ERB(Embedded Ruby) vill be executed to generate the HTML
8. The controler takes HTML generated by the view and returns it to the browser

<img src="mvc_detailed.png" alt="Model-View-Controller" style="zoom:75%;" />

> Roles for the Users resource used in the Rails root
>
> Add Routes from Root to Users

```ruby
Rails.application.routes.draw do
  resources :users
  root 'users#index'
end
```

> The Users controller framework

```ruby
class UsersController < ApplicationController
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end
```

- REpresentational State Transfer(REST)
  - REST is one of the architectual styles for building distributed and networked systems and applications, such as the Internet itself and web applications

> Concise User  `index` action in the Toy Application

```ruby
class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
```

> User Model in the Toy Application

```ruby
class User < ApplicationRecord
end
```

> View Corresponding to the index Action

```erb
<h1>Users</h1>

<tbody>
	<% @user.each do |user| %>
  	<tr>
  		<td><%= user.name %></td>
      <td><%= user.email %></td>
      <td><%= link_to 'Show', user %></td>
      <td><%= link_to 'Edit', edit_user_path(user) %></td>
      <td><%= link_to 'Destroy', user, method: :delete, 
											 data: { confirm: 'Are you sure?' } %></td>
  	</tr>
  <% end %>
</tbody>
```

### Drawbacks of Users resource

- Data has not been verified
- User authentication has not been performed
- Test has not been write
- Layout and style are not in place
- Difficultly understanding

## Microposts Resource

> Creating Microposts resource using scaffold

`rails generate scaffold Micropost content:text user_id:integer`

> updated database

`rails db:migrate`

### Microposts to micro

> Limit the maximum number of characters in a micropost to 140

```ruby
class Micropost < ApplicationRecord
  validates :content, length: { maximum: 140 }
end
```

### Users has many microposts

> One user has many microposts

```ruby
class User < ApplicationRecord
  has_many :microposts
end
```

> One micropost belongs to one user only

```ruby
class Micropost < ApplicationRecord
  belongs_to :user
end
```

> Associating a micropost with a user

![Associating a micropost with a user](/Users/shinzanmono/Documents/rails_app/doc/micropost_user_association.png)

# Creating mostly static pages

## static pages

> Changed to Git branch 

`git checkout -b static-pages`

### creating static pages

> Creating StaticPages Controller

`rails generate controller StaticPages home help`

> Add staticpages controller to Git repository

`git add . && git commit -m 'Add a Static Pages controller'`

`git push`

#### How to Undo

> Controller

`rails generate controller StaticPages home help`

`rails destroy  controller StaticPages home help`

> Model

`rails generate model User name:string email:string`

`rails destroy  model User name:string email:string`

> Database

`rails db:migrate`

`rails db:roolback`

> Routing Used by `home` and `help` Actions in the StaticPages Controller

```ruby
Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'application#hello'
end
```

> StaticPagesController generated in `rails g controller StaticPages home help`

```ruby
class StaticPagesController < ApplicationController
  def home
  end
  
  def help
  end
end
```

> View generated for Home page

```erb
<h1>StaticPages#home</h1>
<p>Find me in app/views/static_pages/home.html.erb</p>
```

> View generated for Help page

```erb
<h1>StaticPages#help</h1>
<p>Find me in app/views/static_pages/help.html.erb</p>
```

### Adjusting Static Pages

> Modifying the HTML of the home page

```erb
<h1>Sample App</h1>
<p>
  This is the home page for the
  <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
  sample application.
</p>
```

> Modifying the HTML of the help page

```erb
<h1>Help</h1>
<p>
  Get help on the Ruby on Rails Tutorial at the
  <a href="https://railstutorial.jp/help">Rails Tutorial help page</a>.
  To get help on this sample app, see the
  <a href="https://railstutorial.jp/#ebook"><em>Ruby on Rails Tutorial</em>
  book</a>.
</p>
```

## Start with Testing

- Add About Page to StaticPagesController
- Writing Tests and perform automated testing

#### When shuld I do the test after all?

- If the tests are written, they can prevent __regression bugs__ that can lead to functional failure
- If the tests are written, the code can be safely refactored
- Test Code acts as a client from the point of view of the application code. So it is useful for designing applications and deciding how to interface with other parts of the system

- When shuld I write Tests?
  - If test code is clearly shorter and simpler than application code, than write it "first"
  - If the specifics of the behavior have not yet been finalized, write the application code first and ecpected behavior "later"
  - Write tests "ahead of time" when security is a critical issue or when errors occur around security
  - When you find a bug, write a tests "ahead of time" the reproduces the bug to prevent regression bugs before starting to fix it
  - Write tests "later" for code that is likely to change again soon
  - When refactoring, write tests "first". In particular, concentrate on testing code that is likely to make errors or stop

### First Testing

> Default Test to StaticPagesController

```ruby
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get static_pages_home_url
    assert_responce :success
  end
  
  test "should get help" do
    get static_pages_help_url
    assert_responce :success
  end
end
```

### Red

- __The Test-Driven Development Cycle__
  1. Write tests "first" that fail
  2. Write code for the application and make it successful
  3. Refactoring if necessary

> Test for About Page(RED)

```ruby
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
	...
  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end
end
```

### Green

> Add a rooting for `about`

```ruby
Rails.application.routes.draw do
  ...
  get 'static_pages/about'
end
```

> StaticPagesController with the about Action added

```ruby
class StaticPagesController < ApplicationController
  ...
  def about
  end
end
```

> Code of About page

```erb
<h1>About</h1>
<p>
  <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
  is a <a href="https://railstutorial.jp/#ebook">book</a> and
  <a href="https://railstutorial.jp/screencast">screencast</a>
  to teach web development with
  <a href="https://rubyonrails.org/">Ruby on Rails</a>.
  This is the sample application for the tutorial.
</p>
```

### Refactor

- Refactoring helps keep the code beautiful and compact and does not discourage other developers or your future self from developing

## Slightly dynamic pages

- Rewrite the Title of page to display it by itself
- The title Tag also plays an important role in so-called SEO(Search Engine Optimization)

> Temporarily changing filename

`mv app/views/layouts/application.html.erb layout_file`

### Testing Title

> Typical HTML Structure of a Web Page

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Greeting</title>
  </head>
  <body>
    <p>Hello, world!</p>
  </body>
</html>
```

> Testing Title of StaticPagesController

```ruby
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    ...
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    ...
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    ...
    assert_select "title", "About | Ruby on Rails Tutorial Sample App"
  end
end
```

### Add Title

> Change title of View Home page

```erb
<html>
  <head>
    <title>Home | Ruby on Rails Tutorial Sample App</title>
  </head>
</html>
```

> Change title of View Help page

```erb
<html>
  <head>
    <title>Help | Ruby on Rails Tutorial Sample App</title>
  </head>
</html>
```

> Change title of View About page

```erb
<html>
  <head>
    <title>About | Ruby on Rails Tutorial Sample App</title>
  </head>
</html>
```

> Test of StaticsPagesController using basic_title

```ruby
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    ...
    assert_select "title", "Home | #{@base_title}"
  end
  ...
end
```

### Layout and Embed Ruby (Refactor)

- Problem
  - The titles of the pages are almost same
  - The words "Ruby on Rails Tutorial Sample App" are repeated in three different titles
  - The entire HTML structure is duplicated on each page
- Repeating the same code violates the Ruby principle of "DRY" (Don't Repeat Yourself)

> View of the Home page with ERB in the title

```erb
<% provide(:title, "Home") %>
...
<title><%= yield(:title) %> | Ruby on Rails Tutorial Sample App</title>
```

- The same applies to Help page and About page

> Undo filename

`mv layout_file app/views/layouts/application.html.erb`

> Layout of Sample Application
>
> - csrf_meta_tags implement [Content Security Policy (CSP)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP) to mitigate  [cross-site scripting](https://developer.mozilla.org/en-US/docs/Glossary/Cross-site_scripting) atacks
> - `csrf_meta_tags` to mitigate [Cross-Site Request Forgery(CSRF)](https://developer.mozilla.org/ja/docs/Glossary/Cross-site_scripting) atacks

```erb
<!DOCTYPE html>
<html>
  <head>
    <title><%= yield(:title) %> | Ruby on Rails Tutorial Sample App</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <%= stylesheet_link_tag    'application', media: 'all',
                               'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag    'application',
                               'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```

> Home page with the HTML structure removed

```erb
<% provide(:title, "Home") %>
```

- The same applies to Help page and About page

### Routing Configuration

> Settings Home page as the Root URL

```ruby
Rails.application.routes.draw do
  root 'static_pages#home'
end
```

> Test for Root routing

```ruby
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_url
    assert_response :success
  end
  ...
end
```

> Comment out the root routing to make the test fail

```ruby
Rails.application.routes.draw do
  # root 'static_pages#home'
end
```

## Finally

```shell
git add -A
git commit -m "Finish static pages"
git checkout main
git merge static-pages
git push
rails test
git push heroku
```

## Advances Setup

> Change Git branch

`git co main`

### minitest reporters

> Enabling Tests to Display Red and Green (test/test_helper.rb)

```ruby
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!
...

```

### The Automation with Guard

> initialize guard

`bundle exec guard init`

> Customized `Guardfile`

```ruby
guard :minitest, spring: "bin/rails test", all_on_start: false do
  ...
end
```

> Running

`guard exec guard`

> Do commit

`git commit -am "Complete advanced testing setup`"

# Rails flavored Ruby 

