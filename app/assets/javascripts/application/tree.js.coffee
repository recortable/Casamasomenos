
# Reference jQuery
$ = jQuery

$.fn.extend
  # tree
  tree: (options) ->
    # Default settings
    settings =
      debug: false

    # Merge default settings with options.
    settings = $.extend settings, options

    # Simple logger.
    log = (msg) ->
      console?.log msg if settings.debug

    # _Insert magic here._
    return @each ()->
      self = $(this)


cositas = ->
  $('.article_tree li').hide()
  $('.article_tree li.visible').show()

  article_id = $('.main .article').attr('id').substring(8)
  selected = $("li.link_to-#{article_id}")
  selected.addClass('selected').show()
  selected.siblings('li').show()
  selected.next('ul').addClass('selected').children('li').show()
  selected.parents('li').show()
  name = selected.children('a').text()
  selected.html("<span>#{name}</span>")

  $('.article_tree').show()


jQuery ->
