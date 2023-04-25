class Entity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true, numericality: { float: true }
  validates :groups, presence: true
end
