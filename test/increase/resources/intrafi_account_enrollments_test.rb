# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::IntrafiAccountEnrollmentsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.intrafi_account_enrollments.create(
        account_id: "account_in71c4amph0vgo2qllky",
        email_address: "user@example.com"
      )

    assert_pattern do
      response => Increase::IntrafiAccountEnrollment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        intrafi_id: String,
        status: Increase::IntrafiAccountEnrollment::Status,
        type: Increase::IntrafiAccountEnrollment::Type
      }
    end
  end

  def test_retrieve
    response = @increase.intrafi_account_enrollments.retrieve("intrafi_account_enrollment_id")

    assert_pattern do
      response => Increase::IntrafiAccountEnrollment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        intrafi_id: String,
        status: Increase::IntrafiAccountEnrollment::Status,
        type: Increase::IntrafiAccountEnrollment::Type
      }
    end
  end

  def test_list
    response = @increase.intrafi_account_enrollments.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::IntrafiAccountEnrollment
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        intrafi_id: String,
        status: Increase::IntrafiAccountEnrollment::Status,
        type: Increase::IntrafiAccountEnrollment::Type
      }
    end
  end

  def test_unenroll
    response = @increase.intrafi_account_enrollments.unenroll("intrafi_account_enrollment_id")

    assert_pattern do
      response => Increase::IntrafiAccountEnrollment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        intrafi_id: String,
        status: Increase::IntrafiAccountEnrollment::Status,
        type: Increase::IntrafiAccountEnrollment::Type
      }
    end
  end
end
