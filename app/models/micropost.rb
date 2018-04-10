class Micropost < ApplicationRecord::Base
    belongs_to :user
    default_scope -> { order('created_at DESC')}
    validates :contact, presence: true,length:{ maximum: 140 }
    validates :user_id, presence: true
    
end
