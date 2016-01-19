class VenueMailer < ApplicationMailer
  default from: 'noisaea-notifications@noisaea.com'

  def follow_email(venue)
    @venue = venue
    mail(to: @venue.email, subject: 'You\'ve got a new fan | Noisaea')
  end

  def comment_email(venue, venue_micropost)
    @venue = venue
    @micropost = venue_micropost
    mail(to: @venue.email, subject: 'You\'ve got a new comment | Noisaea')
  end

end
