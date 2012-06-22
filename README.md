# OmniAuth TaskRabbit

TaskRabbit OAuth2 Strategy for OmniAuth 1.0.

Supports the OAuth 2.0 server-side and client-side flows.

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-taskrabbit'
```

Then `bundle install`.

## Usage

Add to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :taskrabbit, ENV['TR_API_KEY'], ENV['TR_SECRET']
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'taskrabbit',
  :uid => 283559,
  :info => {
    :email => "sponge.bob@example.com"
    :first_name => "Bob",
    :last_name => "Sponge",
    :full_name => "Bob Sponge",
    :zip_code => "21314",
  },
  :credentials => {
    :token => 'oXOIDNEOInwiewniwnaiNSiocnione', # OAuth 2.0 access_token, which you may wish to store
    :expires => false
  },
  :extra => {
    :raw_info => {
      :id => 283559,
      :zip_code => "21314",
      :first_name => "Bob",
      :last_name => "Sponge",
      :full_name => "Bob Sponge",
      :short_name => "Bob",
      :display_name => "Bob S.",
      :email => "sponge.bob@example.com",
      :links => {
        :avatar_url => "https://www.taskrabbit.com/images/default_avatars/poster_thumb.png",
        :get => "/api/v1/users/283559"
      },
      :tasks => {
        :links => {
          :get => "/api/v1/users/283559/tasks",
          :last => "/api/v1/users/283559/tasks?page=1",
          :first => "/api/v1/users/283559/tasks?page=1"
        }
      },
      :locations => {
        :links => {
          :get => "/api/v1/users/283559/locations"
        }
      },
      :counts => {
        :posted_tasks => 5,
        :ongoing_tasks => 2,
        :active_tasks => 1
      }
    }   
  }
}
```