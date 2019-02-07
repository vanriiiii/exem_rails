class OwatterMailer < ApplicationMailer
  def owatter_mail(owatter)
 @owatter = owatter

 mail to: @owatter.user.email, subject: "ブログ作成確認メール"
end
end
