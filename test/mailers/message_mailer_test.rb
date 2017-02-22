require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "message_submitted" do
    mail = MessageMailer.message_submitted
    assert_equal "Message submitted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
