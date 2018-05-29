require 'test_helper'

class ContactsMailerTest < ActionMailer::TestCase
  test "contact_us" do
    mail = ContactsMailer.contact_us
    assert_equal "Contact us", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
