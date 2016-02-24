class FanMailer < ApplicationMailer
  default from: 'noisaea-fans@noisaea.com'

  def follow_email(fan)
    @fan = fan
    mail(to: @fan.email, subject: 'Time to follow some artists | Noisaea')
  end

  def lazy_email(fan)
    @fan = fan
    mail(to: @fan.email, subject: 'Your profile is kinda... not there | Noisaea')
  end

end
