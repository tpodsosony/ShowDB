class Show < ApplicationRecord
    validates_presence_of :title, :show_id
    has_one :show_detail, dependent: :destroy
    
end
