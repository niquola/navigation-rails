class HomeNavigation < Navigation::Base
  def draw
    item('Patients', root_path)
    item('My patients', root_path)
    item('Dictations', root_path)
  end
end
