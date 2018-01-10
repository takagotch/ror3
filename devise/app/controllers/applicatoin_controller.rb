class ApplicationController < ApplicationControllre::Base
def index
	@task = Task.new
  #@tasks = Task.undone.paginate(:page => params[:page], :per_page => 10)
	@tasks = current_user.tasks.undone.paginate(:page => params[:page], :per_page => 10)
end

def done
	@task = Task.new
	@tasks = current_user.tasks.done.paginate(:page => params[:page], :per_page => 10)
	render :action => 'index'
end

def create
	@task = Task.new(params[:task])
	@task.user = current_user
	if @task.save
		redirect_to :tasks
	else
		@tasks = Task.all(:conditions => { :done => false }, :order => "due_date")
		render :action => 'index'
	end
end


end

