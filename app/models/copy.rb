class Copy < ActiveRecord::Base
  belongs_to :book
  default_scope -> { order('created_at DESC') }
  validates :book_id, presence: true
  validates :price, presence: true
end
