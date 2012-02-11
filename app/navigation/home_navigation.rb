class HomeNavigation < Navigation::Base
  def draw
    group do
      item('Patients', root_path)
      item('My patients', root_path)
      item('Dictations', root_path)
    end

    group 'Reports' do
      item('Patients Summary', root_path)
      item('Documents', root_path)
    end
  end
end
