# Account
#  - model of the account
#  - initially created by devise
#
class Account < ApplicationRecord
  has_many :offers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
