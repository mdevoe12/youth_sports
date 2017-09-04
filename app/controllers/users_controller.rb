class UsersController < ApplicationController
  def new
    # byebug
    @user = User.new
    binding.pry
  end
end
