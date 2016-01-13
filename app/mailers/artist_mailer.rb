class ArtistMailer < ApplicationMailer
  default from: 'notifications@noisaea.com'

  def follow_email(artist)
    @artist = artist
    mail(to: @artist.email, subject: 'You\'ve got a new fan | Noisaea')
  end

end