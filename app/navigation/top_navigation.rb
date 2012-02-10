class TopNavigation < Navigation::Base
  def draw
    item('Home', root_path)
    item('Products', root_path)
    item('Contacts', root_path)
    item('Login',login_path)  unless current_user.present?
  end
end
