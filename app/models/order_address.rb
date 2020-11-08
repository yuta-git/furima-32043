class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.' }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
