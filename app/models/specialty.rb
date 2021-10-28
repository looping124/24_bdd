class Specialty < ApplicationRecord
  has_many :lessons
  has_many :doctors, through: :lessons
end
