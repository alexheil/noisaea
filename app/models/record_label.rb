class RecordLabel < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
 #:omniauthable

  has_one :record_label_profile, dependent: :destroy
  has_many :record_label_microposts, dependent: :destroy
  has_many :artist_micropost_comments, dependent: :destroy
  has_many :record_label_micropost_comments, dependent: :destroy
  has_many :venue_micropost_comments, dependent: :destroy
  has_many :producer_micropost_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :developer_comments, dependent: :destroy

  has_many :record_label_relationships, dependent: :destroy
  has_many :fans, through: :record_label_relationships
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

  has_many :record_label_shows, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }
  validates :label_name, presence: true, length: { maximum: 50 }

  before_save :downcase_username
  before_save :should_generate_new_friendly_id?, if: :username_changed?

  def self.search(search)
    where("label_name iLIKE ?", "%#{search}%")
  end

  #### GENRES ####

  def self.alternative
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Alternative")
  end

  def self.ambient
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Ambient")
  end

  def self.blues
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Blues")
  end

  def self.classical
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Classical")
  end

  def self.comedy
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Comedy")
  end

  def self.country
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Country")
  end

  def self.electronic
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Electronic")
  end

  def self.experimental
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Experimental")
  end

  def self.hiphoprap
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Hip-Hop/Rap")
  end

  def self.indie
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Indie")
  end

  def self.jazz
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Jazz")
  end

  def self.latino
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Latino")
  end

  def self.metal
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Metal")
  end

  def self.pop
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Pop")
  end

  def self.rbsoul
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "R&B/Soul")
  end

  def self.rock
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Rock")
  end

  def self.singersongwriter
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Singer/Songwriter")
  end

  def self.soundtrack
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "Soundtrack")
  end

  def self.world
    RecordLabel.joins(:record_label_profile).where("record_label_profiles.genre" => "World")
  end

  #### VOTES ####

  def artist_micropost_voted?(artist_micropost)
    ArtistMicropostVote.exists? record_label_id: id, artist_micropost_id: artist_micropost.id
  end

  def artist_micropost_unvote(artist_micropost)
    ArtistMicropostVote.find_by(record_label_id: id, artist_micropost_id: artist_micropost.id).destroy
  end

  def artist_micropost_vote_id(artist_micropost)
    ArtistMicropostVote.find_by(record_label_id: id, artist_micropost_id: artist_micropost.id).id
  end

  def record_label_micropost_voted?(record_label_micropost)
    RecordLabelMicropostVote.exists? record_label_id: id, record_label_micropost_id: record_label_micropost.id
  end

  def record_label_micropost_unvote(record_label_micropost)
    RecordLabelMicropostVote.find_by(record_label_id: id, record_label_micropost_id: record_label_micropost.id).destroy
  end

  def record_label_micropost_vote_id(record_label_micropost)
    RecordLabelMicropostVote.find_by(record_label_id: id, record_label_micropost_id: record_label_micropost.id).id
  end

  def venue_micropost_voted?(venue_micropost)
    VenueMicropostVote.exists? record_label_id: id, venue_micropost_id: venue_micropost.id
  end

  def venue_micropost_unvote(venue_micropost)
    VenueMicropostVote.find_by(record_label_id: id, venue_micropost_id: venue_micropost.id).destroy
  end

  def venue_micropost_vote_id(venue_micropost)
    VenueMicropostVote.find_by(record_label_id: id, venue_micropost_id: venue_micropost.id).id
  end

  def producer_micropost_voted?(producer_micropost)
    ProducerMicropostVote.exists? record_label_id: id, producer_micropost_id: producer_micropost.id
  end

  def producer_micropost_unvote(producer_micropost)
    ProducerMicropostVote.find_by(record_label_id: id, producer_micropost_id: producer_micropost.id).destroy
  end

  def producer_micropost_vote_id(producer_micropost)
    ProducerMicropostVote.find_by(record_label_id: id, producer_micropost_id: producer_micropost.id).id
  end

  def artist_micropost_comment_voted?(artist_micropost_comment)
    ArtistMicropostCommentVote.exists? record_label_id: id, artist_micropost_comment_id: artist_micropost_comment.id
  end

  def artist_micropost_comment_unvote(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(record_label_id: id, artist_micropost_comment_id: artist_micropost_comment.id).destroy
  end

  def artist_micropost_comment_vote_id(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(record_label_id: id, artist_micropost_comment_id: artist_micropost_comment.id).id
  end

  def record_label_micropost_comment_voted?(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.exists? record_label_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id
  end

  def record_label_micropost_comment_unvote(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(record_label_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).destroy
  end

  def record_label_micropost_comment_vote_id(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(record_label_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).id
  end

  def venue_micropost_comment_voted?(venue_micropost_comment)
    VenueMicropostCommentVote.exists? record_label_id: id, venue_micropost_comment_id: venue_micropost_comment.id
  end

  def venue_micropost_comment_unvote(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(record_label_id: id, venue_micropost_comment_id: venue_micropost_comment.id).destroy
  end

  def venue_micropost_comment_vote_id(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(record_label_id: id, venue_micropost_comment_id: venue_micropost_comment.id).id
  end

  def producer_micropost_comment_voted?(producer_micropost_comment)
    ProducerMicropostCommentVote.exists? record_label_id: id, producer_micropost_comment_id: producer_micropost_comment.id
  end

  def producer_micropost_comment_unvote(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(record_label_id: id, producer_micropost_comment_id: producer_micropost_comment.id).destroy
  end

  def producer_micropost_comment_vote_id(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(record_label_id: id, producer_micropost_comment_id: producer_micropost_comment.id).id
  end

  def post_comment_voted?(post_comment)
    PostCommentVote.exists? record_label_id: id, post_comment_id: post_comment.id
  end

  def post_comment_unvote(post_comment)
    PostCommentVote.find_by(record_label_id: id, post_comment_id: post_comment.id).destroy
  end

  def post_comment_vote_id(post_comment)
    PostCommentVote.find_by(record_label_id: id, post_comment_id: post_comment.id).id
  end

  def developer_comment_voted?(developer_comment)
    DeveloperCommentVote.exists? record_label_id: id, developer_comment_id: developer_comment.id
  end

  def developer_comment_unvote(developer_comment)
    DeveloperCommentVote.find_by(record_label_id: id, developer_comment_id: developer_comment.id).destroy
  end

  def developer_comment_vote_id(developer_comment)
    DeveloperCommentVote.find_by(record_label_id: id, developer_comment_id: developer_comment.id).id
  end

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
