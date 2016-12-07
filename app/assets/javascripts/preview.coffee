$(document).on 'turbolinks:load', ()->
  $('#preview_tab').click (e)->
    $('#preview_tab').parent().addClass('active')
    $('#content_tab').parent().removeClass('active')
    $('#preview-field').addClass('active')
    $('#content-field').removeClass('active')
    $.ajax
      url: '/admin/posts/preview'
      data:
        content: $('#content-field textarea').val()
      method: 'POST'
    .success (res)->
      $('#preview-field').html(res)

  $('#content_tab').click (e)->
    $('#content_tab').parent().addClass('active')
    $('#preview_tab').parent().removeClass('active')
    $('#content-field').addClass('active')
    $('#preview-field').removeClass('active')
