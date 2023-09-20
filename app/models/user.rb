class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gardens
  has_many :listings
  has_many :enrollments
  has_many :jobs
  has_many :enrolled_gardens, through: :enrollments, source: :garden
  has_many :sales, class_name: "Order", foreign_key: "farmer_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"

  validates :first_name, :last_name, presence: true

  def enrolled_in?(garden)
    return enrolled_gardens.include?(garden)
  end

  def self.get_farmer(garden)
    get_farmer_first = User.where(:id => garden.user_id)
  end
end
