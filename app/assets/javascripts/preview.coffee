$(document).on 'turbolinks:load', ()->
  $('#preview_tab').click (e)->
    $('#preview_tab').parent().addClass('active')
    $('#content_tab').parent().removeClass('active')
    $('#tab2').addClass('active')
    $('#tab1').removeClass('active')
    $.ajax
      url: '/admin/posts/preview'
      data:
        content: $('#tab1 textarea').val()
      method: 'POST'
    .success (res)->
      $('#tab2').html(res)

  $('#content_tab').click (e)->
    $('#content_tab').parent().addClass('active')
    $('#preview_tab').parent().removeClass('active')
    $('#tab1').addClass('active')
    $('#tab2').removeClass('active')
