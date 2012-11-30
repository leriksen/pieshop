ut = UserType.find_or_create_by_typename(typename: :admin, level: 99)
User.find_or_create_by_email(email: "12", password: "12", password_confirmation: "12", user_type_id: ut.id)
