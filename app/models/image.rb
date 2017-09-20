class Image
  attr_reader :picture

  def initialize(attribute = {})
    @picture = attribute[:picture][:large]
  end

  def self.random_user
    images = RandomUserService.random_user

    images.map do |image|
      new(image)
    end
  end

end
