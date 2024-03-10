class Publication < ApplicationRecord
    has_one_attached :image

    validates :title, presence: true
    validates :content, presence: true

    has_many :comments, dependent: :restrict_with_exception    
    belongs_to :user, default: -> {Current.user}
end
