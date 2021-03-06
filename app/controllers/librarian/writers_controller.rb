class Librarian::WritersController < ApplicationController
  before_filter :select, :only => [:edit, :show, :update, :destroy]

  def index
    @title = "Writer"
    @writers = Writer.order(:created_at).page(params[:page]).per(7)
  end

  def new
    @writer = Writer.new
  end
  
  def create
    @writer = Writer.new(params[:writer])
    
    if @writer.save
      redirect_to(librarian_writers_url, :notice => 'Writer was successfully created.')
      else
      render :action => "new"
    end
  end

  def edit
  end
  
  def update
    if @writer.update_attributes(params[:writer])
      redirect_to(edit_librarian_writer_url, :notice => 'Writer was successfully updated.')
      else
      render :action => "edit"
    end
  end

  def show
  end

  def destroy
    @writer.destroy
    redirect_to librarian_writers_path
  end

  def select
    @writer = Writer.find_id(params[:id])
  end
end
