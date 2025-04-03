# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RoutingNumbers#list
    class RoutingNumberListResponse < Increase::Internal::Type::BaseModel
      # @!attribute ach_transfers
      #   This routing number's support for ACH Transfers.
      #
      #   @return [Symbol, Increase::Models::RoutingNumberListResponse::ACHTransfers]
      required :ach_transfers, enum: -> { Increase::Models::RoutingNumberListResponse::ACHTransfers }

      # @!attribute name
      #   The name of the financial institution belonging to a routing number.
      #
      #   @return [String]
      required :name, String

      # @!attribute real_time_payments_transfers
      #   This routing number's support for Real-Time Payments Transfers.
      #
      #   @return [Symbol, Increase::Models::RoutingNumberListResponse::RealTimePaymentsTransfers]
      required :real_time_payments_transfers,
               enum: -> { Increase::Models::RoutingNumberListResponse::RealTimePaymentsTransfers }

      # @!attribute routing_number
      #   The nine digit routing number identifier.
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `routing_number`.
      #
      #   @return [Symbol, Increase::Models::RoutingNumberListResponse::Type]
      required :type, enum: -> { Increase::Models::RoutingNumberListResponse::Type }

      # @!attribute wire_transfers
      #   This routing number's support for Wire Transfers.
      #
      #   @return [Symbol, Increase::Models::RoutingNumberListResponse::WireTransfers]
      required :wire_transfers, enum: -> { Increase::Models::RoutingNumberListResponse::WireTransfers }

      # @!parse
      #   # Routing numbers are used to identify your bank in a financial transaction.
      #   #
      #   # @param ach_transfers [Symbol, Increase::Models::RoutingNumberListResponse::ACHTransfers]
      #   # @param name [String]
      #   # @param real_time_payments_transfers [Symbol, Increase::Models::RoutingNumberListResponse::RealTimePaymentsTransfers]
      #   # @param routing_number [String]
      #   # @param type [Symbol, Increase::Models::RoutingNumberListResponse::Type]
      #   # @param wire_transfers [Symbol, Increase::Models::RoutingNumberListResponse::WireTransfers]
      #   #
      #   def initialize(ach_transfers:, name:, real_time_payments_transfers:, routing_number:, type:, wire_transfers:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # This routing number's support for ACH Transfers.
      #
      # @see Increase::Models::RoutingNumberListResponse#ach_transfers
      module ACHTransfers
        extend Increase::Internal::Type::Enum

        # The routing number can receive this transfer type.
        SUPPORTED = :supported

        # The routing number cannot receive this transfer type.
        NOT_SUPPORTED = :not_supported

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # This routing number's support for Real-Time Payments Transfers.
      #
      # @see Increase::Models::RoutingNumberListResponse#real_time_payments_transfers
      module RealTimePaymentsTransfers
        extend Increase::Internal::Type::Enum

        # The routing number can receive this transfer type.
        SUPPORTED = :supported

        # The routing number cannot receive this transfer type.
        NOT_SUPPORTED = :not_supported

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `routing_number`.
      #
      # @see Increase::Models::RoutingNumberListResponse#type
      module Type
        extend Increase::Internal::Type::Enum

        ROUTING_NUMBER = :routing_number

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # This routing number's support for Wire Transfers.
      #
      # @see Increase::Models::RoutingNumberListResponse#wire_transfers
      module WireTransfers
        extend Increase::Internal::Type::Enum

        # The routing number can receive this transfer type.
        SUPPORTED = :supported

        # The routing number cannot receive this transfer type.
        NOT_SUPPORTED = :not_supported

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
