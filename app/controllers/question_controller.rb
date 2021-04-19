class QuestionController < ApplicationController
    def index
        @question = Question.find(params[:category_id])
        # @bases = Base.find(params[:category_id])
    end
end
