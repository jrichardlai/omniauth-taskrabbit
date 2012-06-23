require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class TaskRabbit < OmniAuth::Strategies::OAuth2
      option :name, "taskrabbit"
      
      option :client_options, {
              :site => "https://www.taskrabbit.com",
              :authorize_url => '/api/authorize',
              :request_token_url  => "/api/oauth/request_token",
              :token_url          => '/api/oauth/token'
            }

      option :access_token_options, {
        :header_format => 'OAuth %s',
        :param_name => 'access_token'
      }

      uid { raw_info['id'] }

      info do
        prune!({
          'email' => raw_info['email'],
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info['last_name'],
          'full_name' => raw_info['full_name'],
          'zip_code' => raw_info['zip_code'],
          'city' => raw_info['city'],
        })
      end
      
      extra do
        prune!({
          'raw_info' => raw_info
        })
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/account').parsed
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'taskrabbit', 'TaskRabbit'