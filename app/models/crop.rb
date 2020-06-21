class Crop < ApplicationRecord
  belongs_to :terrain, optional: true
  belongs_to :user
end
