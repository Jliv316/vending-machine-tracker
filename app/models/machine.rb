class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_snack_price
    prices = snacks.map do |snack|
      snack.price
    end
   average =  (prices.sum / prices.length)
   return average
  end
end
