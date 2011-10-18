
User.create!(name: 'admin', email: 'admin', password: 'secret', password_confirmation: 'secret')
User.create!(name: 'anonymous', email: 'anonymous', password: 'secret', password_confirmation: 'secret')
Article.create!(title: 'Welcome', author_id: 1, state: 'published', category_id: 1)

