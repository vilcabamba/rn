# copied from https://github.com/plataformatec/devise/blob/1a0192201b317d3f1bac88f5c5b4926d527b1b39/app/helpers/devise_helper.rb
module DeviseHelper
  def devise_error_messages_for(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map do |msg|
      content_tag(:li, msg)
    end.join
    
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
