class User < ApplicationRecord
    validates :name , presence: true
    validates :phone , presence: true
end
