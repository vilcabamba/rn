class RemoteFeed
  googleApiURL: "//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=10&callback=?&q="

  constructor: (@feedUrl) ->
    @fetch()

  fetch: =>
    $.ajax
      url: document.location.protocol + @googleApiURL + encodeURIComponent(@feedUrl),
      dataType: "json",
      success: (data) =>
        @loaded(data.responseData.feed)

  loaded: (data) ->
    $feed = $('#feed').html("")
    for entry in data.entries
      $entryLink = $(
        "<a />",
        href: entry.link,
        text: entry.title
      )
      $feed.append $("<li />", html: $entryLink)
    null

feedUrl = "http://feriadeloja.com/feed"
remoteFeed = new RemoteFeed(feedUrl)

$(document).on "ready page:load", remoteFeed.fetch
