# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RoutingNumbers#list
    class RoutingNumberListResponse < Increase::Internal::Type::BaseModel
      # @!attribute data
      #   The contents of the list.
      #
      #   @return [Array<Increase::Models::RoutingNumberListResponse::Data>]
      required :data,
               -> { Increase::Internal::Type::ArrayOf[Increase::Models::RoutingNumberListResponse::Data] }

      # @!attribute next_cursor
      #   A pointer to a place in the list.
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, next_cursor:)
      #   A list of Routing Number objects.
      #
      #   @param data [Array<Increase::Models::RoutingNumberListResponse::Data>] The contents of the list.
      #
      #   @param next_cursor [String, nil] A pointer to a place in the list.

      class Data < Increase::Internal::Type::BaseModel
        # @!attribute ach_transfers
        #   This routing number's support for ACH Transfers.
        #
        #   @return [Symbol, Increase::Models::RoutingNumberListResponse::Data::ACHTransfers]
        required :ach_transfers, enum: -> { Increase::Models::RoutingNumberListResponse::Data::ACHTransfers }

        # @!attribute fednow_transfers
        #   This routing number's support for FedNow Transfers.
        #
        #   @return [Symbol, Increase::Models::RoutingNumberListResponse::Data::FednowTransfers]
        required :fednow_transfers,
                 enum: -> { Increase::Models::RoutingNumberListResponse::Data::FednowTransfers }

        # @!attribute name
        #   The name of the financial institution belonging to a routing number.
        #
        #   @return [String]
        required :name, String

        # @!attribute real_time_payments_transfers
        #   This routing number's support for Real-Time Payments Transfers.
        #
        #   @return [Symbol, Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers]
        required :real_time_payments_transfers,
                 enum: -> { Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers }

        # @!attribute routing_number
        #   The nine digit routing number identifier.
        #
        #   @return [String]
        required :routing_number, String

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #   `routing_number`.
        #
        #   @return [Symbol, Increase::Models::RoutingNumberListResponse::Data::Type]
        required :type, enum: -> { Increase::Models::RoutingNumberListResponse::Data::Type }

        # @!attribute wire_transfers
        #   This routing number's support for Wire Transfers.
        #
        #   @return [Symbol, Increase::Models::RoutingNumberListResponse::Data::WireTransfers]
        required :wire_transfers, enum: -> { Increase::Models::RoutingNumberListResponse::Data::WireTransfers }

        # @!method initialize(ach_transfers:, fednow_transfers:, name:, real_time_payments_transfers:, routing_number:, type:, wire_transfers:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RoutingNumberListResponse::Data} for more details.
        #
        #   Routing numbers are used to identify your bank in a financial transaction.
        #
        #   @param ach_transfers [Symbol, Increase::Models::RoutingNumberListResponse::Data::ACHTransfers] This routing number's support for ACH Transfers.
        #
        #   @param fednow_transfers [Symbol, Increase::Models::RoutingNumberListResponse::Data::FednowTransfers] This routing number's support for FedNow Transfers.
        #
        #   @param name [String] The name of the financial institution belonging to a routing number.
        #
        #   @param real_time_payments_transfers [Symbol, Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers] This routing number's support for Real-Time Payments Transfers.
        #
        #   @param routing_number [String] The nine digit routing number identifier.
        #
        #   @param type [Symbol, Increase::Models::RoutingNumberListResponse::Data::Type] A constant representing the object's type. For this resource it will always be `
        #
        #   @param wire_transfers [Symbol, Increase::Models::RoutingNumberListResponse::Data::WireTransfers] This routing number's support for Wire Transfers.

        # This routing number's support for ACH Transfers.
        #
        # @see Increase::Models::RoutingNumberListResponse::Data#ach_transfers
        module ACHTransfers
          extend Increase::Internal::Type::Enum

          # The routing number can receive this transfer type.
          SUPPORTED = :supported

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED = :not_supported

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # This routing number's support for FedNow Transfers.
        #
        # @see Increase::Models::RoutingNumberListResponse::Data#fednow_transfers
        module FednowTransfers
          extend Increase::Internal::Type::Enum

          # The routing number can receive this transfer type.
          SUPPORTED = :supported

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED = :not_supported

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # This routing number's support for Real-Time Payments Transfers.
        #
        # @see Increase::Models::RoutingNumberListResponse::Data#real_time_payments_transfers
        module RealTimePaymentsTransfers
          extend Increase::Internal::Type::Enum

          # The routing number can receive this transfer type.
          SUPPORTED = :supported

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED = :not_supported

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # A constant representing the object's type. For this resource it will always be
        # `routing_number`.
        #
        # @see Increase::Models::RoutingNumberListResponse::Data#type
        module Type
          extend Increase::Internal::Type::Enum

          ROUTING_NUMBER = :routing_number

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # This routing number's support for Wire Transfers.
        #
        # @see Increase::Models::RoutingNumberListResponse::Data#wire_transfers
        module WireTransfers
          extend Increase::Internal::Type::Enum

          # The routing number can receive this transfer type.
          SUPPORTED = :supported

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED = :not_supported

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
