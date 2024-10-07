# == Schema Information
#
# Table name: products
#
#  id                       :bigint(8)        not null, primary key
#  title                    :string(255)
#  description              :text(65535)
#  slug                     :string(255)
#  sku                      :string(255)
#  deal_active              :boolean
#  product_type             :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  regular_price            :float(24)
#  sale_price               :float(24)
#  slogan                   :string(255)
#  snippet                  :text(65535)
#  tldr                     :text(65535)
#  benefits                 :text(65535)
#  total_licenses_available :integer
#  published                :boolean
#  coming_soon              :boolean
#  name                     :string(255)
#

class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :order_product_licenses
  has_many :users, through: :order_product_licenses
  has_one_attached :logo
  has_one_attached :image
  has_many_attached :images
  acts_as_commontable dependent: :destroy
  ratyrate_rateable "overall"

  before_destroy :ensure_not_referenced_by_any_line_item

  validates_presence_of :sku, :name, :title, :slug, :slogan, :snippet, :tldr, :benefits, :description, :sale_price, :regular_price, :product_type, :image, :logo

  validates_uniqueness_of :name

  validate :main_image_format

  scope :published, -> { where published: true }
  scope :published_deal, -> { where published: true, deal_active: true }

  def diff_percentage
    (((regular_price - sale_price) / regular_price) * 100).round(0)
  end

  def total_licenses_remaining
    total_licenses_available - orders.sum(:quantity)
  end

  def to_param
    "#{id}-#{slug.downcase.gsub(' ', '-')}"
  end

  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end

    def main_image_format
      return unless image.attached?
      return if image.blob.content_type.start_with? 'image/'
      image.purge_later
      errors.add(:image, 'needs to be an image')
    end
end
