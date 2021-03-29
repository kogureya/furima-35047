class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  has_one_attached :image

  validates :image, :name, :info, :price, presence: true

  validates :price, format: { with: /0-9/, message: 'Half-width number' }
  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

  with_options numericality: { other_than: 1, message: 'select' } do
    validates :category_id
    validates :prefecture_id
    validates :sales_status_id
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
  end
end
