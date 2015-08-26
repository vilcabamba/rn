categorySelector = ".categories-groups .category"
imgSelector = ".category-image"

$(document).on "mouseenter", categorySelector, ->
  $pic = $(this).find(imgSelector)
  $pic.attr "src", $pic.data("hover")

$(document).on "mouseleave", categorySelector, ->
  $pic = $(this).find(imgSelector)
  $pic.attr "src", $pic.data("original")
