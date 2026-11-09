# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CheckbookChecksTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.checkbook_checks.retrieve("checkbook_check_klgh3z50guf6jcnfhibb")

    assert_pattern do
      response => Increase::CheckbookCheck
    end

    assert_pattern do
      response => {
        id: String,
        check_number: Integer,
        checkbook_id: String,
        created_at: Time,
        status: Increase::CheckbookCheck::Status,
        type: Increase::CheckbookCheck::Type
      }
    end
  end

  def test_list
    response = @increase.checkbook_checks.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::CheckbookCheck
    end

    assert_pattern do
      row => {
        id: String,
        check_number: Integer,
        checkbook_id: String,
        created_at: Time,
        status: Increase::CheckbookCheck::Status,
        type: Increase::CheckbookCheck::Type
      }
    end
  end

  def test_stop
    response = @increase.checkbook_checks.stop("checkbook_check_klgh3z50guf6jcnfhibb")

    assert_pattern do
      response => Increase::CheckbookCheck
    end

    assert_pattern do
      response => {
        id: String,
        check_number: Integer,
        checkbook_id: String,
        created_at: Time,
        status: Increase::CheckbookCheck::Status,
        type: Increase::CheckbookCheck::Type
      }
    end
  end
end
