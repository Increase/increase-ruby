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
        check_deposit_behavior: Increase::Lockbox::CheckDepositBehavior,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        recipient_name: String | nil,
        type: Increase::Lockbox::Type
      }
    end
  end

  def test_retrieve
    response = @increase.lockboxes.retrieve("lockbox_3xt21ok13q19advds4t5")

    assert_pattern do
      response => Increase::Lockbox
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        address: Increase::Lockbox::Address,
        check_deposit_behavior: Increase::Lockbox::CheckDepositBehavior,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        recipient_name: String | nil,
        type: Increase::Lockbox::Type
      }
    end
  end

  def test_update
    response = @increase.lockboxes.update("lockbox_3xt21ok13q19advds4t5")

    assert_pattern do
      response => Increase::Lockbox
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        address: Increase::Lockbox::Address,
        check_deposit_behavior: Increase::Lockbox::CheckDepositBehavior,
        created_at: Time,
        description: String | nil,
        idempotency_key: String | nil,
        recipient_name: String | nil,
        type: Increase::Lockbox::Type
      }
    end
  end

  def test_list
    response = @increase.lockboxes.list

    assert_pattern do
      response => Increase::Models::LockboxListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::Lockbox]),
        next_cursor: String | nil
      }
    end
  end
end
