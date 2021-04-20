class TestsController < ApplicationController
    def show
        user = current_user
        @test_report = TestReport.find_by(user_id: user.id, test: params[:id])
        @test = Test.find(params[:id])
    end

    def create
        @test = Test.find(5)
        render plain: params[:answer]
    end
end
