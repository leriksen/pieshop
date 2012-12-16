require 'permissions'

role = Permissions.new(Permissions.get_role(:administrator))
User.find_or_create_by_email(email: "12", password: "12", password_confirmation: "12", role: role)
