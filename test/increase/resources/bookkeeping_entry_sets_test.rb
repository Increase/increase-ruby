# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::BookkeepingEntrySetsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.bookkeeping_entry_sets.create(
        entries: [
          {account_id: "bookkeeping_account_9husfpw68pzmve9dvvc7", amount: 100},
          {account_id: "bookkeeping_account_t2obldz1rcu15zr54umg", amount: -100}
        ]
      )

    assert_pattern do
      response => Increase::BookkeepingEntrySet
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        date: Time,
        entries: ^(Increase::Internal::Type::ArrayOf[Increase::BookkeepingEntrySet::Entry]),
        idempotency_key: String | nil,
        transaction_id: String | nil,
        type: Increase::BookkeepingEntrySet::Type
      }
    end
  end

  def test_retrieve
    response = @increase.bookkeeping_entry_sets.retrieve("bookkeeping_entry_set_n80c6wr2p8gtc6p4ingf")

    assert_pattern do
      response => Increase::BookkeepingEntrySet
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        date: Time,
        entries: ^(Increase::Internal::Type::ArrayOf[Increase::BookkeepingEntrySet::Entry]),
        idempotency_key: String | nil,
        transaction_id: String | nil,
        type: Increase::BookkeepingEntrySet::Type
      }
    end
  end

  def test_list
    response = @increase.bookkeeping_entry_sets.list

    assert_pattern do
      response => Increase::Models::BookkeepingEntrySetListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::BookkeepingEntrySet]),
        next_cursor: String | nil
      }
    end
  end
end
