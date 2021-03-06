class Librarian::CategoriesController < ApplicationController
  before_filter :select, :only => [:edit, :show, :update, :destroy]

  def index
    @title = "Category"
    @categories = Category.order(:created_at).page(params[:page]).per(7)
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      redirect_to(librarian_categories_url, :notice => 'Category was successfully created.')
      else
      render :action => "new"
    end
  end

  def edit
  end
  
  def update
    if @category.update_attributes(params[:category])
      redirect_to(edit_librarian_category_url, :notice => 'Category was successfully updated.')
      else
      render :action => "edit"
    end
  end

  def destroy
    @category.destroy
    redirect_to librarian_categories_path
  end

  def select
    @category = Category.find_id(params[:id])
  end
end
