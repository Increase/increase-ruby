# typed: strong

module Increase
  module Models
    class FednowTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::FednowTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The amount, in minor units, to send to the creditor.
      sig { returns(Integer) }
      attr_accessor :amount

      # The creditor's name.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The debtor's name.
      sig { returns(String) }
      attr_accessor :debtor_name

      # The Account Number to include in the transfer as the debtor's account number.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # Unstructured remittance information to include in the transfer.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # The creditor's account number.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number

      sig { params(account_number: String).void }
      attr_writer :account_number

      # The creditor's address.
      sig do
        returns(
          T.nilable(Increase::FednowTransferCreateParams::CreditorAddress)
        )
      end
      attr_reader :creditor_address

      sig do
        params(
          creditor_address:
            Increase::FednowTransferCreateParams::CreditorAddress::OrHash
        ).void
      end
      attr_writer :creditor_address

      # The debtor's address.
      sig do
        returns(T.nilable(Increase::FednowTransferCreateParams::DebtorAddress))
      end
      attr_reader :debtor_address

      sig do
        params(
          debtor_address:
            Increase::FednowTransferCreateParams::DebtorAddress::OrHash
        ).void
      end
      attr_writer :debtor_address

      # The ID of an External Account to initiate a transfer to. If this parameter is
      # provided, `account_number` and `routing_number` must be absent.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # The creditor's bank account routing number.
      sig { returns(T.nilable(String)) }
      attr_reader :routing_number

      sig { params(routing_number: String).void }
      attr_writer :routing_number

      sig do
        params(
          account_id: String,
          amount: Integer,
          creditor_name: String,
          debtor_name: String,
          source_account_number_id: String,
          unstructured_remittance_information: String,
          account_number: String,
          creditor_address:
            Increase::FednowTransferCreateParams::CreditorAddress::OrHash,
          debtor_address:
            Increase::FednowTransferCreateParams::DebtorAddress::OrHash,
          external_account_id: String,
          require_approval: T::Boolean,
          routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The amount, in minor units, to send to the creditor.
        amount:,
        # The creditor's name.
        creditor_name:,
        # The debtor's name.
        debtor_name:,
        # The Account Number to include in the transfer as the debtor's account number.
        source_account_number_id:,
        # Unstructured remittance information to include in the transfer.
        unstructured_remittance_information:,
        # The creditor's account number.
        account_number: nil,
        # The creditor's address.
        creditor_address: nil,
        # The debtor's address.
        debtor_address: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The creditor's bank account routing number.
        routing_number: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Integer,
            creditor_name: String,
            debtor_name: String,
            source_account_number_id: String,
            unstructured_remittance_information: String,
            account_number: String,
            creditor_address:
              Increase::FednowTransferCreateParams::CreditorAddress,
            debtor_address: Increase::FednowTransferCreateParams::DebtorAddress,
            external_account_id: String,
            require_approval: T::Boolean,
            routing_number: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CreditorAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FednowTransferCreateParams::CreditorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(String) }
        attr_accessor :city

        # The postal code component of the address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The US state component of the address.
        sig { returns(String) }
        attr_accessor :state

        # The first line of the address. This is usually the street number and street.
        sig { returns(T.nilable(String)) }
        attr_reader :line1

        sig { params(line1: String).void }
        attr_writer :line1

        # The creditor's address.
        sig do
          params(
            city: String,
            postal_code: String,
            state: String,
            line1: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The postal code component of the address.
          postal_code:,
          # The US state component of the address.
          state:,
          # The first line of the address. This is usually the street number and street.
          line1: nil
        )
        end

        sig do
          override.returns(
            { city: String, postal_code: String, state: String, line1: String }
          )
        end
        def to_hash
        end
      end

      class DebtorAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FednowTransferCreateParams::DebtorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(String) }
        attr_accessor :city

        # The postal code component of the address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The US state component of the address.
        sig { returns(String) }
        attr_accessor :state

        # The first line of the address. This is usually the street number and street.
        sig { returns(T.nilable(String)) }
        attr_reader :line1

        sig { params(line1: String).void }
        attr_writer :line1

        # The debtor's address.
        sig do
          params(
            city: String,
            postal_code: String,
            state: String,
            line1: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The postal code component of the address.
          postal_code:,
          # The US state component of the address.
          state:,
          # The first line of the address. This is usually the street number and street.
          line1: nil
        )
        end

        sig do
          override.returns(
            { city: String, postal_code: String, state: String, line1: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
