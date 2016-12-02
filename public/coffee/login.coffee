$ ->
  $('form').submit ->
    $.ajax
      async: true
      type: 'POST'
      url: '/api/v1/login'
      data: Common.emailPassword()
      dataType: 'json'
      context: this
      success: (data, status, xhr) ->
        alert status
        Common.saveAccessInfo data
      error: (xhr, status, error) ->
        alert xhr.responseJSON.exception || xhr.responseJSON.error
      # complete: (xhr, status) -> alert status

  $('#user_info_button').click ->
    $.ajax
      async: true
      type: 'GET'
      url: "/api/v1/users/#{Common.userId()}"
      headers: { 'Authorization': Common.accessToken() }
      dataType: 'json'
      context: this
      success: (data, status, xhr) ->
        alert JSON.stringify(data)
      error: (xhr, status, error) ->
        alert xhr.responseJSON.exception || xhr.responseJSON.error
      # complete: (xhr, status) -> alert status
