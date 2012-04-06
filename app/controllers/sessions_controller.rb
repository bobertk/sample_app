class SessionsController < ApplicationController
	def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
	  if user && user.authenticate(params[:session][:password])
	    sign_in user
      redirect_back_or user
	  else
	    # (flash persists for one request, but — unlike a redirect, re-rendering a 								# template with render doesn’t count as a request)
	    # so... flash.now contents disappear w next request on rendered pages.
	    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
	  end
  end

  def destroy
  	sign_out
    redirect_to root_path
  end
end
