module ItemsHelper
  def buyers_exists?(item_id)
    Buyer.exists?(item_id:)
  end
end
