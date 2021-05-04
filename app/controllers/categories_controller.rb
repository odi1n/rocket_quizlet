class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    def open
        if Request.find_by(user: current_user, category_id: params[:category_id].to_i).nil?
            offset = rand(TestReport.count)
            test_report = TestReport.offset(offset).first
            @request = Request.create!(user: current_user, category_id: params[:category_id].to_i, test_report: test_report)
        else
            @request = Request.find_by(user: current_user, category_id: params[:category_id].to_i)
        end

    end
end
