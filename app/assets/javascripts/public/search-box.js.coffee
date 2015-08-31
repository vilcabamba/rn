wrapper = ".search-box"

$(document).on "click", ".submit-search-btn", ->
  $("#{wrapper} form").submit()
  false
