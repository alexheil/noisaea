class RecordLabelMailer < ApplicationMailer
  default from: 'noisaea-notifications@noisaea.com'

  def follow_email(record_label)
    @record_label = record_label
    mail(to: @record_label.email, subject: 'You\'ve got a new fan | Noisaea')
  end

  def comment_email(record_label, record_label_micropost)
    @record_label = record_label
    @micropost = record_label_micropost
    mail(to: @record_label.email, subject: 'You\'ve got a new comment | Noisaea')
  end

end
