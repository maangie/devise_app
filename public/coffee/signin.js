// Generated by CoffeeScript 1.11.1
(function() {
  $(function() {
    return $('form').submit(function() {
      return $.ajax({
        async: true,
        type: 'POST',
        url: '/api/v1/users',
        data: {
          user: Common.emailPassword()
        },
        dataType: 'json',
        context: this,
        success: function(data, status, xhr) {
          alert(status);
          return Common.saveAccessInfo(data);
        },
        error: function(xhr, status, error) {
          return alert(xhr.responseJSON.exception || xhr.responseJSON.error);
        }
      });
    });
  });

}).call(this);
