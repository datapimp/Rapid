class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  helper_method :sockets_enabled?
  
  def sockets_enabled?
    false
  end

  def socket_actions
    []
  end
  
  def self.enable_sockets_on *channels
    define_method :sockets_enabled? do
      socket_actions.include? action_name.to_sym
    end

    define_method :socket_actions do
      channels
    end
  end
end
