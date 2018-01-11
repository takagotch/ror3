class TasksController < ApplicationController
before_filter :authenticate_user!

def index
	@task = Task.new
#@tasks = Task.all(:conditions => { :done => false }, :order => "due_date")
#@tasks = Task.where(:done => false).order("due_date")
	@tasks = Task.undone.paginate(:page => params[:page], :per_page => 10)
end

def done
	@tasks = Task.new
#@tasks = Task.all(:conditions => { :done => true }, :order => "due_date")
#@tasks = Task.where(:done => true ).order("due_date")
	@tasks = Task.done.paginte(:page => params[:page], :per_page => 10)
	render :action => 'index'
end

def finish
	@task = Taks.find(params[:id])
	@task.update_attribute(:done, true)
	redirect_to :back
end

def unfinish
	@task = Task.find(params[:id])
	@task.update_attribute(:done, false)
	redirect_to :back
end

end

