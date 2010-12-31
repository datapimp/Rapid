module Admin
  class HomeController < ApplicationController
    before_filter :require_admin

    def home

    end
  end
end
