class Purchase < ActiveRecord::Base

  belongs_to :lemonade_type

  validates :quantity, :lemonade_type_id, presence: true

  def sale_total
    lemonade_type.price * quantity
  end

end
