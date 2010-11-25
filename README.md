Rapid Prototyping
===========

I do a lot of prototyping of ideas for web apps. I got tired of configuring new rails apps all of the time.

This is a great starting point which allows me to go straight into hacking features which make
the idea unique.  Like a boss.

**Javascript libraries**:
  jquery what else
  underscore and backbone.  fucking love documentcloud's code.  github.com/documentcloud

**For the views**:
  haml, sass, compass with the html5 boilerplate 'framework' from paul irish ( http://html5boilerplate.com )

**For authentication**:
  devise, cancan

**For javascript / css assets**:
  jammit. yui-compressor. motherfucking sprockets.

**For testing**:
  Rspec2 with Spork to speed that shit up
  Cucumber with capybara / webdriver
  FactoryGirl
  Autotest with Growl Notifications
  
  If you're not running a Mac:
  ( Run bundle install --without development_mac )

For deployment:
  Vlad the Deployer.  Come on now.

The Good Shit
-------------

Comes wired up with socket.io and Juggernaut ( http://github.com/maccman/juggernaut ) for websockets style communication regardless of browser.

use Juggernaut.publish "channel_name", data from within the App and it will push data to that channel.

If you wish, a page automatically subscribes to channels based on the controller and action, and if it is an action which has a single resource... for example the show action on a given resource
then it subscribes to a channel for that resource.  This way you can target that specific resource's page for juggernaut updating.

To enable this, in your controller you would use:
    
    enable_sockets_for :index, :show

    def index
      # sockets will be enabled here
    end

And then in your view, you will automatically subscribe to users_show, users_show_1 where 1 is the ID of the user you are viewing.

See application.js for how you can add functions to handle any data that comes over the socket.
