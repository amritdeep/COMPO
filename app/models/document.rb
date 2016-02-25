class Document < ActiveRecord::Base
	# disable STI
	self.inheritance_column = :_type_disabled
end
