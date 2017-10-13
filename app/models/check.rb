class Check < ApplicationRecord
  belongs_to :article
  belongs_to :checker
end
