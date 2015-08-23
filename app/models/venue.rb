class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

 devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
 #:omniauthable

  has_one :venue_profile, dependent: :destroy
  has_many :venue_microposts, dependent: :destroy
  has_many :artist_micropost_comments, dependent: :destroy
  has_many :record_label_micropost_comments, dependent: :destroy
  has_many :venue_micropost_comments, dependent: :destroy
  has_many :producer_micropost_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :venue_relationships, dependent: :destroy
  has_many :fans, through: :venue_relationships
  belongs_to :fan

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[\S]+\Z/i }
  validates :venue_name, presence: true, length: { maximum: 50 }

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
