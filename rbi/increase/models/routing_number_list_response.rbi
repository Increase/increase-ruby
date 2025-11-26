# typed: strong

module Increase
  module Models
    class RoutingNumberListResponse < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Increase::Models::RoutingNumberListResponse,
            Increase::Internal::AnyHash
          )
        end

      # The contents of the list.
      sig do
        returns(T::Array[Increase::Models::RoutingNumberListResponse::Data])
      end
      attr_accessor :data

      # A pointer to a place in the list.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # A list of Routing Number objects.
      sig do
        params(
          data:
            T::Array[Increase::Models::RoutingNumberListResponse::Data::OrHash],
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The contents of the list.
        data:,
        # A pointer to a place in the list.
        next_cursor:
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[Increase::Models::RoutingNumberListResponse::Data],
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Data < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Models::RoutingNumberListResponse::Data,
              Increase::Internal::AnyHash
            )
          end

        # This routing number's support for ACH Transfers.
        sig do
          returns(
            Increase::Models::RoutingNumberListResponse::Data::ACHTransfers::TaggedSymbol
          )
        end
        attr_accessor :ach_transfers

        # This routing number's support for FedNow Transfers.
        sig do
          returns(
            Increase::Models::RoutingNumberListResponse::Data::FednowTransfers::TaggedSymbol
          )
        end
        attr_accessor :fednow_transfers

        # The name of the financial institution belonging to a routing number.
        sig { returns(String) }
        attr_accessor :name

        # This routing number's support for Real-Time Payments Transfers.
        sig do
          returns(
            Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers::TaggedSymbol
          )
        end
        attr_accessor :real_time_payments_transfers

        # The nine digit routing number identifier.
        sig { returns(String) }
        attr_accessor :routing_number

        # A constant representing the object's type. For this resource it will always be
        # `routing_number`.
        sig do
          returns(
            Increase::Models::RoutingNumberListResponse::Data::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # This routing number's support for Wire Transfers.
        sig do
          returns(
            Increase::Models::RoutingNumberListResponse::Data::WireTransfers::TaggedSymbol
          )
        end
        attr_accessor :wire_transfers

        # Routing numbers are used to identify your bank in a financial transaction.
        sig do
          params(
            ach_transfers:
              Increase::Models::RoutingNumberListResponse::Data::ACHTransfers::OrSymbol,
            fednow_transfers:
              Increase::Models::RoutingNumberListResponse::Data::FednowTransfers::OrSymbol,
            name: String,
            real_time_payments_transfers:
              Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers::OrSymbol,
            routing_number: String,
            type:
              Increase::Models::RoutingNumberListResponse::Data::Type::OrSymbol,
            wire_transfers:
              Increase::Models::RoutingNumberListResponse::Data::WireTransfers::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # This routing number's support for ACH Transfers.
          ach_transfers:,
          # This routing number's support for FedNow Transfers.
          fednow_transfers:,
          # The name of the financial institution belonging to a routing number.
          name:,
          # This routing number's support for Real-Time Payments Transfers.
          real_time_payments_transfers:,
          # The nine digit routing number identifier.
          routing_number:,
          # A constant representing the object's type. For this resource it will always be
          # `routing_number`.
          type:,
          # This routing number's support for Wire Transfers.
          wire_transfers:
        )
        end

        sig do
          override.returns(
            {
              ach_transfers:
                Increase::Models::RoutingNumberListResponse::Data::ACHTransfers::TaggedSymbol,
              fednow_transfers:
                Increase::Models::RoutingNumberListResponse::Data::FednowTransfers::TaggedSymbol,
              name: String,
              real_time_payments_transfers:
                Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers::TaggedSymbol,
              routing_number: String,
              type:
                Increase::Models::RoutingNumberListResponse::Data::Type::TaggedSymbol,
              wire_transfers:
                Increase::Models::RoutingNumberListResponse::Data::WireTransfers::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # This routing number's support for ACH Transfers.
        module ACHTransfers
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::RoutingNumberListResponse::Data::ACHTransfers
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The routing number can receive this transfer type.
          SUPPORTED =
            T.let(
              :supported,
              Increase::Models::RoutingNumberListResponse::Data::ACHTransfers::TaggedSymbol
            )

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED =
            T.let(
              :not_supported,
              Increase::Models::RoutingNumberListResponse::Data::ACHTransfers::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::RoutingNumberListResponse::Data::ACHTransfers::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # This routing number's support for FedNow Transfers.
        module FednowTransfers
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::RoutingNumberListResponse::Data::FednowTransfers
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The routing number can receive this transfer type.
          SUPPORTED =
            T.let(
              :supported,
              Increase::Models::RoutingNumberListResponse::Data::FednowTransfers::TaggedSymbol
            )

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED =
            T.let(
              :not_supported,
              Increase::Models::RoutingNumberListResponse::Data::FednowTransfers::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::RoutingNumberListResponse::Data::FednowTransfers::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # This routing number's support for Real-Time Payments Transfers.
        module RealTimePaymentsTransfers
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The routing number can receive this transfer type.
          SUPPORTED =
            T.let(
              :supported,
              Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers::TaggedSymbol
            )

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED =
            T.let(
              :not_supported,
              Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::RoutingNumberListResponse::Data::RealTimePaymentsTransfers::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # A constant representing the object's type. For this resource it will always be
        # `routing_number`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::RoutingNumberListResponse::Data::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ROUTING_NUMBER =
            T.let(
              :routing_number,
              Increase::Models::RoutingNumberListResponse::Data::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::RoutingNumberListResponse::Data::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # This routing number's support for Wire Transfers.
        module WireTransfers
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Models::RoutingNumberListResponse::Data::WireTransfers
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The routing number can receive this transfer type.
          SUPPORTED =
            T.let(
              :supported,
              Increase::Models::RoutingNumberListResponse::Data::WireTransfers::TaggedSymbol
            )

          # The routing number cannot receive this transfer type.
          NOT_SUPPORTED =
            T.let(
              :not_supported,
              Increase::Models::RoutingNumberListResponse::Data::WireTransfers::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Models::RoutingNumberListResponse::Data::WireTransfers::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
