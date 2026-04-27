# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::LockboxRecipientsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.lockbox_recipients.create(
        account_id: "account_in71c4amph0vgo2qllky",
        lockbox_address_id: "lockbox_address_lw6sbzl9ol5dfd8hdml6"
      )

    assert_pattern do
      response => Increase::LockboxRecipient
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        lockbox_address_id: String,
        mail_stop_code: String,
        recipient_name: String | nil,
        status: Increase::LockboxRecipient::Status | nil,
        type: Increase::LockboxRecipient::Type
      }
    end
  end

  def test_retrieve
    response = @increase.lockbox_recipients.retrieve("lockbox_3xt21ok13q19advds4t5")

    assert_pattern do
      response => Increase::LockboxRecipient
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        lockbox_address_id: String,
        mail_stop_code: String,
        recipient_name: String | nil,
        status: Increase::LockboxRecipient::Status | nil,
        type: Increase::LockboxRecipient::Type
      }
    end
  end

  def test_update
    response = @increase.lockbox_recipients.update("lockbox_3xt21ok13q19advds4t5")

    assert_pattern do
      response => Increase::LockboxRecipient
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        lockbox_address_id: String,
        mail_stop_code: String,
        recipient_name: String | nil,
        status: Increase::LockboxRecipient::Status | nil,
        type: Increase::LockboxRecipient::Type
      }
    end
  end

  def test_list
    response = @increase.lockbox_recipients.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::LockboxRecipient
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        lockbox_address_id: String,
        mail_stop_code: String,
        recipient_name: String | nil,
        status: Increase::LockboxRecipient::Status | nil,
        type: Increase::LockboxRecipient::Type
      }
    end
  end
end
