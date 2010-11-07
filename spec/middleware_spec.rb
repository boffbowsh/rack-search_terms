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
    expect_env 'search_terms' => 'how now brown cow'
    mock_request "http://www.google.com/?q=how%20now%20brown%20cow" do |middleware|
      middleware.stub(:search_terms) {'how now brown cow'}
    end
  end
  
  context "term parsing" do
    it_should_work_for "Google", :from => "http://www.google.com/url?sa=t&source=web&cd=1&ved=0CBUQFjAA&url=http%3A%2F%2Fwww.rawnet.com%2Fblog%2Fmake-my-logo-bigger&rct=j&q=rawnet%20logo&ei=6CPXTJSmCMq6jAehivCwCQ&usg=AFQjCNFa4cEzkMUJXaEpTWedLibVVVOz-w&sig2=eOu7V345cOW9xh9HjG36hQ", :as => 'rawnet logo'
    it_should_work_for "Google UK", :from => "http://www.google.co.uk/url?sa=t&source=web&cd=1&sqi=2&ved=0CBUQFjAA&url=http%3A%2F%2Fwww.rawnet.com%2Fblog%2Fmake-my-logo-bigger&rct=j&q=rawnet%20logo&ei=sSPXTKn1OIK6hAex86n5BA&usg=AFQjCNFa4cEzkMUJXaEpTWedLibVVVOz-w&sig2=NfPNOdDvdT_u4JBsxH-OTQ", :as => 'rawnet logo'
    it_should_work_for "Google Images", :from => "http://www.google.com/imgres?imgurl=http://www.rawnet.com/system/logos/18/thumb/logo.jpg%3F1286466114&imgrefurl=http://www.rawnet.com/news&usg=__Ag-l2Kt0yNDIUoOby8Q8bEKbWQ8=&h=66&w=95&sz=18&hl=en&start=0&sig2=YrkGnaNORciIKLuxBZm3_w&zoom=1&tbnid=OmO0aEU9ZGSuUM:&tbnh=61&tbnw=88&ei=YyPXTJGtLIOzhAef7sTFBQ&prev=/images%3Fq%3Drawnet%2Blogo%26hl%3Den%26safe%3Doff%26qscrl%3D1%26biw%3D1196%26bih%3D888%26tbs%3Disch:1&itbs=1&iact=hc&vpx=206&vpy=314&dur=1089&hovh=61&hovw=88&tx=107&ty=17&oei=YyPXTJGtLIOzhAef7sTFBQ&esq=1&page=1&ndsp=26&ved=1t:429,r:6,s:0", :as => 'rawnet logo'
    it_should_work_for "Bing", :from => 'http://www.bing.com/search?q=rawnet+logo&go=&form=QBLH&filt=all&qs=n&sk=', :as => 'rawnet logo'
  end
end