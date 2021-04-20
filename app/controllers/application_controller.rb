class ApplicationController < ActionController::Base
    # include RocketCMS::Controller
    #
    skip_before_action :verify_authenticity_token

    helper_method :page_title

    def page_title #default page title
        "rocket_quizlet"
    end

    rescue_from CanCan::AccessDenied do |exception|
        if user_signed_in?
            scope = rails_admin? ? main_app : self
            redirect_to scope.new_user_session_path, alert: "Необходимо авторизоваться"
            authenticate_user!
        else
            redirect_to '/', alert: t('rs.errors.access_denied')
        end
    end

end
