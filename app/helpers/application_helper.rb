module ApplicationHelper
  
  def subscribed_to
    @subscribed_to ||= [] 
  end

  def subscribe_to channel, handler
    return if subscribed_to.include? channel
    subscribed_to.push(channel)
    render :partial => "partials/subscription", :locals => {:channel => channel, :handler => handler || body_class}
  end

  # inject any user / situation specific channels into the subscription list
  def channels
    default_channels.tap do |list|

    end.flatten
  end
  
  # if sockets are enabled
  # the user will listen for messages on the general channel for the current controller / action
  # and the actual resource id
  # for example, /users/1 will listen on users_show and users_show_1
  def default_channels
    [body_class,body_id]
  end

  def body_class
    [controller_name,action_name].join("_")
  end
  
  # if we're looking at a specific record, this will show up in the body id
  # if we're just looking at a collection, then the id will be omitted and this 
  # will be the same as the body class
  def body_id
    parts = [controller_name,action_name].push( resource_id ) 
    parts.compact.join("_")
  end
  
  # try to determine if we're looking at a restful resource
  def get_resource
    var = instance_variable_get("@#{controller_name.humanize.singularize.downcase}")
  end

  def resource_id
    return params[:id] unless r = get_resource
    r.respond_to?(:to_param) ? r.to_param : r.id
  end
end
