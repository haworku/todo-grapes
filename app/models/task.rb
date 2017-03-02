class Task < ApplicationRecord
	belongs_to :user
  # validates :name, presence: :true
  # validates :complete, presence: :true
  # validates :users_id, presence: :true

end
