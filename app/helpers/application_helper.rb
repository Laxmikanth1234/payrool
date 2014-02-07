module ApplicationHelper
  def menu_status(params,controller,action='')
    if params[:action] == action && params[:controller] == controller
      return "active"
    end
    if params[:controller] == controller && action.blank?
      return "active"
    end
  end
end
