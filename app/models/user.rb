class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :unarchived, -> { where(archived_at: nil) }

  def to_s
    "#{email} [#{admin? ? 'Admin' : 'User'}]"
  end

  def archive
    update(archived_at: Time.now)
  end

  def active_for_authentication?
    super && self.archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end
end
