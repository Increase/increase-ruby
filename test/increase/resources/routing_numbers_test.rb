# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::RoutingNumbersTest < Increase::Test::ResourceTest
  def test_list_required_params
    response = @increase.routing_numbers.list(routing_number: "xxxxxxxxx")

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Models::RoutingNumberListResponse
    end

    assert_pattern do
      row => {
        ach_transfers: Increase::Models::RoutingNumberListResponse::ACHTransfers,
        fednow_transfers: Increase::Models::RoutingNumberListResponse::FednowTransfers,
        name: String,
        real_time_payments_transfers: Increase::Models::RoutingNumberListResponse::RealTimePaymentsTransfers,
        routing_number: String,
        type: Increase::Models::RoutingNumberListResponse::Type,
        wire_transfers: Increase::Models::RoutingNumberListResponse::WireTransfers
      }
    end
  end
end
