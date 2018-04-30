class PictureMailer < ApplicationMailer
  def create_mail(picture)
    @picture = picture
    mail to: @picture.user.email, subject: 'pictureが投稿されました'
  end
end
