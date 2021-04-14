admin_pw = "8SJyKsfl"
User.destroy_all
User.create!(email: 'admin@rocket-quizlet.ru', password: admin_pw, password_confirmation: admin_pw)

Page.destroy_all
Menu.destroy_all
News.destroy_all

h = Menu.create(name: 'Главное', text_slug: 'main').id
Page.create!(name: 'О компании', fullpath: '/company', menu_ids: [h], content: 'О Компании')
Page.create!(name: 'Новости', fullpath: '/news', menu_ids: [h])
Page.create!(name: 'Контакты', fullpath: '/contacts', menu_ids: [h], content: 'Текст стр контакты')

3.times do |i|
  News.create!(name: "test " + i.to_s, content: "test", time: i.days.ago)
end

