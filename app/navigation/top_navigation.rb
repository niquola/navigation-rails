class TopNavigation < Navigation::Base
  def draw
    item('Home', root_path)
    item('Products', products_path)
    item('Contacts', root_path)
    if current_user.present?
      item("#{current_user} Profile",login_path)
    else
      item('Login',login_path)
    end
  end
end
