class ProducerMailer < ApplicationMailer
  default from: 'noisaea-notifications@noisaea.com'

  def follow_email(producer)
    @producer = producer
    mail(to: @producer.email, subject: 'You\'ve got a new fan | Noisaea')
  end

  def comment_email(producer, producer_micropost)
    @producer = producer
    @micropost = producer_micropost
    mail(to: @producer.email, subject: 'You\'ve got a new comment | Noisaea')
  end

end
