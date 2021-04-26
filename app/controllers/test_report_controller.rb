class TestReportController < ApplicationController
    def create
        if current_user.test_reports.find_by(test_case_id: get_params[:test_case_id]).nil?
            test_case = TestCase.find(get_params[:test_case_id])
            @test_report = test_case.test_reports.create(user: current_user, state: :process)
        else
            @test_report = current_user.test_reports.find_by(test_case_id: get_params[:test_case_id])
        end
        render :edit
    end

    def edit
        @test_report = TestReport.find_by(user: current_user, test_case_id: params[:id])
    end

    def update
        all_question = []
        params[:answer].each do |question, answer|
            question_answer = QuestionAnswer.find_by(question_id: question.to_i, answer_id: answer.to_i)
            if question_answer.nil?
                next
            end

            all_question.push(question_answer.is_correct)
        end

        good = ((100 * all_question.select { |x| x == true }.count).to_d / all_question.count.to_d).round(2)

        @test_report = TestReport.find(params[:id])
        @test_report.update(right_count: good, state: :accept)

        # render plain: params
        render "test_case/show"
    end

    private

    def get_params
        params.require(:test_report).permit(:test_case_id)
    end
end
