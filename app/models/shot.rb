class Shot < ActiveRecord::Base
  validates :name, presence: true
  validates :image, presence: true
  belongs_to :project
  belongs_to :owner, class_name: 'User'

  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

end
