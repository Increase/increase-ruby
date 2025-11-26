# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::RoutingNumbersTest < Increase::Test::ResourceTest
  def test_list_required_params
    response = @increase.routing_numbers.list(routing_number: "xxxxxxxxx")

    assert_pattern do
      response => Increase::Models::RoutingNumberListResponse
    end

    assert_pattern do
      response => {
        data: ^(Increase::Internal::Type::ArrayOf[Increase::Models::RoutingNumberListResponse::Data]),
        next_cursor: String | nil
      }
    end
  end
end
