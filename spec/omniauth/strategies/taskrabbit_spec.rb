require 'spec_helper'
require 'omniauth-taskrabbit'
require 'openssl'
require 'base64'

describe OmniAuth::Strategies::TaskRabbit do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }
    @request.stub(:env) { {} }

    @client_id = '123'
    @client_secret = '53cr3tz'
  end

  subject do
    args = [@client_id, @client_secret, @options].compact
    OmniAuth::Strategies::TaskRabbit.new(nil, *args).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'has correct TaskRabbit site' do
      subject.client.site.should eq('https://www.taskrabbit.com')
    end

    it 'has correct authorize url' do
      subject.client.options[:authorize_url].should eq('/api/authorize')
    end

    it 'has correct token url' do
      subject.client.options[:token_url].should eq('/api/oauth/token')
    end
  end
end
