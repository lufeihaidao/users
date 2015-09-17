$(document).on "page:change", ->

  email =
    identifier: 'user_email'
    rules: [
      {
        type: "empty"
        prompt : I18n.t('errors.messages.empty')
      }
      {
        type: "email"
        prompt : I18n.t('errors.messages.email')
      }
    ]
  password =
    identifier: 'user_password'
    rules: [
      type: "length[8]"
      prompt: I18n.t('errors.messages.too_short', 8)
    ]
  password_confirmation =
    identifier: 'user_password_confirmation'
    rules: [
      type: "match[user_password]"
      prompt: I18n.t('errors.messages.confirmation')
    ]
  current_password =
    identifier: 'user_current_password'
    rules: [
      type: "length[8]"
      prompt: I18n.t('errors.messages.too_short', {count: 8})
    ]
  inline_validate('form#user_sign_in', [email, password])
  inline_validate('form#user_add', [email])
  inline_validate('form#current_user_edit', [email, current_password])
  inline_validate('form#user_sign_up', [email, password, password_confirmation])
