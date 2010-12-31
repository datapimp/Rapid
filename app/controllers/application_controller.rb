class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def require_admin
    unless user_signed_in? && current_user.admin?
      redirect_to(new_user_session_path, :error => "You do not have access to this page") and return 
    end
  end
  
  def require_user
    authenticate_user!
  end
 
  # enable sockets on specified actions
  #
  # @param [Array] a list of action names n 
  # the controller for which we should enable sockets
  def self.enable_sockets_on *enabled_actions
    define_method :sockets_enabled? do
      socket_actions.include? action_name.to_sym
    end

    define_method :socket_actions do
      enabled_actions
    end
  end

  # by default sockets are disabled
  # but for controllers which enable_sockets_on *actions
  # this will get overridden
  def sockets_enabled?
    false
  end

  helper_method :sockets_enabled?
  # a list of actions for which
  # we should enable sockets
  # by default this list is empty
  def socket_actions
    []
  end
end
