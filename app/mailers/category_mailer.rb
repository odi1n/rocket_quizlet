class CategoryMailer < ApplicationMailer

    def open_email(user)
        @user = user
        mail(to: "test@gmail.ru", subject: 'Проверка знаний для открытия категории')
    end

end
