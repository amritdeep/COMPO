class Document < ActiveRecord::Base
	## disable STI
	self.inheritance_column = :_type_disabled

	## Handle validation
	validates :name, presence: true, uniqueness: true
	validates :type, presence: true
end
