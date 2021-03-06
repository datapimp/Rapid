module ControllerMacros
  def mock_authentication
    request.env['omniauth.auth'] = {'provider'=>'facebook','uid'=>'1'} 
    request.env['warden'] = mock(Warden, :authenticate => mock_user,
                                 :authenticate! => mock_user,
                                 :authenticate? => mock_user,
                                 :user => mock_user)
  end  

  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end
end

