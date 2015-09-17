module ApplicationHelper
  def normal_key(key)
    key = case key
      when 'alert' then 'error'
      when 'notice' then 'info'
      else key
    end
  end
  def active? active_string
    flag = "#{controller_name}##{action_name}" == active_string
    flag ? 'active' : ''
  end
end
