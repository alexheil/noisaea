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
  has_many :developer_comments, dependent: :destroy

  has_many :artist_micropost_votes, dependent: :destroy
  has_many :record_label_micropost_votes, dependent: :destroy
  has_many :venue_micropost_votes, dependent: :destroy
  has_many :producer_micropost_votes, dependent: :destroy

  has_many :artist_micropost_comment_votes, dependent: :destroy
  has_many :record_label_micropost_comment_votes, dependent: :destroy
  has_many :venue_micropost_comment_votes, dependent: :destroy
  has_many :producer_micropost_comment_votes, dependent: :destroy
  has_many :post_comment_votes, dependent: :destroy
  has_many :developer_comment_votes, dependent: :destroy

  has_many :artist_shows, through: :artists
  has_many :record_label_shows, through: :record_labels
  has_many :venue_shows, through: :venues

  has_many :artist_videos, through: :artists
  has_many :record_label_videos, through: :record_labels
  has_many :venue_videos, through: :venues

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }
  validates :fan_name, presence: true, length: { maximum: 50 }

  before_save :downcase_username
  before_save :should_generate_new_friendly_id?, if: :username_changed?

  def following_artist?(artist)
    ArtistRelationship.exists? fan_id: id, artist_id: artist.id
  end

  def unfollow_artist(artist)
    ArtistRelationship.find_by(fan_id: id, artist_id: artist.id).destroy
  end

  def artist_relationship_id(artist)
    ArtistRelationship.find_by(fan_id: id, artist_id: artist.id).id
  end

  def artist_micropost_voted?(artist_micropost)
    ArtistMicropostVote.exists? fan_id: id, artist_micropost_id: artist_micropost.id
  end

  def artist_micropost_unvote(artist_micropost)
    ArtistMicropostVote.find_by(fan_id: id, artist_micropost_id: artist_micropost.id).destroy
  end

  def artist_micropost_vote_id(artist_micropost)
    ArtistMicropostVote.find_by(fan_id: id, artist_micropost_id: artist_micropost.id).id
  end

  def artist_micropost_comment_voted?(artist_micropost_comment)
    ArtistMicropostCommentVote.exists? fan_id: id, artist_micropost_comment_id: artist_micropost_comment.id
  end

  def artist_micropost_comment_unvote(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(fan_id: id, artist_micropost_comment_id: artist_micropost_comment.id).destroy
  end

  def artist_micropost_comment_vote_id(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(fan_id: id, artist_micropost_comment_id: artist_micropost_comment.id).id
  end

  def following_record_label?(record_label)
    RecordLabelRelationship.exists? fan_id: id, record_label_id: record_label.id
  end

  def unfollow_record_label(record_label)
    RecordLabelRelationship.find_by(fan_id: id, record_label_id: record_label.id).destroy
  end

  def record_label_relationship_id(record_label)
    RecordLabelRelationship.find_by(fan_id: id, record_label_id: record_label.id).id
  end

  def record_label_micropost_voted?(record_label_micropost)
    RecordLabelMicropostVote.exists? fan_id: id, record_label_micropost_id: record_label_micropost.id
  end

  def record_label_micropost_unvote(record_label_micropost)
    RecordLabelMicropostVote.find_by(fan_id: id, record_label_micropost_id: record_label_micropost.id).destroy
  end

  def record_label_micropost_vote_id(record_label_micropost)
    RecordLabelMicropostVote.find_by(fan_id: id, record_label_micropost_id: record_label_micropost.id).id
  end

  def record_label_micropost_comment_voted?(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.exists? fan_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id
  end

  def record_label_micropost_comment_unvote(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(fan_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).destroy
  end

  def record_label_micropost_comment_vote_id(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(fan_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).id
  end

  def following_venue?(venue)
    VenueRelationship.exists? fan_id: id, venue_id: venue.id
  end

  def unfollow_venue(venue)
    VenueRelationship.find_by(fan_id: id, venue_id: venue.id).destroy
  end

  def venue_relationship_id(venue)
    VenueRelationship.find_by(fan_id: id, venue_id: venue.id).id
  end

  def venue_micropost_voted?(venue_micropost)
    VenueMicropostVote.exists? fan_id: id, venue_micropost_id: venue_micropost.id
  end

  def venue_micropost_unvote(venue_micropost)
    VenueMicropostVote.find_by(fan_id: id, venue_micropost_id: venue_micropost.id).destroy
  end

  def venue_micropost_vote_id(venue_micropost)
    VenueMicropostVote.find_by(fan_id: id, venue_micropost_id: venue_micropost.id).id
  end

  def venue_micropost_comment_voted?(venue_micropost_comment)
    VenueMicropostCommentVote.exists? fan_id: id, venue_micropost_comment_id: venue_micropost_comment.id
  end

  def venue_micropost_comment_unvote(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(fan_id: id, venue_micropost_comment_id: venue_micropost_comment.id).destroy
  end

  def venue_micropost_comment_vote_id(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(fan_id: id, venue_micropost_comment_id: venue_micropost_comment.id).id
  end

  def following_producer?(producer)
    ProducerRelationship.exists? fan_id: id, producer_id: producer.id
  end

  def unfollow_producer(producer)
    ProducerRelationship.find_by(fan_id: id, producer_id: producer.id).destroy
  end

  def producer_relationship_id(producer)
    ProducerRelationship.find_by(fan_id: id, producer_id: producer.id).id
  end

  def producer_micropost_voted?(producer_micropost)
    ProducerMicropostVote.exists? fan_id: id, producer_micropost_id: producer_micropost.id
  end

  def producer_micropost_unvote(producer_micropost)
    ProducerMicropostVote.find_by(fan_id: id, producer_micropost_id: producer_micropost.id).destroy
  end

  def producer_micropost_vote_id(producer_micropost)
    ProducerMicropostVote.find_by(fan_id: id, producer_micropost_id: producer_micropost.id).id
  end

  def producer_micropost_comment_voted?(producer_micropost_comment)
    ProducerMicropostCommentVote.exists? fan_id: id, producer_micropost_comment_id: producer_micropost_comment.id
  end

  def producer_micropost_comment_unvote(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(fan_id: id, producer_micropost_comment_id: producer_micropost_comment.id).destroy
  end

  def producer_micropost_comment_vote_id(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(fan_id: id, producer_micropost_comment_id: producer_micropost_comment.id).id
  end

  def post_comment_voted?(post_comment)
    PostCommentVote.exists? fan_id: id, post_comment_id: post_comment.id
  end

  def post_comment_unvote(post_comment)
    PostCommentVote.find_by(fan_id: id, post_comment_id: post_comment.id).destroy
  end

  def post_comment_vote_id(post_comment)
    PostCommentVote.find_by(fan_id: id, post_comment_id: post_comment.id).id
  end

  def developer_comment_voted?(developer_comment)
    DeveloperCommentVote.exists? fan_id: id, developer_comment_id: developer_comment.id
  end

  def developer_comment_unvote(developer_comment)
    DeveloperCommentVote.find_by(fan_id: id, developer_comment_id: developer_comment.id).destroy
  end

  def developer_comment_vote_id(developer_comment)
    DeveloperCommentVote.find_by(fan_id: id, developer_comment_id: developer_comment.id).id
  end

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
