$(document).on "page:change", ->

  # semantic ui action
  $(".ui.dropdown").dropdown()
  $(".message .close").on "click", ->
    $(this).closest(".message").fadeOut()
    false

@inline_validate = (dom, fields) ->
  valid_rule = {}
  fields.forEach (e, i) ->
    valid_rule[i] = e
  $(dom).form valid_rule,
    inline: true
    on: "blur"
