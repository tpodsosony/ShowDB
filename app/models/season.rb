class Season < ApplicationRecord
  belongs_to :show_detail
  has_many :episodes
end
