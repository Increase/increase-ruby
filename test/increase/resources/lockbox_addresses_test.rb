# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::LockboxAddressesTest < Increase::Test::ResourceTest
  def test_create
    response = @increase.lockbox_addresses.create

    assert_pattern do
      response => Increase::LockboxAddress
    end

    assert_pattern do
      response => {
        id: String,
        address: Increase::LockboxAddress::Address | nil,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        status: Increase::LockboxAddress::Status,
        type: Increase::LockboxAddress::Type
      }
    end
  end

  def test_retrieve
    response = @increase.lockbox_addresses.retrieve("lockbox_address_lw6sbzl9ol5dfd8hdml6")

    assert_pattern do
      response => Increase::LockboxAddress
    end

    assert_pattern do
      response => {
        id: String,
        address: Increase::LockboxAddress::Address | nil,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        status: Increase::LockboxAddress::Status,
        type: Increase::LockboxAddress::Type
      }
    end
  end

  def test_update
    response = @increase.lockbox_addresses.update("lockbox_address_lw6sbzl9ol5dfd8hdml6")

    assert_pattern do
      response => Increase::LockboxAddress
    end

    assert_pattern do
      response => {
        id: String,
        address: Increase::LockboxAddress::Address | nil,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        status: Increase::LockboxAddress::Status,
        type: Increase::LockboxAddress::Type
      }
    end
  end

  def test_list
    response = @increase.lockbox_addresses.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::LockboxAddress
    end

    assert_pattern do
      row => {
        id: String,
        address: Increase::LockboxAddress::Address | nil,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        status: Increase::LockboxAddress::Status,
        type: Increase::LockboxAddress::Type
      }
    end
  end
end
