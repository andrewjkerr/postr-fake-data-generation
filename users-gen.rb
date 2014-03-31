require 'faker'
require 'digest/sha2'

# Stop error message
I18n.enforce_available_locales = false

# Set locale to en-us
Faker::Config.locale = 'en-us'

# Open the file
file = File.open("insert-users.sql", 'w')

500.times do |i|
  
  # Generate user id
  uid = i

  # Generates fake name to use for username and email
  # Note: Not actually stored in DB!
  name = Faker::Name.name
  
  # Generates fake username
  username = Faker::Internet.user_name(name, %w(. _ -))
  
  # Generates fake email
  email = Faker::Internet.safe_email(name)
  
  # Generates fake password to be hashed!
  # Note: Not actually stored in DB!
  password = Faker::Internet.password
  
  # Generates SHA256 of password
  password_hash = Digest::SHA2.new << password

  insert_string = "INSERT INTO users VALUES(#{uid}, '#{username}', '#{email}', '#{password_hash}');\n"
  file.write(insert_string)

end