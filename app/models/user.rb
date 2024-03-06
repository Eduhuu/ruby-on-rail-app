class User < ApplicationRecord

    has_many :publications, dependent: :restrict_with_exception
    has_many :comments, dependent: :restrict_with_exception   
    
end
