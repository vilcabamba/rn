class ExpositoresCarousel
  width: 160
  categorySelector: ".categories-groups .category"
  expositoresContainer: ".expositores-container"
  expositorSelector: ".expositor-on-carousel"

  leftArrowSelector: ->
    "#{@categorySelector} .arrow-left"
  rightArrowSelector: ->
    "#{@categorySelector} .arrow-right"

  constructor: ->
    @toggleCategoriesListener()
    @leftArrowListener()
    @rightArrowListener()

  toggleCategoriesListener: ->
    $(document).on "click", @categorySelector, (e) =>
      $target = $(e.currentTarget)
      $(@categorySelector).removeClass "active"
      return if $target.find(@expositorSelector).length is 0
      $target.addClass("active")

  leftArrowListener: ->
    $(document).on "click", @leftArrowSelector(), (e) =>
      $container = @getContainer(e)

      currentPosition = $container.data("currentPosition") || 0
      return if currentPosition <= 0

      currentPosition -= @width
      @updateContainer $container, currentPosition

  rightArrowListener: ->
    $(document).on "click", @rightArrowSelector(), (e) =>
      $container = @getContainer(e)

      expositoresCount = $container.find(@expositorSelector).length
      return if expositoresCount <= 5

      maxAllowed = @width * (expositoresCount-3)
      currentPosition = $container.data("currentPosition") || 0
      return if currentPosition >= maxAllowed

      currentPosition += @width
      @updateContainer $container, currentPosition

  getContainer: (e) ->
    $(e.currentTarget).parent().find(@expositoresContainer)

  updateContainer: ($container, currentPosition) ->
    $container.data "currentPosition", currentPosition
    $container.css  "transform", "translateX(-#{currentPosition}px)"

new ExpositoresCarousel()
