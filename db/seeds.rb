user1 = User.create(email: "trackhack@gmail.com", password: "123456", amount: 3317.63)
user2 = User.create(email: "sebastian@gmail.com", password: "123123", amount: 100)

Tag.create(name: "11001214", user: user1)
Tag.create(name: "11001213", user: user2)
