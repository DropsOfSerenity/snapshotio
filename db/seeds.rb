unless User.exists?(email: 'admin@snapshot.io')
  User.create!(email: 'admin@snapshot.io', password: 'password', admin: true)
end