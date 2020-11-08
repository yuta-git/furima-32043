class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.' }
    validates :image
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_day_id
  end

  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :prefecture
end
