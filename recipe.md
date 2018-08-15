## Railsのインストール

```
mkdir message-app-with-rails
cd message-app-with-rails
bundle init
echo "gem 'rails', '5.2.1'" >> Gemfile
bundle install --path vendor/bundle
```

## プロジェクトの作成

```
bundle exec rails new . -d mysql
```

## データベースの設定

```config/database.yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: # ここにMySQLのパスワードを入力する
  socket: /tmp/mysql.sock

development:
  <<: *default
  database: message_app_with_rails_development  # ここでデータベースを指定する

...
```

## scaffold

```
bundle exec rails g scaffold messages text:text
```

## マイグレーション

```
bundle exec rails db:migrate
```

## ルーティングの変更

```config/routes.rb
Rails.application.routes.draw do
  resources :messages, only: [:index, :new, :create]
  get '/view' => 'messages#index'
  post '/view' => 'messages#create'
  get '/form' => 'messages#new'
end
```

## viewsの変更

```app/views/messages/index.html.erb
<p id="notice"><%= notice %></p>

<h1>Messages</h1>
<% @messages.each do |message| %>
  <p><%= message.text %></p>
<% end %>

<br>
<%= link_to 'New Message', form_path %>
```

```app/views/messages/new.html.erb
<h1>New Message</h1>

<%= render 'form', message: @message %>

<%= link_to 'Back', view_path %>
```

## 起動

```
bundle exec rails s
```
