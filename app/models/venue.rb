class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

 devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
 #:omniauthable

  has_one :venue_profile, dependent: :destroy

  has_many :artist_notifications, foreign_key: 'notifier_venue_id', dependent: :destroy

  has_many :venue_microposts, dependent: :destroy
  has_many :artist_micropost_comments, dependent: :destroy
  has_many :record_label_micropost_comments, dependent: :destroy
  has_many :venue_micropost_comments, dependent: :destroy
  has_many :producer_micropost_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :developer_comments, dependent: :destroy

  has_many :venue_relationships, dependent: :destroy
  has_many :fans, through: :venue_relationships
  belongs_to :fan

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

  has_many :venue_shows, dependent: :destroy

  has_many :venue_videos, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }
  validates :venue_name, presence: true, length: { maximum: 50 }

  before_save :downcase_username
  before_save :should_generate_new_friendly_id?, if: :username_changed?

  def self.search(search)
    where("venue_name iLIKE ?", "%#{search}%")
  end

  def artist_micropost_voted?(artist_micropost)
    ArtistMicropostVote.exists? venue_id: id, artist_micropost_id: artist_micropost.id
  end

  def artist_micropost_unvote(artist_micropost)
    ArtistMicropostVote.find_by(venue_id: id, artist_micropost_id: artist_micropost.id).destroy
  end

  def artist_micropost_vote_id(artist_micropost)
    ArtistMicropostVote.find_by(venue_id: id, artist_micropost_id: artist_micropost.id).id
  end

  def record_label_micropost_voted?(record_label_micropost)
    RecordLabelMicropostVote.exists? venue_id: id, record_label_micropost_id: record_label_micropost.id
  end

  def record_label_micropost_unvote(record_label_micropost)
    RecordLabelMicropostVote.find_by(venue_id: id, record_label_micropost_id: record_label_micropost.id).destroy
  end

  def record_label_micropost_vote_id(record_label_micropost)
    RecordLabelMicropostVote.find_by(venue_id: id, record_label_micropost_id: record_label_micropost.id).id
  end

  def venue_micropost_voted?(venue_micropost)
    VenueMicropostVote.exists? venue_id: id, venue_micropost_id: venue_micropost.id
  end

  def venue_micropost_unvote(venue_micropost)
    VenueMicropostVote.find_by(venue_id: id, venue_micropost_id: venue_micropost.id).destroy
  end

  def venue_micropost_vote_id(venue_micropost)
    VenueMicropostVote.find_by(venue_id: id, venue_micropost_id: venue_micropost.id).id
  end

  def producer_micropost_voted?(producer_micropost)
    ProducerMicropostVote.exists? venue_id: id, producer_micropost_id: producer_micropost.id
  end

  def producer_micropost_unvote(producer_micropost)
    ProducerMicropostVote.find_by(venue_id: id, producer_micropost_id: producer_micropost.id).destroy
  end

  def producer_micropost_vote_id(producer_micropost)
    ProducerMicropostVote.find_by(venue_id: id, producer_micropost_id: producer_micropost.id).id
  end

  def artist_micropost_comment_voted?(artist_micropost_comment)
    ArtistMicropostCommentVote.exists? venue_id: id, artist_micropost_comment_id: artist_micropost_comment.id
  end

  def artist_micropost_comment_unvote(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(venue_id: id, artist_micropost_comment_id: artist_micropost_comment.id).destroy
  end

  def artist_micropost_comment_vote_id(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(venue_id: id, artist_micropost_comment_id: artist_micropost_comment.id).id
  end

  def record_label_micropost_comment_voted?(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.exists? venue_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id
  end

  def record_label_micropost_comment_unvote(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(venue_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).destroy
  end

  def record_label_micropost_comment_vote_id(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(venue_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).id
  end

  def venue_micropost_comment_voted?(venue_micropost_comment)
    VenueMicropostCommentVote.exists? venue_id: id, venue_micropost_comment_id: venue_micropost_comment.id
  end

  def venue_micropost_comment_unvote(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(venue_id: id, venue_micropost_comment_id: venue_micropost_comment.id).destroy
  end

  def venue_micropost_comment_vote_id(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(venue_id: id, venue_micropost_comment_id: venue_micropost_comment.id).id
  end

  def producer_micropost_comment_voted?(producer_micropost_comment)
    ProducerMicropostCommentVote.exists? venue_id: id, producer_micropost_comment_id: producer_micropost_comment.id
  end

  def producer_micropost_comment_unvote(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(venue_id: id, producer_micropost_comment_id: producer_micropost_comment.id).destroy
  end

  def producer_micropost_comment_vote_id(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(venue_id: id, producer_micropost_comment_id: producer_micropost_comment.id).id
  end

  def post_comment_voted?(post_comment)
    PostCommentVote.exists? venue_id: id, post_comment_id: post_comment.id
  end

  def post_comment_unvote(post_comment)
    PostCommentVote.find_by(venue_id: id, post_comment_id: post_comment.id).destroy
  end

  def post_comment_vote_id(post_comment)
    PostCommentVote.find_by(venue_id: id, post_comment_id: post_comment.id).id
  end

  def developer_comment_voted?(developer_comment)
    DeveloperCommentVote.exists? venue_id: id, developer_comment_id: developer_comment.id
  end

  def developer_comment_unvote(developer_comment)
    DeveloperCommentVote.find_by(venue_id: id, developer_comment_id: developer_comment.id).destroy
  end

  def developer_comment_vote_id(developer_comment)
    DeveloperCommentVote.find_by(venue_id: id, developer_comment_id: developer_comment.id).id
  end

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
