module ApplicationHelper
  MESSAGES = { notice: FlashStyle.new(css: 'message message--notice', icon: 'info-circle 2x'),
               alert:  FlashStyle.new(css: 'message message--alert', icon: 'bell 2x') }.freeze
  # messages(flash_key, msg)
  #  - outputs icon and text message
  #  - flash_key - name of flash type
  #  - msg - message to dislay
  #
  def messages(flash_key, msg)
    style = MESSAGES[flash_key.to_sym]
    content_tag :div, class: 'js-slow-time ' + style.css do
      content_tag :div, class: 'layout__w-wrapper' do
        content_tag(:span, fa_icon(style.icon, text: msg))
      end
    end
  end

  def show_errors(object, field_name)
    return if object.errors.empty? && object.errors.messages[field_name].blank?

    object.errors.messages[field_name].join(', ')
  end
end
