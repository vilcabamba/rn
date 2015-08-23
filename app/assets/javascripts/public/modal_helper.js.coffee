"use strict"

class Modal
  constructor: (modalContent) ->
    @$modalWrapper = $("<div />").html(modalContent)
    @$modal = @$modalWrapper.find(".modal")
    @showModal()
    @removalListener()

  showModal: ->
    $("body").append(@$modalWrapper)
    @$modal.modal("show")

  removalListener: ->
    @$modal.on "hidden.bs.modal", =>
      @$modalWrapper.remove()

$(document).on "rn:makeModal", (e, modalContent) ->
  new Modal(modalContent)
