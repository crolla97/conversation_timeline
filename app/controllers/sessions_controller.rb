class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    username = params.require(:user).permit(:username)[:username]

    user = User.find_or_create_by(username: username)

    start_new_session_for(user)
    redirect_to after_authentication_url
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
