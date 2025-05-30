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

        # The reason for the notification of change.
        sig do
          returns(
            Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::OrSymbol
          )
        end
        attr_accessor :change_code

        # The corrected data for the notification of change (e.g., a new routing number).
        sig { returns(String) }
        attr_accessor :corrected_data

        sig do
          params(
            change_code:
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::OrSymbol,
            corrected_data: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The reason for the notification of change.
          change_code:,
          # The corrected data for the notification of change (e.g., a new routing number).
          corrected_data:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              change_code:
                Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::OrSymbol,
              corrected_data: String,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The reason for the notification of change.
        module ChangeCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account number was incorrect.
          INCORRECT_ACCOUNT_NUMBER =
            T.let(
              :incorrect_account_number,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The routing number was incorrect.
          INCORRECT_ROUTING_NUMBER =
            T.let(
              :incorrect_routing_number,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # Both the routing number and the account number were incorrect.
          INCORRECT_ROUTING_NUMBER_AND_ACCOUNT_NUMBER =
            T.let(
              :incorrect_routing_number_and_account_number,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The transaction code was incorrect. Try changing the `funding` parameter from checking to savings or vice-versa.
          INCORRECT_TRANSACTION_CODE =
            T.let(
              :incorrect_transaction_code,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The account number and the transaction code were incorrect.
          INCORRECT_ACCOUNT_NUMBER_AND_TRANSACTION_CODE =
            T.let(
              :incorrect_account_number_and_transaction_code,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The routing number, account number, and transaction code were incorrect.
          INCORRECT_ROUTING_NUMBER_ACCOUNT_NUMBER_AND_TRANSACTION_CODE =
            T.let(
              :incorrect_routing_number_account_number_and_transaction_code,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The receiving depository financial institution identification was incorrect.
          INCORRECT_RECEIVING_DEPOSITORY_FINANCIAL_INSTITUTION_IDENTIFICATION =
            T.let(
              :incorrect_receiving_depository_financial_institution_identification,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The individual identification number was incorrect.
          INCORRECT_INDIVIDUAL_IDENTIFICATION_NUMBER =
            T.let(
              :incorrect_individual_identification_number,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The addenda had an incorrect format.
          ADDENDA_FORMAT_ERROR =
            T.let(
              :addenda_format_error,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The standard entry class code was incorrect for an outbound international payment.
          INCORRECT_STANDARD_ENTRY_CLASS_CODE_FOR_OUTBOUND_INTERNATIONAL_PAYMENT =
            T.let(
              :incorrect_standard_entry_class_code_for_outbound_international_payment,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The notification of change was misrouted.
          MISROUTED_NOTIFICATION_OF_CHANGE =
            T.let(
              :misrouted_notification_of_change,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The trace number was incorrect.
          INCORRECT_TRACE_NUMBER =
            T.let(
              :incorrect_trace_number,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The company identification number was incorrect.
          INCORRECT_COMPANY_IDENTIFICATION_NUMBER =
            T.let(
              :incorrect_company_identification_number,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The individual identification number or identification number was incorrect.
          INCORRECT_IDENTIFICATION_NUMBER =
            T.let(
              :incorrect_identification_number,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The corrected data was incorrectly formatted.
          INCORRECTLY_FORMATTED_CORRECTED_DATA =
            T.let(
              :incorrectly_formatted_corrected_data,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The discretionary data was incorrect.
          INCORRECT_DISCRETIONARY_DATA =
            T.let(
              :incorrect_discretionary_data,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The routing number was not from the original entry detail record.
          ROUTING_NUMBER_NOT_FROM_ORIGINAL_ENTRY_DETAIL_RECORD =
            T.let(
              :routing_number_not_from_original_entry_detail_record,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The depository financial institution account number was not from the original entry detail record.
          DEPOSITORY_FINANCIAL_INSTITUTION_ACCOUNT_NUMBER_NOT_FROM_ORIGINAL_ENTRY_DETAIL_RECORD =
            T.let(
              :depository_financial_institution_account_number_not_from_original_entry_detail_record,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          # The transaction code was incorrect, initiated by the originating depository financial institution.
          INCORRECT_TRANSACTION_CODE_BY_ORIGINATING_DEPOSITORY_FINANCIAL_INSTITUTION =
            T.let(
              :incorrect_transaction_code_by_originating_depository_financial_institution,
              Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::ACHTransferCreateNotificationOfChangeParams::ChangeCode::TaggedSymbol
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
