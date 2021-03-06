class TasksController < ApplicationController
    before_action :signed_in_user, only: [:create, :destroy, :edit, :update, :flop]
    before_action :correct_user,   only: [:destroy, :edit, :update, :flop] 

	def create
    	@user = User.find(params[:user_id])
    	@task = @user.tasks.create(params[:task].permit(:title))
    	redirect_to user_path(@user)
    end

    def destroy
    	@user = User.find(params[:user_id])
    	@task = @user.tasks.find(params[:id])
    	@task.destroy
    	redirect_to user_path(@user)
  	end

    def flop
        @user = User.find(params[:user_id])
        @task = @user.tasks.find(params[:id])
        @task.done = false # flop the status
        @task.save
        redirect_to user_path(@user)
    end

    private
        def correct_user
            @task = current_user.tasks.find_by(id: params[:id])
            redirect_to root_url if @task.nil?
        end
end
