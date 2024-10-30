class ShowDetail < ApplicationRecord
  belongs_to :show
  has_many :seasons
end
