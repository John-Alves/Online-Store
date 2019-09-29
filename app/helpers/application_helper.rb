module ApplicationHelper

  def configure_and_display_flash_messages
    html = ''
    unless flash[:notice].nil? && flash[:error].nil?
      html << mount_flash_message_html
    end
    html.html_safe
  end

  def mount_flash_message_html
    if flash[:notice]
      message = flash[:notice]
      type = 'alert-success'
    else
      message = flash[:error]
      type = 'alert-danger'
    end

    flash[:error_list]&.each_key do |key|
      message << '<ul style="margin-bottom: 0">'
      message << '<li>' + flash[:error_list][key].join + '</li>'
      message << '</ul>'
    end

    html = "<div class='alert #{type} alert-dismissible fade show' role='alert'>#{message}"
    html << ' <button type="button" class="close" data-dismiss="alert" aria-label="Close">'
    html << '   <span aria-hidden="true">&times;</span>'
    html << ' </button>'
    html << '</div>'
    html
  end
end
