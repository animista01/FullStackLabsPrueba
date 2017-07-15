class Ticket < ActiveRecord::Base

	validates :costumer_message, presence: true
	validates :costumer_id, presence: true

	belongs_to :users
end
