class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: :slugged

  default_scope -> { order('id DESC') }

  belongs_to :buffalo

  has_many :post_comments, dependent: :destroy

  before_save :should_generate_new_friendly_id?, if: :slug_changed?

  private

    def should_generate_new_friendly_id?
      slug_changed?
    end

end
