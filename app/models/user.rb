class User < ApplicationRecord
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates :happiness, inclusion: 1..5, allow_nil: true
  validates :nausea, inclusion: 1..5, allow_nil: true

  def mood
    if self.happiness && self.nausea
      (self.happiness - self.nausea) > 0 ? "happy" : "sad"
    end
  end

end
