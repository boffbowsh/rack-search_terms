require 'rspec'

Rspec.configure do |c|
  c.mock_with :rspec
end

def expect_env hash={}
  @app.should_receive(:call).with( hash_including(hash) )
end

def mock_request referer
  middleware = Rack::SearchTerms.new(@app)
  yield middleware if block_given?
  middleware.call({'HTTP_REFERER' => referer})
end

def it_should_work_for name, options
  it "should work for #{name}" do
    expect_env 'search_terms' => options[:as]
    mock_request options[:from]
  end
end