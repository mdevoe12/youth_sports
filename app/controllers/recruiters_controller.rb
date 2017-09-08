class RecruitersController < ApplicationController

  skip_before_action :authorize!, only: [:new, :create]

  def new
    @response = Faraday.get("https://graph.facebook.com/v2.10/oauth/access_token?client_id=#{ENV['FACEBOOK_APP_ID']}&redirect_uri=http://localhost:3000/recruiters/new&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&code=#{params["code"]}")

    token = @response.body.split(/\W+/)[2]

    oauth_response = Faraday.get("https://graph.facebook.com/debug_token?input_token=#{token}&access_token=#{ENV['FACEBOOK_APP_ID']}|#{ENV['FACEBOOK_APP_SECRET']}")

    auth = JSON.parse(oauth_response.body)
    @uid = auth["data"]["user_id"]
      @recruiter = Recruiter.new
  end

  def create
    @recruiter = Recruiter.new(recruiter_params)
    if @recruiter.save
      session[:user_id] = @recruiter.id
      redirect_to controller: 'recruiter_profiles', action: 'new', recruiter_id: @recruiter.id
    else
      render :new
    end
  end

  private

  def recruiter_params
    params.require(:recruiter).permit(:username, :first_name, :last_name, :password, :uid)
  end
end
