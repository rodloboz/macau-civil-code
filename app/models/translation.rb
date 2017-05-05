class Translation < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :heading
end
