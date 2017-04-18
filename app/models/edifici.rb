class Edifici < ApplicationRecord

	belongs_to :user
	has_one :identificacio
	has_one :envolupant
	has_one :instalacio
	has_one :consum
	has_many :propostes

end
