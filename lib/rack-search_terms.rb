module Rack
  class SearchTerms
    def initialize app
      @app = app
    end
    
    def call env
      env.merge! 'search_engine' => search_engine if search_engine
      env.merge! 'search_terms' => search_terms if search_terms
      @app.call env
    end
    
    def search_engine
    end
    
    def search_terms
    end
    
    def self.version; '0.1.0'; end
  end
end
