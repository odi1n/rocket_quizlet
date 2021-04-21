admin_pw = "123123"
User.destroy_all
User.create!(email: 'admin@rocket-quizlet.ru', password: admin_pw, password_confirmation: admin_pw, role: :admin, username: "Admin", lastname: "Quizlet")

Question.create(text: "Как дела?")
Question.create(text: "Как прошел день?")
Question.create(text: "Что такое пирог?")
Question.create(text: "Да, это нет?")
Question.create(text: "Почему нет или да?")

