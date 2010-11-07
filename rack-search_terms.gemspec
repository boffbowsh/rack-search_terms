# -*- encoding: utf-8 -*-
require File.expand_path("../lib/rack-search_terms", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rack-search_terms"
  s.version     = Rack::SearchTerms.version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Paul Bowsher']
  s.email       = ['paul.bowsher@gmail.com']
  s.homepage    = "http://rubygems.org/gems/rack-search_terms"
  s.summary     = "Rack Middleware to extract search terms from the referring search engine"
  s.description = "Rack::SearchTerms gives your app access to the search terms that drove the visitor to your site"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rack-search_terms"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.1.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
