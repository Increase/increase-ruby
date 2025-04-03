# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireDrawdownRequests#create
    class WireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   The Account Number to which the recipient should send funds.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The amount requested from the recipient, in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute message_to_recipient
      #   A message the recipient will see as part of the request.
      #
      #   @return [String]
      required :message_to_recipient, String

      # @!attribute recipient_account_number
      #   The drawdown request's recipient's account number.
      #
      #   @return [String]
      required :recipient_account_number, String

      # @!attribute recipient_name
      #   The drawdown request's recipient's name.
      #
      #   @return [String]
      required :recipient_name, String

      # @!attribute recipient_routing_number
      #   The drawdown request's recipient's routing number.
      #
      #   @return [String]
      required :recipient_routing_number, String

      # @!attribute [r] originator_address_line1
      #   The drawdown request originator's address line 1. This is only necessary if
      #     you're requesting a payment to a commingled account. Otherwise, we'll use the
      #     associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line1, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_address_line1

      # @!attribute [r] originator_address_line2
      #   The drawdown request originator's address line 2. This is only necessary if
      #     you're requesting a payment to a commingled account. Otherwise, we'll use the
      #     associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line2, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_address_line2

      # @!attribute [r] originator_address_line3
      #   The drawdown request originator's address line 3. This is only necessary if
      #     you're requesting a payment to a commingled account. Otherwise, we'll use the
      #     associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line3, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_address_line3

      # @!attribute [r] originator_name
      #   The drawdown request originator's name. This is only necessary if you're
      #     requesting a payment to a commingled account. Otherwise, we'll use the
      #     associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :originator_name

      # @!attribute [r] recipient_address_line1
      #   Line 1 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      optional :recipient_address_line1, String

      # @!parse
      #   # @return [String]
      #   attr_writer :recipient_address_line1

      # @!attribute [r] recipient_address_line2
      #   Line 2 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      optional :recipient_address_line2, String

      # @!parse
      #   # @return [String]
      #   attr_writer :recipient_address_line2

      # @!attribute [r] recipient_address_line3
      #   Line 3 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      optional :recipient_address_line3, String

      # @!parse
      #   # @return [String]
      #   attr_writer :recipient_address_line3

      # @!parse
      #   # @param account_number_id [String]
      #   # @param amount [Integer]
      #   # @param message_to_recipient [String]
      #   # @param recipient_account_number [String]
      #   # @param recipient_name [String]
      #   # @param recipient_routing_number [String]
      #   # @param originator_address_line1 [String]
      #   # @param originator_address_line2 [String]
      #   # @param originator_address_line3 [String]
      #   # @param originator_name [String]
      #   # @param recipient_address_line1 [String]
      #   # @param recipient_address_line2 [String]
      #   # @param recipient_address_line3 [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     account_number_id:,
      #     amount:,
      #     message_to_recipient:,
      #     recipient_account_number:,
      #     recipient_name:,
      #     recipient_routing_number:,
      #     originator_address_line1: nil,
      #     originator_address_line2: nil,
      #     originator_address_line3: nil,
      #     originator_name: nil,
      #     recipient_address_line1: nil,
      #     recipient_address_line2: nil,
      #     recipient_address_line3: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
