require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rack::SearchTerms do
  
  before :each do
    @app = mock('app')
  end

  it "should pass through environment to the underlying app" do
    expect_env 'HTTP_REFERER' => 'http://www.example.com/', 'x-foo' => 'x-bar'
    Rack::SearchTerms.new(@app).call({'HTTP_REFERER' => 'http://www.example.com/', 'x-foo' => 'x-bar'})
  end
  
  it "should pass the search terms and engine on to underlying app" do
    expect_env 'search_terms' => 'how now brown cow', 'search_engine' => 'Google'
    mock_request "http://www.google.com/?q=how%20%now%20brown%20cow" do |middleware|
      middleware.stub(:search_terms) {'how now brown cow'}
      middleware.stub(:search_engine) {'Google'}
    end
  end
end

def expect_env hash={}
  @app.should_receive(:call).with( hash_including(hash) )
end

def mock_request referer
  middleware = Rack::SearchTerms.new(@app)
  yield middleware if block_given?
  middleware.call({'HTTP_REFERER' => referer})
end