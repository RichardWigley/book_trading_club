module ApplicationHelper
  MESSAGES = { notice: ['message message--notice', 'info-circle 2x'],
               alert:  ['message message--alert', 'bell 2x'] }.freeze
  def messages(name, msg)
    message = MESSAGES[name.to_sym]
    content_tag :div, class: message[0] do
      content_tag :div, class: 'container' do
        content_tag(:span, fa_icon(message[1], text: msg))
      end
    end
  end
end
