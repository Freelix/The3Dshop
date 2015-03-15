module ItemsHelper

  def format_price
    unless @item.nil? && @item.price.nil? 
      number_with_precision(@item.price, :precision => 2)
    end
  end

end
