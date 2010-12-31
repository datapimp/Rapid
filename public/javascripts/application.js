/* DO NOT MODIFY. This file was compiled from
 *   /Users/jonathan/Projects/rapid/rails-app/app/coffeescripts/application.coffee
 */

(function() {
  var Application;
  Application = function() {
    var actions, socket;
    actions = this.actions = {};
    socket = this.socket = new Juggernaut;
    socket.connect();
    return this;
  };
  _.extend(Application.prototype, Backbone.Events);
  Application.prototype.subscribe_to = function(channel_id, callback) {
    var self;
    self = this;
    if (typeof callback === "string") {
      if (self.actions[callback]) {
        callback = self.actions[callback];
      }
    }
    self.bind(channel_id, callback);
    self.socket.subscribe(channel_id, function(data) {
      return self.trigger(channel_id, data, channel_id);
    });
    return self;
  };
  window.Site = new Application();
  Site.actions.home = function(msg, channel_id) {
    return console.log('Received msg on ' + channel_id, msg);
  };
}).call(this);