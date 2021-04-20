class TestsController < ApplicationController
    def show
        @test = Test.find(params[:id])
    end

    def create
        @test = Test.find(5)
        render plain: params[:answer]
    end
end
