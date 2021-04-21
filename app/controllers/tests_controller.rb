class TestsController < ApplicationController
    def show
        user = current_user
        @test_report = TestReport.find_by(user_id: user.id, test_cases_id: params[:id])
        @test_case = TestCase.find(params[:id])
    end

    def create
        @test_case = TestCase.find(1)
        render plain: params[:answer]
    end
end
