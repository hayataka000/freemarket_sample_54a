class CategoryController < ApplicationController
    before_action :set_category
    def set_category
        @category = Category.find(params[:id])
    end
