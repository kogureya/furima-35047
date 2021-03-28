class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  validates :image, :name, :info, presence: true
  validates :price, presence: true, format: {with: /^[0-9]+$/}, inclusion: {in:300..9999999}

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecture_id
    validates :sales_status_id
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
  end
end