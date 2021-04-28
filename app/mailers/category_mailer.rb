class CategoryMailer < ApplicationMailer

    def open_email(user)
        @user = user
        mail(to: "test@gmail.ru", subject: 'Welcome to My Awesome Site')
    end

end
