## メッセージアプリ
メッセージを送信するフォーム画面と、送信されたメッセージを一覧表示するビュー画面を(なるべくシンプルに)作る

![figure](https://user-images.githubusercontent.com/20487308/44131407-c3cf0d56-a08d-11e8-9a3c-c27c9c75278c.png)

## 実行環境
- Ruby 2.4.2
- Rails 5.2.1
- MySQL 5.7

## 実行手順

- クローン

```
git clone git@github.com:youichiro/message-app-with-django.git
cd message-app-with-rails
```

- データベースの作成

```
mysql -u root -p
> create database message_app_with_rails_development
```

- Gemのインストール

```
bundle install --path vendor/bundle
```

- データベースの設定

```
cp config/database.yml.example config/database.yml
# config/database.ymlのpasswordを記入する
```

- マイグレーション

```
bundle exec rails db:migrate
```

- 起動

```
bundle exec rails s
# localhost:3000/viewを開く
```

