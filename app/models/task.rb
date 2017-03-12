class Task < ActiveRecord::Base
	belongs_to :user
  validates :name, presence: :true
  validates :users_id, numericality: { only_integer: true }
	validates :complete, inclusion: { in: [true, false], message: "%{value} must be 'true' or 'false'." } #BUG: truthiness slippery slope
	validate :due_in_future, unless: :persisted?
	validate :valid_date_check

	def due_in_future
    if due_date.present? && due_date < Date.today
    	errors.add(:due_date,"must be a date in the future.")
    end
	end

	def valid_date_check
		if due_date.present? && due_date.is_a?(Date) == false
      errors.add(:due_date, 'must be a valid date or else empty.')
		end
	end
end
