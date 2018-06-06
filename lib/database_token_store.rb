require 'googleauth/token_store'
module Google
  module Auth
    module Stores
      class DatabaseTokenStore < Google::Auth::TokenStore
        def load(id)
          user = User.find(id)
          {
            access_token: user.token,
            refresh_token: user.refresh_token,
            scope: user.scope
          }.to_json

        end
        def store(id, token)
          user = User.find(id)
          hsh = JSON.parse(token)

          # note: scope is auto updated
          user.update(
            token: hsh['access_token'],
            refresh_token: hsh['refresh_token'],
            scope: hsh['scope'].join(' ')
          )
        end
      end
    end
  end
end
