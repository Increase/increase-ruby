# typed: strong

module Increase
  module Models
    class RealTimePaymentsTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimePaymentsTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The transfer amount in USD cents. For Real-Time Payments transfers, must be
      # positive.
      sig { returns(Integer) }
      attr_accessor :amount

      # The name of the transfer's recipient.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The identifier of the Account Number from which to send the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # Unstructured information that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # The destination account number.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number

      sig { params(account_number: String).void }
      attr_writer :account_number

      # The address of the transfer's sender. If not provided, no debtor address is sent
      # with the transfer.
      sig do
        returns(
          T.nilable(
            Increase::RealTimePaymentsTransferCreateParams::DebtorAddress
          )
        )
      end
      attr_reader :debtor_address

      sig do
        params(
          debtor_address:
            Increase::RealTimePaymentsTransferCreateParams::DebtorAddress::OrHash
        ).void
      end
      attr_writer :debtor_address

      # The name of the transfer's sender. If not provided, defaults to the name of the
      # account's entity.
      sig { returns(T.nilable(String)) }
      attr_reader :debtor_name

      sig { params(debtor_name: String).void }
      attr_writer :debtor_name

      # The ID of an External Account to initiate a transfer to. If this parameter is
      # provided, `account_number` and `routing_number` must be absent.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

      # The ID of an Inbound Real-Time Payments Request for Payment in response to which
      # this transfer is being sent.
      sig { returns(T.nilable(String)) }
      attr_reader :inbound_real_time_payments_request_for_payment_id

      sig do
        params(inbound_real_time_payments_request_for_payment_id: String).void
      end
      attr_writer :inbound_real_time_payments_request_for_payment_id

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # The destination American Bankers' Association (ABA) Routing Transit Number
      # (RTN).
      sig { returns(T.nilable(String)) }
      attr_reader :routing_number

      sig { params(routing_number: String).void }
      attr_writer :routing_number

      # The name of the ultimate recipient of the transfer. Set this if the creditor is
      # an intermediary receiving the payment for someone else.
      sig { returns(T.nilable(String)) }
      attr_reader :ultimate_creditor_name

      sig { params(ultimate_creditor_name: String).void }
      attr_writer :ultimate_creditor_name

      # The name of the ultimate sender of the transfer. Set this if the funds are being
      # sent on behalf of someone who is not the account holder at Increase.
      sig { returns(T.nilable(String)) }
      attr_reader :ultimate_debtor_name

      sig { params(ultimate_debtor_name: String).void }
      attr_writer :ultimate_debtor_name

      sig do
        params(
          amount: Integer,
          creditor_name: String,
          source_account_number_id: String,
          unstructured_remittance_information: String,
          account_number: String,
          debtor_address:
            Increase::RealTimePaymentsTransferCreateParams::DebtorAddress::OrHash,
          debtor_name: String,
          external_account_id: String,
          inbound_real_time_payments_request_for_payment_id: String,
          require_approval: T::Boolean,
          routing_number: String,
          ultimate_creditor_name: String,
          ultimate_debtor_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The transfer amount in USD cents. For Real-Time Payments transfers, must be
        # positive.
        amount:,
        # The name of the transfer's recipient.
        creditor_name:,
        # The identifier of the Account Number from which to send the transfer.
        source_account_number_id:,
        # Unstructured information that will show on the recipient's bank statement.
        unstructured_remittance_information:,
        # The destination account number.
        account_number: nil,
        # The address of the transfer's sender. If not provided, no debtor address is sent
        # with the transfer.
        debtor_address: nil,
        # The name of the transfer's sender. If not provided, defaults to the name of the
        # account's entity.
        debtor_name: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # The ID of an Inbound Real-Time Payments Request for Payment in response to which
        # this transfer is being sent.
        inbound_real_time_payments_request_for_payment_id: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The destination American Bankers' Association (ABA) Routing Transit Number
        # (RTN).
        routing_number: nil,
        # The name of the ultimate recipient of the transfer. Set this if the creditor is
        # an intermediary receiving the payment for someone else.
        ultimate_creditor_name: nil,
        # The name of the ultimate sender of the transfer. Set this if the funds are being
        # sent on behalf of someone who is not the account holder at Increase.
        ultimate_debtor_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Integer,
            creditor_name: String,
            source_account_number_id: String,
            unstructured_remittance_information: String,
            account_number: String,
            debtor_address:
              Increase::RealTimePaymentsTransferCreateParams::DebtorAddress,
            debtor_name: String,
            external_account_id: String,
            inbound_real_time_payments_request_for_payment_id: String,
            require_approval: T::Boolean,
            routing_number: String,
            ultimate_creditor_name: String,
            ultimate_debtor_name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class DebtorAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsTransferCreateParams::DebtorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The town or city.
        sig { returns(String) }
        attr_accessor :city

        # The ISO 3166, Alpha-2 country code.
        #
        # Defaults to `US`.
        sig { returns(String) }
        attr_accessor :country

        # The postal code or zip.
        sig { returns(String) }
        attr_accessor :postal_code

        # The US state component of the address.
        sig { returns(String) }
        attr_accessor :state

        # The street name without the street number.
        sig { returns(String) }
        attr_accessor :street_name

        # A second address line, such as an apartment or suite number. The first address
        # line is separated into `building_number` and `street_name`.
        sig { returns(T.nilable(String)) }
        attr_reader :address_line2

        sig { params(address_line2: String).void }
        attr_writer :address_line2

        # The number identifying the position of the building on the street.
        sig { returns(T.nilable(String)) }
        attr_reader :building_number

        sig { params(building_number: String).void }
        attr_writer :building_number

        # The address of the transfer's sender. If not provided, no debtor address is sent
        # with the transfer.
        sig do
          params(
            city: String,
            country: String,
            postal_code: String,
            state: String,
            street_name: String,
            address_line2: String,
            building_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The town or city.
          city:,
          # The ISO 3166, Alpha-2 country code.
          #
          # Defaults to `US`.
          country:,
          # The postal code or zip.
          postal_code:,
          # The US state component of the address.
          state:,
          # The street name without the street number.
          street_name:,
          # A second address line, such as an apartment or suite number. The first address
          # line is separated into `building_number` and `street_name`.
          address_line2: nil,
          # The number identifying the position of the building on the street.
          building_number: nil
        )
        end

        sig do
          override.returns(
            {
              city: String,
              country: String,
              postal_code: String,
              state: String,
              street_name: String,
              address_line2: String,
              building_number: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
