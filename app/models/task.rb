class Task < ApplicationRecord
    belongs_to :business
    validates_uniqueness_of :title
    mount_uploader :image, ImageUploader

end
