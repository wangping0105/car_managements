module ApplicationHelper
  # 字符串取前length 长度的值
  def deal_string(str, length)
    str.length > length ? "#{str[0...length]}...": str
  end

  def nav_bar_active(_controller_name, _action_name = nil)
    if controller_name == _controller_name && (action_name == _action_name || _action_name.blank?)
      "active"
    end
  end

  def current_cell
    @current_cell ||= (current_user.cells.selected.first || current_user.cells.first)
  end
end
