# frozen_string_literal: true

@user = User.create(
  firstname: 'SHUBHAM',
  lastname: 'SINGH',
  phone: '9931874646',
  country: 'india',
  email: 'subhams914@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)
@user.add_role :admin
