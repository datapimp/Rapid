class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  order("created_at")

  class << self; attr_accessor :sortable_columns end

  self.sortable_columns = ["email","created_at"]

  # query the user table by parameters
  #
  # @param [Hash] params used to filter the table
  # @return [Array] an array of user records matching the criteria
  def self.query params={}
    params.delete :sort_by unless sortable_columns.include? params[:sort_by]

    all.tap do |scoped|
      scoped = scoped.order("#{ params[:sort_by] }#{ ' DESC' if params[:desc] }")
      scoped = scoped.where("email like ?","%#{ params[:email] }")
      
      scoped
    end
  end
end
