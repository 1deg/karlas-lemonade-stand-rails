class LemonadeType < ActiveRecord::Base

  validates :label, :price, presence: true

end
