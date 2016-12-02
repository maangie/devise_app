# devise を使った認証システムのテストアプリ
認証システムのテストです。
この API サーバは以下のことができます。

1. ユーザの登録
2. ログイン
3. ユーザ情報の取得

## System dependencies
- ruby 2.3.3

## Getting started
```bash
% gem install bundler
% git clone https://github.com/maangie/devise_app.git
% cd devise_app
% bin/bundle
% rails db:migrate
% rails server
```

## API
### エンドポイント
```
/api/v1/
```

#### 返り値
成功した場合、ユーザの情報を JSON で返します。

##### ユーザ情報
|要素         |説明                                                                              |
|:-----------|:----------------------------------------------------------------------------------|
|id          |ユーザID                                                                           |
|email       |メールアドレス                                                                     |
|access_token|Access・トークン (`:` で区切られた先頭の数列がユーザIDを表します)                  |
|created_at  | ユーザ作成日時                                                                    |
|updated_at  |ユーザ情報更新日時 (実際にはユーザ情報更新機能を持っていないので、意味はありません)|

### ユーザの登録
```
POST /api/v1/users
```
`POST` パラメータとして `user[email]` と `user[password]` を設定します。

#### 例:
```bash
curl localhost:3000/api/v1/users --data "user[email]=user@example.com&user[password]=password"
```

### ログイン
```
POST /api/v1/login
```
`POST` パラメータとして `email` と `password` を設定します。

#### 例
```bash
curl localhost:3000/api/v1/login --data "email=user@example.com&password=password"
```

### ユーザ情報の取得
```
GET /api/v1/users/:id
```
ヘッダ `Authorization` に Access・トークンを設定します。

#### 例
```bash
curl -X GET -H 'Authorization: 16:Ss1ZJ4yQS7aRVaCNLeQR' localhost:3000/api/v1/users/16
```
