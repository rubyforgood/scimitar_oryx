class Picture < ApplicationRecord
  belongs_to :animal
  belongs_to :facility

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200>',
    medium: '300x300>',
    large:   '400x400>',
    portfolio_small: '500x300>',
    portfolio_large: '750x500>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  before_save :destroy_image?

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  private
  def destroy_image?
    self.image.clear if image_delete == "1"
  end
end
