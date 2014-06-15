$(document).on "page:change", ->

  email =
    identifier: 'user_email'
    rules: [
      type: "email"
      prompt : 'Please enter your email'
    ]
  password =
    identifier: 'user_password'
    rules: [
      type: "length[8]"
      prompt: "The length of password must me at least 8"
    ]
  password_confirmation =
    identifier: 'user_password_confirmation'
    rules: [
      type: "match[user_password]"
      prompt: "Please input the same password"
    ]
  current_password =
    identifier: 'user_current_password'
    rules: [
      type: "length[8]"
      prompt: "Password doesn't match"
    ]
  inline_validate('form#user_sign_in', [email, password])
  inline_validate('form#current_user_edit', [email, current_password])
  inline_validate('form#user_sign_up', [email, password, password_confirmation])
