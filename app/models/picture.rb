class Picture < ActiveRecord::Base
  belongs_to :animal
  belongs_to :facility


  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large:   '400x400>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
