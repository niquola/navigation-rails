class WellcomeController < ApplicationController
  navigation :home,:only=>:index,:as=>:second_navigation

  def index
  end

  def login
  end
end
