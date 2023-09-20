class Job < ApplicationRecord
  belongs_to :user
  belongs_to :gardener, class_name: "User"
  belongs_to :farmer, class_name: "User"

end
