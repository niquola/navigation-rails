class ProductsNavigation < Navigation::Base
  def draw
    item('Catalog', products_path) do
      if subcategories
        item('Category 1',products_path(:category=>1))
        item('Category 2',products_path(:category=>2))
        item('Category 3',products_path(:category=>3))
      end
    end
    item('Advanced Search', advanced_search_products_path)
    item('Special products', special_products_path)
  end
end
