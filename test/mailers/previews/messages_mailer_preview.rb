# Preview all emails at http://localhost:3000/rails/mailers/messages_mailer
class MessagesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/messages_mailer/send_message_to_owner
  def send_message_to_owner
    MessagesMailer.send_message_to_owner
  end

end
