class Enrollment < ApplicationRecord
  belongs_to :garden
  belongs_to :user
  before_save :add_name

  def get_first_name(user_id)
    gardener = User.find_by_id(user_id)
    get_first_name = gardener.first_name
  end

  def get_last_name(user_id)
    gardener = User.find_by_id(user_id)
    get_last_name = gardener.last_name
  end

  def get_email(user_id)
    gardener = User.find_by_id(user_id)
    get_email = gardener.email
  end

  private

  def add_name
    self.first_name = user.first_name
    self.last_name = user.last_name
  end

end
