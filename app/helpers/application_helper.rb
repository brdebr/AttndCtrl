module ApplicationHelper
  def current_active_page?(test_path)
    return 'active' if request.path == test_path
    ''
  end
end
