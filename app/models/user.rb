class User < ApplicationRecord
  has_secure_password
  has_many :rentals, :foreign_key => 'borrower_id'
  has_many :tools, :foreign_key => 'lender_id'
  has_many :listings, through: :tools
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :location, presence: true

  # validates :password, presence: true
  # validates :password_confirmation, presence: true

  def name=(name)
    @name = name.capitalize!
  end

  def name
    @name
  end

end
