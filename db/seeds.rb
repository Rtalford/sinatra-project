User.create!(email: 'test@test.com', password: 'test')
Entry.create!(Title: 'first entry', content: "This is my content", user_id: 1)
Entry.create!(Title: 'second entry', content: "This is additional content", user_id: 2)
Entry.create!(Title: 'Third entry', content: "This is more additional content", user_id: 3)