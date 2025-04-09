users_data = [
    { email: "carlos.rodriguez@example.com", first_name: "Carlos", last_name: "Rodríguez" },
    { email: "maria.gonzalez@example.com", first_name: "María", last_name: "González" },
    { email: "juan.lopez@example.com", first_name: "Juan", last_name: "López" },
    { email: "ana.martinez@example.com", first_name: "Ana", last_name: "Martínez" },
    { email: "jose.fernandez@example.com", first_name: "José", last_name: "Fernández" },
    { email: "laura.sanchez@example.com", first_name: "Laura", last_name: "Sánchez" },
    { email: "pedro.ramirez@example.com", first_name: "Pedro", last_name: "Ramírez" },
    { email: "sofia.moreno@example.com", first_name: "Sofía", last_name: "Moreno" },
    { email: "miguel.torres@example.com", first_name: "Miguel", last_name: "Torres" },
    { email: "elena.ortiz@example.com", first_name: "Elena", last_name: "Ortiz" }
]

users = []
users_data.each do |user_data|
    users << User.create!(user_data)
end

chats_data = [
  { sender_id: users[0].id, receiver_id: users[1].id },
  { sender_id: users[2].id, receiver_id: users[3].id },
  { sender_id: users[4].id, receiver_id: users[5].id },
  { sender_id: users[6].id, receiver_id: users[7].id },
  { sender_id: users[8].id, receiver_id: users[9].id },
  { sender_id: users[1].id, receiver_id: users[2].id },
  { sender_id: users[3].id, receiver_id: users[4].id },
  { sender_id: users[5].id, receiver_id: users[6].id },
  { sender_id: users[7].id, receiver_id: users[8].id },
  { sender_id: users[9].id, receiver_id: users[0].id }
]

chats = []
chats_data.each do |chat_data|
    chat = Chat.create!(chat_data)
    chats << chat
end

messages_data = [
  { chat_id: chats[0].id, user_id: users[0].id, body: "Hey, how are you doing?" },
  { chat_id: chats[0].id, user_id: users[1].id, body: "I'm doing great, thanks for asking!" },
  { chat_id: chats[1].id, user_id: users[2].id, body: "Did you finish the project?" },
  { chat_id: chats[1].id, user_id: users[3].id, body: "Yes, I submitted it yesterday." },
  { chat_id: chats[2].id, user_id: users[4].id, body: "Can we meet tomorrow?" },
  { chat_id: chats[2].id, user_id: users[5].id, body: "Sure, what time works for you?" },
  { chat_id: chats[3].id, user_id: users[6].id, body: "I sent you the files." },
  { chat_id: chats[3].id, user_id: users[7].id, body: "Got them, thanks!" },
  { chat_id: chats[4].id, user_id: users[8].id, body: "Are you coming to the meetup?" },
  { chat_id: chats[4].id, user_id: users[9].id, body: "Yes, I'll be there at 6pm." }
]

messages = []
messages_data.each do |message_data|
    message = Message.create!(message_data)
    messages << message
end


