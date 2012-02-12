class ProductsController < ApplicationController
  navigation :products, :as=>:second
  attr :subcategories
  def index
    @subcategories = true
  end

  def advanced_search
  end

  def special
  end
end
