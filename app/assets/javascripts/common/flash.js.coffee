
jQuery ->
    $(".flash").css('cursor', 'pointer').live 'click', ->
        $(this).slideUp()