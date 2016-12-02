$ ->
  $('form').submit ->
    $.ajax
      async: true
      type: 'POST'
      url: '/api/v1/users'
      data: { user: Common.emailPassword() }
      dataType: 'json'
      context: this
      success: (data, status, xhr) ->
        alert status
        Common.saveAccessInfo data
      error: (xhr, status, error) ->
        alert xhr.responseJSON.exception || xhr.responseJSON.error
      # complete: (xhr, status) -> alert status
