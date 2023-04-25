class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entity

  validates :name, presence: true
  validates :icon, presence: true, format: {with: URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}

end
