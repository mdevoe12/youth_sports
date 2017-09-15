class FavoritePlayer < ApplicationRecord
  belongs_to :player
  belongs_to :admin
end
