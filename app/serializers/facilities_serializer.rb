class FacilitiesSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :name, :address
end
