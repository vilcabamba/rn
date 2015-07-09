$.get 'http://feriadeloja.com/feed/', (data) ->
  $(data).find('channel').find('item').each ->
    el = $(this)
    title = el.find('title').text()
    link = el.find('link').text()
    description = el.find('description').text()
    container = $('#feed')
    element = "<li><a href=\"#{link}\">#{title}</a></li>"
    container.append(element)
