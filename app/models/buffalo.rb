class Buffalo < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
         #and :omniauthable

  has_many :posts
  has_many :developers

  validates :username, presence: true, uniqueness: true, length: { is: 16 }
  validates :buffalo_name, presence: true, length: { maximum: 50 }
  validates :wow_auth, presence: true, length: { is: 16 }

  before_save :downcase_username
  before_save :should_generate_new_friendly_id?, if: :username_changed?

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
