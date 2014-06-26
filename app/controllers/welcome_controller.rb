class WelcomeController < ApplicationController
 def hello
    flash[:notice] = "Welcome!"
  end
 before_action :authenticate_user!
end
