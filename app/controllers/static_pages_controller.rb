class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@task = current_user.tasks.build
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
end
