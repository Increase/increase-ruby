# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::LockboxesTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.lockboxes.create(account_id: "account_in71c4amph0vgo2qllky")

    assert_pattern do
      response => Increase::Lockbox
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        address: Increase::Lockbox::Address,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        recipient_name: String | nil,
        status: Increase::Lockbox::Status,
        type: Increase::Lockbox::Type
      }
    end
  end

  def test_retrieve
    response = @increase.lockboxes.retrieve("lockbox_id")

    assert_pattern do
      response => Increase::Lockbox
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        address: Increase::Lockbox::Address,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        recipient_name: String | nil,
        status: Increase::Lockbox::Status,
        type: Increase::Lockbox::Type
      }
    end
  end

  def test_update
    response = @increase.lockboxes.update("lockbox_id")

    assert_pattern do
      response => Increase::Lockbox
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        address: Increase::Lockbox::Address,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        recipient_name: String | nil,
        status: Increase::Lockbox::Status,
        type: Increase::Lockbox::Type
      }
    end
  end

  def test_list
    response = @increase.lockboxes.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Lockbox
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        address: Increase::Lockbox::Address,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        recipient_name: String | nil,
        status: Increase::Lockbox::Status,
        type: Increase::Lockbox::Type
      }
    end
  end
end
