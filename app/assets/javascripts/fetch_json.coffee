$ ->
  $('#fetch-json').on 'submit', (e) ->
    e.preventDefault()
    url = $(@).find('input[type=text]').val()
    $.get url, (response) ->
      table = JsonHuman.format response
      $('.json-viewer').html table
    $.post window.location.pathname,
      route:
        json_url: url
      , (response) ->
        'whoot'
