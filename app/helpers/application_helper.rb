module ApplicationHelper
  def body_class
    [controller_name,action_name].join("-")
  end

  def _body_id
    [ controller_name,action_name, resource_id ].compact.join("-")
  end

  def body_id
    parts = [controller_name,action_name].push( resource_id ) 
    parts.compact.join("-")
  end

  def get_resource
    var = instance_variable_get("@#{controller_name.humanize.singularize.downcase}")
  end

  def resource_id
    return params[:id] unless r = get_resource
    r.respond_to?(:to_param) ? r.to_param : r.id
  end
end
