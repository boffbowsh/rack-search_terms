Rack::SearchTerms
=================

* Repository: [http://github.com/boffbowsh/rack-search_terms](http://github.com/boffbowsh/rack-search_terms)

Description
-----------

Rack::SearchTerms gives your app access to the search terms that drove the visitor to your site. Simply grab `env['search_terms']` in your Rack app and you're away!

Rails 3 Quick Start
-------------------

Add to your Gemfile:

    gem 'rack-search_terms'

In config/environment.rb, add:

    config.middleware.use "Rack::SearchTerms"

Using with non-Rails Rack apps
------------------------------

Just `use Rack::SearchTerms` as any other middleware.

Use Cases
---------

Our use case for this is to help our 404 page. If someone is referred from a Search Engine to an unknown page (it happens!), then we do a lookup against our internal search engine and hopefully return what the user was looking for.

You could also use it to highlight search terms within your page, but this [isn't advised](http://gilesbowkett.blogspot.com/2007/01/stop-highlighting-referrer-search-terms.html) ;)

Contributing to Rack::SearchTerms
-----------------------

I encourage you to:
 
* Fork the project.
* Make your feature addition, bug fix, or support for additional search engine.
* Add specs for it.
* Send me a pull request. Bonus points for topic branches.

Author
------

Maintained by [Paul Bowsher](http://www.twitter.com/boffbowsh/)

Thanks
------

Thanks to Bryan Helmkamp for the Quick Start section of this README :)

License
-------

See MIT-LICENSE.txt in this directory.