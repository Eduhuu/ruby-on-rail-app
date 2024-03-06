class Publication < ApplicationRecord

    belongs_to :user
    has_many :comments, dependent: :restrict_with_exception    

end
