class Admin::CategoriesController < ApplicationController
  def create
  end

  def new
  end

  def index
    @categories = Category.order(id: :desc).all
  end
end
