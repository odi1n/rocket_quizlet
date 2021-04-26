class TestCaseController < ApplicationController
    def show
        @test_report = TestReport.find_by(test_case_id: params[:id])
    end
end
