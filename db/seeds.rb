User.create(role: 1, email: 'steve@gmail.com', password: 'steve123', is_enabled: true)
User.create(email: 'gardenia@gmail.com', password: 'gardenia123', is_enabled: true)
User.create(email: 'lily@gmail.com', password: 'lily123', is_enabled: true)
User.create(email: 'tom@gmail.com', password: 'tom123', is_enabled: true)

Room.create(name: 'Chit chat', user_id: 1, is_private: false)

Message.create(user_id: 1, room_id: 1, body: 'Just trying this damns thang out')
Message.create(user_id: 2, room_id: 1, body: 'Seems to be working')
Message.create(user_id: 3, room_id: 1, body: 'Ahh! I dont htink so')

Room.create(name: 'Substantial elocutions', user_id: 2, is_private: false)

Message.create(user_id: 2, room_id: 2, body: 'I dont know what to say')
Message.create(user_id: 4, room_id: 2, body: 'Say it anyway')
Message.create(user_id: 3, room_id: 2, body: 'Might as well')

Room.create(name: 'Idiotica Discordia', user_id: 1, is_private: true)

Room.create(name: 'Flatus Vocis', user_id: 2, is_private: true)

Room.create(name: 'Bigus Dickus', user_id: 3, is_private: true)

Room.create(name: 'Incontinentia Buttocks', user_id: 4, is_private: true)