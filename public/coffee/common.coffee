class window.Common
  @emailPassword: ->
    { email: $('#inputEmail').val(), password: $('#inputPassword').val() }

  @saveAccessInfo: (data) ->
    $.cookie 'access_token', data.access_token, _expires()

  @userId: -> $.cookie('access_token').split(':')[0]

  _expires = -> { expires: new Date('Tue, 1-Jan-2030 00:00:00 GMT') }
