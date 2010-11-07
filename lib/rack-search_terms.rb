require 'rack/utils'

module Rack
  class SearchTerms
    include Rack::Utils
    
    def initialize app
      @app = app
    end
    
    def call env
      @env = env
      @env.merge! 'search_terms' => search_terms if search_terms
      @app.call @env
    end
    
    def referer
      @env['HTTP_REFERER']
    end
    
    def search_terms
      case referer 
      when /^http:\/\/www\.google\..*?\/imgres/
        prev = terms_from_param 'prev'
        parse_query(prev.split('?')[1])['q']
      when /^http:\/\/www\.google\..*?\//
        terms_from_param 'q'
      when /^http:\/\/www.bing.com/
        terms_from_param 'q'
      end
    end
    
    def terms_from_param param
      parse_query(URI.parse(referer).query)[param]
    end
    
    def self.version; '0.1.0'; end
  end
end
