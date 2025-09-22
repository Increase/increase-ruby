# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::BookkeepingEntriesTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.bookkeeping_entries.retrieve("bookkeeping_entry_ctjpajsj3ks2blx10375")

    assert_pattern do
      response => Increase::BookkeepingEntry
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        amount: Integer,
        created_at: Time,
        entry_set_id: String,
        type: Increase::BookkeepingEntry::Type
      }
    end
  end

  def test_list
    response = @increase.bookkeeping_entries.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::BookkeepingEntry
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        amount: Integer,
        created_at: Time,
        entry_set_id: String,
        type: Increase::BookkeepingEntry::Type
      }
    end
  end
end
