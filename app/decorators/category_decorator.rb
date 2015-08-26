class CategoryDecorator < LittleDecorator
  def image_for_carousel
    image_tag image_url,
              class: "img-circle category-image",
              data: {
                original: image_url,
                hover: image_hover_url
              }
  end

  private

  def image_url
    @image_url ||= "/categories/#{to_slug}.png"
  end

  def image_hover_url
    @image_hover_url ||= "/categories/#{to_slug}_over.png"
  end
end
