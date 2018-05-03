require 'test_helper'

class MessagesMailerTest < ActionMailer::TestCase
  test "send_message_to_owner" do
    mail = MessagesMailer.send_message_to_owner
    assert_equal "Send message to owner", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
