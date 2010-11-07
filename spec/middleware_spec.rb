require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rack::SearchTerms do
  
  before :each do
    @app = mock('app')
  end

  it "should pass through environment to the underlying app" do
    expect_env 'HTTP_REFERER' => 'http://www.example.com/', 'x-foo' => 'x-bar'
    Rack::SearchTerms.new(@app).call({'HTTP_REFERER' => 'http://www.example.com/', 'x-foo' => 'x-bar'})
  end
end

def expect_env hash={}
  @app.should_receive(:call).with( hash_including(hash) )
end

def mock_request referer
  Rack::SearchTerms.new(@app).call({'HTTP_REFERER' => referer})
end