class ArtistMailer < ApplicationMailer
  default from: 'notifications@noisaea.com'

  def follow_email(artist)
    @artist = artist
    @url  = 'http://www.noisaea.com/'
    mail(to: @artist.email, subject: 'You\'ve got a new follower | Noisaea')
  end

end
