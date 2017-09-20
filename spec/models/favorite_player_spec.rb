require 'rails_helper'

RSpec.describe FavoritePlayer, type: :model do
  it { should belong_to(:player) }
end
