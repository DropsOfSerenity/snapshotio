class Shot < ActiveRecord::Base
  validates :name, presence: true
  validates :image, presence: true
  belongs_to :project

  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
