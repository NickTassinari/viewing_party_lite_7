class ViewingPartyUser < ApplicationRecord
  belongs_to :users
  belongs_to :viewing_party
end