feedUrl = "http://feriadeloja.com/feed"

parseRSS = (url, callback) ->
  $.ajax
    url: document.location.protocol + '//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=10&callback=?&q=' + encodeURIComponent(url),
    dataType: 'json',
    success: (data) ->
      callback(data.responseData.feed)

jQuery ->
  parseRSS feedUrl, (data) ->
    $feed = $('#feed')
    for entry in data.entries
      $entryLink = $(
        "<a />",
        href: entry.link,
        text: entry.title
      )
      $feed.append $("<li />", html: $entryLink)
    null
