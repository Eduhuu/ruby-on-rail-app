class User < ApplicationRecord

    has_secure_password

    has_many :publications, dependent: :restrict_with_exception, dependent: :destroy
    has_many :comments, dependent: :restrict_with_exception, dependent: :destroy   
        
    validates :name, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    # validates :rol, presence: true
    # validates :blocked, presence: true

end
