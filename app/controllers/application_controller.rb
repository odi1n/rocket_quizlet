class ApplicationController < ActionController::Base
  include RocketCMS::Controller

  def page_title #default page title
    "rocket_quizlet"
  end
end
