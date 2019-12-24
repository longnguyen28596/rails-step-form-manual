class User < ApplicationRecord
    validates :email, :passsword, presence: true, on: :step1
    validates :first_name, :last_name, presence: true, on: :step2
end
