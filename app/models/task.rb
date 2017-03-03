class Task < ApplicationRecord
	belongs_to :user
  validates :name, presence: :true
  validates :users_id, numericality: { only_integer: true }
	validates :complete, inclusion: { in: [true, false], message: "%{value} must be 'true' or 'false'." }

end
