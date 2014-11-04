$ ->
  $('.markdown form').on 'submit', (e) ->
    e.preventDefault()
    $.post(window.location.pathname, $(@).serialize(), (response) ->
      if response.success
        successfullyConverted(response.route)
      else
        failedToConvert()
    )

  successfullyConverted = (route) ->
    $('.markdown .error')
    $('.markdown .success').show()
    $('.liquid').html route.liquid

  failedToConvert = ->
    $('.markdown .error').show()
    $('.markdown .success').hide()

