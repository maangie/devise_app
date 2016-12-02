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
        alert xhr.responseJSON.exception
      complete: (xhr, status) -> alert status

  $('#user_info_button').click ->
    $.ajax
      async: true
      type: 'GET'
      url: '/api/v1/users'
      data: Common.emailPassword()
      dataType: 'json'
      context: this
      success: (data, status, xhr) ->
        alert status
        $.cookie 'access_token',
                 data.access_token,
                 { expires: new Date('Tue, 1-Jan-2030 00:00:00 GMT') }
      error: (xhr, status, error) ->
        alert xhr.responseJSON.exception
      complete: (xhr, status) -> alert status
