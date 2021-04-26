class ApplicationController < ActionController::Base
    include RsErrors

    skip_before_action :verify_authenticity_token

    helper_method :page_title

    def page_title #default page title
        "rocket_quizlet"
    end

end
