class Fan < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
 #:omniauthable

  has_one :fan_profile, dependent: :destroy

  has_many :artist_relationships, dependent: :destroy
  has_many :artists, through: :artist_relationships
  belongs_to :artist

  has_many :record_label_relationships, dependent: :destroy
  has_many :record_labels, through: :record_label_relationships
  belongs_to :record_label

  has_many :venue_relationships, dependent: :destroy
  has_many :venues, through: :venue_relationships
  belongs_to :venue

  has_many :producer_relationships, dependent: :destroy
  has_many :producers, through: :producer_relationships
  belongs_to :producer

  has_many :artist_microposts, through: :artists
  has_many :record_label_microposts, through: :record_labels
  has_many :venue_microposts, through: :venues
  has_many :producer_microposts, through: :producers

  has_many :artist_micropost_comments, dependent: :destroy
  has_many :record_label_micropost_comments, dependent: :destroy
  has_many :venue_micropost_comments, dependent: :destroy
  has_many :producer_micropost_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[\S]+\Z/i }
  validates :fan_name, presence: true, length: { maximum: 50 }

  before_save :downcase_username
  before_save :should_generate_new_friendly_id?, if: :username_changed?

  def following_artist?(artist)
    ArtistRelationship.exists? fan_id: id, artist_id: artist.id
  end

  def unfollow_artist(artist)
    ArtistRelationship.find_by(fan_id: id, artist_id: artist.id).destroy
  end

  def following_record_label?(record_label)
    RecordLabelRelationship.exists? fan_id: id, record_label_id: record_label.id
  end

  def unfollow_record_label(record_label)
    RecordLabelRelationship.find_by(fan_id: id, record_label_id: record_label.id).destroy
  end

  def following_venue?(venue)
    VenueRelationship.exists? fan_id: id, venue_id: venue.id
  end

  def unfollow_venue(venue)
    VenueRelationship.find_by(fan_id: id, venue_id: venue.id).destroy
  end

  def following_producer?(producer)
    ProducerRelationship.exists? fan_id: id, producer_id: producer.id
  end

  def unfollow_producer(producer)
    ProducerRelationship.find_by(fan_id: id, producer_id: producer.id).destroy
  end

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
