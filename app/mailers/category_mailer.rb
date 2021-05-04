class CategoryMailer < ApplicationMailer

    def open_email(user, test_report)
        @user = user
        @test_report = test_report
        user = User.find_by(role: :admin)
        if user.email
            mail(to: user.email, subject: 'Проверка знаний для открытия категории')
        end
    end

end
