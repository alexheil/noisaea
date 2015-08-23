class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
         #and :omniauthable

  has_one :artist_profile, dependent: :destroy
  has_many :artist_microposts, dependent: :destroy
  has_many :artist_micropost_comments, dependent: :destroy
  has_many :record_label_micropost_comments, dependent: :destroy
  has_many :venue_micropost_comments, dependent: :destroy
  has_many :producer_micropost_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :artist_relationships, dependent: :destroy
  has_many :fans, through: :artist_relationships
  belongs_to :fan

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[\S]+\Z/i }
  validates :artist_name, presence: true, length: { maximum: 50 }

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
