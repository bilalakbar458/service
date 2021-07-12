class Task < ApplicationRecord
    belongs_to :business
    validates_uniqueness_of :title

end
