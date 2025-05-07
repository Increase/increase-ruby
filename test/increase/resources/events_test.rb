# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::EventsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.events.retrieve("event_id")

    assert_pattern do
      response => Increase::Event
    end

    assert_pattern do
      response => {
        id: String,
        associated_object_id: String,
        associated_object_type: String,
        category: Increase::Event::Category,
        created_at: Time,
        type: Increase::Event::Type
      }
    end
  end

  def test_list
    response = @increase.events.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Event
    end

    assert_pattern do
      row => {
        id: String,
        associated_object_id: String,
        associated_object_type: String,
        category: Increase::Event::Category,
        created_at: Time,
        type: Increase::Event::Type
      }
    end
  end
end
