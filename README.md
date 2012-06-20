#JS-Wiki

Dave Hoover said everyone should write a wiki with their own flavor.
Since I'm really excited about Javascript, I wanted to write a wiki
entirely in Javascript. The setup is a little strange to allow me to
develop in the way I'd like, but I'm using the following technologies:

* Coffeescript
* HAML
* SASS
* Jasmine
* Backbone/Underscore
* jQuery

I'm going to attempt to write adequate tests along the way, increasing
my TDD/BDD skills. The testing setup is a bit strange. I'm using:

* coffee (gem) to convert my Coffeescript into testable JS.
* foreman (gem) to run the Coffeescript converts for tests and source.
* middleman (gem) to convert HAML, SASS, and CS to display in browser.
* testem (npm) to run the tests and do awesome testing stuff.
