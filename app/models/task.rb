class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :priority, inclusion: { in: %w(low medium high) }, allow_blank: true
end
