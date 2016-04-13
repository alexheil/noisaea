class ArtistMailer < ApplicationMailer
  default from: 'noisaea-notifications@noisaea.com'

  def follow_email(artist)
    @artist = artist
    mail(to: @artist.email, subject: 'You\'ve got a new fan! | Noisaea')
  end

  def comment_email(artist, artist_micropost)
    @artist = artist
    @micropost = artist_micropost
    mail(to: @artist.email, subject: 'You\'ve got a new comment! | Noisaea')
  end

  def lazy_email(artist)
    @artist = artist
    mail(to: @artist.email, subject: 'What\'s up?! Your timeline is empty... | Noisaea')
  end

  def purchased_email(artist, artist_merch_purchase, fan)
    @artist = artist
    @purchase = artist_merch_purchase
    @fan = fan
    mail(to: @artist.email, subject: 'Looks like someone just bought some merch! | Noisaea')
  end

end
