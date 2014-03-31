require 'faker'

# Stop error message
I18n.enforce_available_locales = false

# Set locale to en-us
Faker::Config.locale = 'en-us'

# Open the file
file = File.open("insert-posts.sql", 'w')

500.times do |i|
  
  # Post id = user id
  pid = i
  uid = i

  # Generate post type
  # 0 - text
  # 1 - image
  # 2 - link
  content_type = rand(3)

  if content_type == 0
  	content = Faker::Lorem.characters(160)
  elsif content_type == 1
  	content = "http://placehold.it/500x500"
  else
  	content = Faker::Internet.url('example.com')
  end

  insert_string = "INSERT INTO posts VALUES(#{pid}, #{uid}, #{content_type}, '#{content}');\n"
  file.write(insert_string)

end