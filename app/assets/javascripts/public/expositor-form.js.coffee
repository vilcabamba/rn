formSelector = "form"

inputSelector = ->
  "#{formSelector} input[type='file']"

photoSelector = ->
  "#{formSelector} .expositor-photo-form"

# trigger choose file
$(document).on "click", "#{formSelector} .choose-file-btn", ->
  $(inputSelector()).trigger "click"

# read selected file
$(document).on "change", inputSelector(), (e) ->
  fileName = e.target.files[0].name
  $(photoSelector()).text fileName
