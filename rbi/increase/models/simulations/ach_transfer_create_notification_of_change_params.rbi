# typed: strong

module Increase
  module Models
    module Simulations
      class ACHTransferCreateNotificationOfChangeParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the ACH Transfer you wish to create a notification of change
        # for.
        sig { returns(String) }
        attr_accessor :ach_transfer_id

        # The corrected account funding type.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::OrSymbol
            )
          )
        end
        attr_reader :corrected_account_funding

        sig do
          params(
            corrected_account_funding:
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::OrSymbol
          ).void
        end
        attr_writer :corrected_account_funding

        # The corrected account number.
        sig { returns(T.nilable(String)) }
        attr_reader :corrected_account_number

        sig { params(corrected_account_number: String).void }
        attr_writer :corrected_account_number

        # The corrected individual identifier.
        sig { returns(T.nilable(String)) }
        attr_reader :corrected_individual_id

        sig { params(corrected_individual_id: String).void }
        attr_writer :corrected_individual_id

        # The corrected routing number.
        sig { returns(T.nilable(String)) }
        attr_reader :corrected_routing_number

        sig { params(corrected_routing_number: String).void }
        attr_writer :corrected_routing_number

        sig do
          params(
            ach_transfer_id: String,
            corrected_account_funding:
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::OrSymbol,
            corrected_account_number: String,
            corrected_individual_id: String,
            corrected_routing_number: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the ACH Transfer you wish to create a notification of change
          # for.
          ach_transfer_id:,
          # The corrected account funding type.
          corrected_account_funding: nil,
          # The corrected account number.
          corrected_account_number: nil,
          # The corrected individual identifier.
          corrected_individual_id: nil,
          # The corrected routing number.
          corrected_routing_number: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              ach_transfer_id: String,
              corrected_account_funding:
                Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::OrSymbol,
              corrected_account_number: String,
              corrected_individual_id: String,
              corrected_routing_number: String,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The corrected account funding type.
        module CorrectedAccountFunding
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A checking account.
          CHECKING =
            T.let(
              :checking,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::TaggedSymbol
            )

          # A savings account.
          SAVINGS =
            T.let(
              :savings,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::TaggedSymbol
            )

          # A bank's general ledger. Uncommon.
          GENERAL_LEDGER =
            T.let(
              :general_ledger,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::CorrectedAccountFunding::TaggedSymbol
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
