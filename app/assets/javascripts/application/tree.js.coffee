
jQuery ->
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

