class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :block_number, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :prefecture, :city, :block_number, :order_id, :user_id, :item_id

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, length: { maximum: 11 }


  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture, city: city, block_number: 
      block_number, building: building, phone_number: phone_number, order_id: order.id)

  end
  

end