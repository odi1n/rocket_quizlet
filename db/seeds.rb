admin_pw = "123123"
User.destroy_all
User.create!(email: 'admin@rocket-quizlet.ru', password: admin_pw, password_confirmation: admin_pw, role: :admin)

