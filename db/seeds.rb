User.create(role: 1, email: 'steve@gmail.com', password: 'steve123', is_enabled: true)
User.create(email: 'gardenia@gmail.com', password: 'gardenia123', is_enabled: true)
User.create(email: 'lily@gmail.com', password: 'lily123', is_enabled: false)
User.create(email: 'tom@gmail.com', password: 'tom123', is_enabled: false)

Room.create(name: 'Chit chat', is_private: false)

Message.create(user_id: 1, room_id: 1, body: 'Just trying this damns thang out')
Message.create(user_id: 1, room_id: 1, body: 'Seems to be working')
Message.create(user_id: 1, room_id: 1, body: 'But I dont know')

Room.create(name: 'Substantial elocutions', is_private: false)

Message.create(user_id: 2, room_id: 2, body: 'I dont know what to say')
Message.create(user_id: 2, room_id: 2, body: 'Ill say it anyway')
Message.create(user_id: 2, room_id: 2, body: 'Might as well')

Room.create(name: 'Between You And Me', is_private: true)

Participant.create(user_id: 1, room_id: 3)
Participant.create(user_id: 2, room_id: 3)
Participant.create(user_id: 1, room_id: 3)

Message.create(user_id: 2, room_id: 3, body: 'Hello Steve')
Message.create(user_id: 1, room_id: 3, body: 'Scram!')
Message.create(user_id: 2, room_id: 3, body: 'Have it your way!')

Room.create(name: 'Very Intimate', is_private: true)

Participant.create(user_id: 2, room_id: 4)
Participant.create(user_id: 1, room_id: 4)
Participant.create(user_id: 2, room_id: 4)

Message.create(user_id: 1, room_id: 4, body: 'Okay Gardenia, Ready to talk.')
Message.create(user_id: 2, room_id: 4, body: 'Pipe it!')
Message.create(user_id: 1, room_id: 4, body: 'Whos being a hussy now!')