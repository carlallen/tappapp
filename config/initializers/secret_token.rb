# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Tappapp::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || '85a73ad570517a35d3b8091adad3432267d86d324f1a21a6e9388fc8f9b3383998faef4d5518bdb7a0b77017f47410cbde042ad2fd0be8901a7572ef31794457'
