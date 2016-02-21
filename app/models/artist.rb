class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
         #and :omniauthable

  has_one :artist_profile, dependent: :destroy

  has_many :artist_notifications, dependent: :destroy

  has_many :artist_microposts, dependent: :destroy
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

  has_many :artist_shows, dependent: :destroy

  has_many :artist_videos, dependent: :destroy

  has_many :artist_merches, dependent: :destroy

  has_many :artist_albums, dependent: :destroy
  has_many :artist_tracks, through: :artist_albums

  has_many :artist_relationships, dependent: :destroy
  has_many :fans, through: :artist_relationships
  belongs_to :fan

  validates :username, presence: true, uniqueness: true, length: { maximum: 25 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }
  validates :artist_name, presence: true, length: { maximum: 50 }

  before_save :downcase_username
  before_save :should_generate_new_friendly_id?, if: :username_changed?

  def self.lazy_mailer
    Artist.includes(:artist_microposts).where(:artist => "created_at < ?", 24.hours.ago).where( :artist_microposts => { :artist_id => nil } ).find_each do |artist|
      ArtistMailer.lazy_email(artist).deliver_now
    end
  end

  includes(:microposts).where( :microposts => { :user_id => nil } )

  def self.search(search)
    where("artist_name iLIKE ?", "%#{search}%")
  end

  #### GENRES ####

  def self.alternative
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Alternative")
  end

  def self.ambient
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Ambient")
  end

  def self.blues
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Blues")
  end

  def self.classical
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Classical")
  end

  def self.comedy
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Comedy")
  end

  def self.country
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Country")
  end

  def self.electronic
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Electronic")
  end

  def self.experimental
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Experimental")
  end

  def self.hiphoprap
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Hip-Hop/Rap")
  end

  def self.indie
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Indie")
  end

  def self.jazz
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Jazz")
  end

  def self.latino
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Latino")
  end

  def self.metal
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Metal")
  end

  def self.pop
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Pop")
  end

  def self.rbsoul
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "R&B/Soul")
  end

  def self.rock
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Rock")
  end

  def self.singersongwriter
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Singer/Songwriter")
  end

  def self.soundtrack
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "Soundtrack")
  end

  def self.world
    Artist.joins(:artist_profile).where("artist_profiles.genre" => "World")
  end

  #### VOTES ####

  def artist_micropost_voted?(artist_micropost)
    ArtistMicropostVote.exists? artist_id: id, artist_micropost_id: artist_micropost.id
  end

  def artist_micropost_unvote(artist_micropost)
    ArtistMicropostVote.find_by(artist_id: id, artist_micropost_id: artist_micropost.id).destroy
  end

  def artist_micropost_vote_id(artist_micropost)
    ArtistMicropostVote.find_by(artist_id: id, artist_micropost_id: artist_micropost.id).id
  end

  def record_label_micropost_voted?(record_label_micropost)
    RecordLabelMicropostVote.exists? artist_id: id, record_label_micropost_id: record_label_micropost.id
  end

  def record_label_micropost_unvote(record_label_micropost)
    RecordLabelMicropostVote.find_by(artist_id: id, record_label_micropost_id: record_label_micropost.id).destroy
  end

  def record_label_micropost_vote_id(record_label_micropost)
    RecordLabelMicropostVote.find_by(artist_id: id, record_label_micropost_id: record_label_micropost.id).id
  end

  def venue_micropost_voted?(venue_micropost)
    VenueMicropostVote.exists? artist_id: id, venue_micropost_id: venue_micropost.id
  end

  def venue_micropost_unvote(venue_micropost)
    VenueMicropostVote.find_by(artist_id: id, venue_micropost_id: venue_micropost.id).destroy
  end

  def venue_micropost_vote_id(venue_micropost)
    VenueMicropostVote.find_by(artist_id: id, venue_micropost_id: venue_micropost.id).id
  end

  def producer_micropost_voted?(producer_micropost)
    ProducerMicropostVote.exists? artist_id: id, producer_micropost_id: producer_micropost.id
  end

  def producer_micropost_unvote(producer_micropost)
    ProducerMicropostVote.find_by(artist_id: id, producer_micropost_id: producer_micropost.id).destroy
  end

  def producer_micropost_vote_id(producer_micropost)
    ProducerMicropostVote.find_by(artist_id: id, producer_micropost_id: producer_micropost.id).id
  end

  def artist_micropost_comment_voted?(artist_micropost_comment)
    ArtistMicropostCommentVote.exists? artist_id: id, artist_micropost_comment_id: artist_micropost_comment.id
  end

  def artist_micropost_comment_unvote(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(artist_id: id, artist_micropost_comment_id: artist_micropost_comment.id).destroy
  end

  def artist_micropost_comment_vote_id(artist_micropost_comment)
    ArtistMicropostCommentVote.find_by(artist_id: id, artist_micropost_comment_id: artist_micropost_comment.id).id
  end

  def record_label_micropost_comment_voted?(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.exists? artist_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id
  end

  def record_label_micropost_comment_unvote(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(artist_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).destroy
  end

  def record_label_micropost_comment_vote_id(record_label_micropost_comment)
    RecordLabelMicropostCommentVote.find_by(artist_id: id, record_label_micropost_comment_id: record_label_micropost_comment.id).id
  end

  def venue_micropost_comment_voted?(venue_micropost_comment)
    VenueMicropostCommentVote.exists? artist_id: id, venue_micropost_comment_id: venue_micropost_comment.id
  end

  def venue_micropost_comment_unvote(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(artist_id: id, venue_micropost_comment_id: venue_micropost_comment.id).destroy
  end

  def venue_micropost_comment_vote_id(venue_micropost_comment)
    VenueMicropostCommentVote.find_by(artist_id: id, venue_micropost_comment_id: venue_micropost_comment.id).id
  end

  def producer_micropost_comment_voted?(producer_micropost_comment)
    ProducerMicropostCommentVote.exists? artist_id: id, producer_micropost_comment_id: producer_micropost_comment.id
  end

  def producer_micropost_comment_unvote(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(artist_id: id, producer_micropost_comment_id: producer_micropost_comment.id).destroy
  end

  def producer_micropost_comment_vote_id(producer_micropost_comment)
    ProducerMicropostCommentVote.find_by(artist_id: id, producer_micropost_comment_id: producer_micropost_comment.id).id
  end

  def post_comment_voted?(post_comment)
    PostCommentVote.exists? artist_id: id, post_comment_id: post_comment.id
  end

  def post_comment_unvote(post_comment)
    PostCommentVote.find_by(artist_id: id, post_comment_id: post_comment.id).destroy
  end

  def post_comment_vote_id(post_comment)
    PostCommentVote.find_by(artist_id: id, post_comment_id: post_comment.id).id
  end

  def developer_comment_voted?(developer_comment)
    DeveloperCommentVote.exists? artist_id: id, developer_comment_id: developer_comment.id
  end

  def developer_comment_unvote(developer_comment)
    DeveloperCommentVote.find_by(artist_id: id, developer_comment_id: developer_comment.id).destroy
  end

  def developer_comment_vote_id(developer_comment)
    DeveloperCommentVote.find_by(artist_id: id, developer_comment_id: developer_comment.id).id
  end

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
