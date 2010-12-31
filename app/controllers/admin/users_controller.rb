module Admin
  class UsersController < ApplicationController
    layout 'admin'

    before_filter :get_user, :only => [:destroy,:edit,:show,:update]

    def create
      @user = User.new params[:user]
    end
    
    def destroy

    end
    
    def edit

    end

    def index
      @users = User.query params   
    end

    def new
      
    end

    def show
      
    end

    def update
      
    end

    protected

    def get_user
      @user = User.find( params[:id].to_i )
    end
  end
end
