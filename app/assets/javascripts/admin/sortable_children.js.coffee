jQuery ->
  $('#descendants').css('cursor', 'move').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))