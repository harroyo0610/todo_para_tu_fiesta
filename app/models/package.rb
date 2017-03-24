class Package < ApplicationRecord
	validates :persons, presence: true
	validates :glass_person, presence: true	
end


