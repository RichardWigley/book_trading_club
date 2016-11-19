module ApplicationHelper
  MESSAGES = { notice: ['message message--notice', 'info-circle 2x'],
               alert:  ['message message--alert', 'bell 2x'] }.freeze
  # messages(flash_key, msg)
  #  - outputs icon and text message
  #  - flash_key - name of flash type
  #  - msg - message to dislay
  #
  def messages(flash_key, msg)
    message = MESSAGES[flash_key.to_sym]
    content_tag :div, class: 'js-slow-time ' + message[0] do
      content_tag :div, class: 'layout__w-wrapper' do
        content_tag(:span, fa_icon(message[1], text: msg))
      end
    end
  end

  def show_errors(object, field_name)
    return if object.errors.empty? && object.errors.messages[field_name].blank?

    object.errors.messages[field_name].join(', ')
  end
end
