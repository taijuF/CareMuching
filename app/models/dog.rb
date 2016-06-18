class Dog < ActiveRecord::Base
	geocoded_by :facility
	after_validation :geocode, if: :facility_changed?
end
