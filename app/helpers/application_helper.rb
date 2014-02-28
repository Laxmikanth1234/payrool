module ApplicationHelper
  def menu_status(params,controller,action='')
    if params[:action] == action && params[:controller] == controller
      return "active"
    end
    if params[:controller] == controller && action.blank?
      return "active"
    end
  end
  
 def flash_message
  flash.map do |key, msg|
    content_tag :div, msg, :id => key, :class => 'flash'
  end.join
 end
  
end
