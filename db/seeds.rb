# admin_pw = "123123"
# User.destroy_all
# User.create!(email: 'admin@rocket-quizlet.ru', password: admin_pw, password_confirmation: admin_pw, role: :admin, username: "test", lastname: "test")

Base.create!(type: Question, text: "Как дела?",)
Base.create!(type: Question, text: "Как прошел день?",)
Base.create!(type: Question, text: "Что такое пирог?",)
Base.create!(type: Question, text: "Да, это нет?",)
Base.create!(type: Question, text: "Почему нет или да?",)
