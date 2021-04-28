class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        # CategoryMailer.open_email.deliver_now
        CategoryMailer.open_email(current_user).deliver_now
    end

    def show
        @category = Category.find(params[:id])
    end

    def open
        @category = Category.find(params[:id])
    end
end
