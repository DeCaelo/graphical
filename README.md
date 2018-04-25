# Graphical

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

* Official website: http://www.phoenixframework.org/
* Guides: http://phoenixframework.org/docs/overview
* Docs: https://hexdocs.pm/phoenix
* Mailing list: http://groups.google.com/group/phoenix-talk
* Source: https://github.com/phoenixframework/phoenix

```ruby
  mix phx.new graphical --no-html --no-brunch
```

```ruby
mix do deps.get, compile
```

```ruby
mix phx.gen.json Accounts User users name:string email:string
```

```ruby
mix phx.gen.json Posts Post posts title:string body:text user_id:references:users
```

```
psql
CREATE ROLE postgres LOGIN CREATEDB PASSWORD 'postgres';
```

```ruby
mix ecto.create
mix ecto.migrate
```

### add seeds with faker:

```ruby
mix run priv/repo/seeds.exs
```

### server:

```ruby
mix phx.server
http://localhost:4000/graphiql
```

#### create post mutation:

```js
mutation CreatePost {
  create_post(title:"new post", body:"This is new post", user_id:2){
    id
  }
}
```

```js
{
  posts {
    title,
    body
  }
}
```

#### update post mutation:

```js
mutation UpdatePost {
  update_post(id:11, post:{title:"updated post", body:"this post was updated", user_id:2}) {
    id,
    title,
    body
  }
}
```

#### delete post mutation:

```js
mutation DeletePost {
  delete_post(id:11) {
    id,
  }
}
```

#### generate guardian secret key:

```ruby
mix guardian.gen.secret
gu+sCATTZK1cQ7PaOqiEKdbWOr/oKocUnyTdx/Cx7fwuISwTuAmSnr6uXTvMie7K
```

docs: https://github.com/ueberauth/guardian

#### new migration with password hash:

```ruby
mix ecto.gen.migration add_password_hash
```

& alter users table with password_hash string:

```ruby
alter table(:users) do
  add :password_hash, :string
end
```

=> mix ecto.migrate

#### update user:

```ruby
{
  user(id:1) {
    name,
    email
  }
}
```

```ruby
mutation UpdateUser {
  update_user(id:1, user:{name:"Jake Doe", email:"test@example", password:"random"}) {
    id
  }
}
```

#### add context plug to authorize with jwt:

```ruby
mix ecto.gen.migration add_token_to_users
```
