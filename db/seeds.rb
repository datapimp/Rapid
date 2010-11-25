class Seeder
  class << self
    def clear_database
      [User].each &:delete_all
    end

    def create_admin_user
      u = User.new :email => "admin@#{ Rapid::Application::YOUR_DOMAIN }",
        :password => "password",
        :password_confirmation => "password"

      u.admin = true

      u.save
    end

    def run_all
      raise "Do not do this in production" if Rails.env == "production"
      clear_database
      create_admin_user
    end
  end
end

Seeder.run_all
