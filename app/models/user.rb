# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewing_party_users
  has_many :viewing_parties, through: :viewing_party_users
  
  validates :email, uniqueness: true
  validates_presence_of :password

  has_secure_password
end
