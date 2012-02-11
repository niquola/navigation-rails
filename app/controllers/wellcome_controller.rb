class WellcomeController < ApplicationController
  navigation :home,:only=>:index,:as=>:second
  navigation :login,:only=>:login,:as=>:second

  def index
  end

  def login
    @current_user = 'Nicola'
  end
end
