categorySelector = ".categories-groups .category"

$(document).on "mouseenter", categorySelector, ->
  $pic = $(this).find("img")
  $pic.attr "src", $pic.data("hover")

$(document).on "mouseleave", categorySelector, ->
  $pic = $(this).find("img")
  $pic.attr "src", $pic.data("original")
