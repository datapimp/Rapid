Application = ()->
  actions = this.actions = {}
  socket = this.socket = new Juggernaut
  
  socket.connect()
  
  this

_.extend(Application.prototype, Backbone.Events)

# Our rails actions can be toggled at a controller level
# to subscribe to controller_action, and/or controller_action_resource_id
# these actions will listen on the socket for anything published
Application.prototype.subscribe_to = (channel_id,callback)->
  self = this
  
  if typeof callback is "string"
    callback = self.actions[callback] if self.actions[callback]

  self.bind channel_id, callback

  self.socket.subscribe channel_id, (data)->
    self.trigger channel_id, data, channel_id

  self

window.Site = new Application()

Site.actions.home = (msg,channel_id)->
  console.log('Received msg on ' + channel_id, msg)

