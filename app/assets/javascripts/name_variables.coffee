$ ->
  $('.json-viewer').on 'click', '.jh-key', (e) ->
    path = buildJSONPath $(@)
    createVariable path

  createVariable = (path) ->
    $('#variable-form').show()
    $('#variable-form input[name="variable[path]"]').val path
    $('.path').html path

  $('#variable-form').on 'submit', (e) ->
    e.preventDefault()
    $.post('/variables', $(@).serialize(), (response) ->
      if response.success then variableCreated(response.variable) else variableAborted()
    )

  buildJSONPath = ($node) ->
    paths = $node.parents('tr').map (_i, tr) ->
      $(tr).find('> th').text()
    $.makeArray(paths).reverse().join('.')

  variableCreated = (variable) ->
    $('.variable-error').hide()
    $('.variable-success').show()
    $('#variable-form input[name="variable[path]"]').val ''
    $('#variable-form input[name="variable[name]"]').val ''
    listVariable variable

  variableAborted = ->
    $('.variable-success').hide()
    $('.variable-error').show()

  listVariable = (variable) ->
    $('.variable-list').append('<li>' + variable.name + ': ' + variable.path + '</li>')
