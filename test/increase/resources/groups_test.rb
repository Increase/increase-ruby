# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::GroupsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.groups.retrieve

    assert_pattern do
      response => Increase::Group
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        type: Increase::Group::Type
      }
    end
  end
end
