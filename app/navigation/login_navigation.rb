class LoginNavigation < Navigation::Base
  def draw
    item('Login', login_path)
    item('Register', login_path)
  end
end
