module Rack
  class SearchTerms
    def initialize app
      @app = app
    end
    
    def call env
      @app.call env
    end
    
    def self.version; '0.1.0'; end
  end
end
