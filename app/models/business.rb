class Business < ApplicationRecord

    has_many :connectors
    has_many :tasks
    has_many :users, through: :connectors
end
