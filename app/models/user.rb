class User < ApplicationRecord
    has_secure_password
    
    has_many :carts

    # has_one_attached :photo

    validates :email, presence: true, uniqueness: true
    validates :name, :address, :password, :presence => true
    validates :number, format: { with: /\A\d{10,12}\z/, message: 'invalid phone number'}
    # validates :password, length: { minimum: 6 }
    enum status: %i[ unverified active suspended ], _default: 0

end