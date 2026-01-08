# typed: strong

module Increase
  module Models
    class SwiftTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::SwiftTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The creditor's account number.
      sig { returns(String) }
      attr_accessor :account_number

      # The bank identification code (BIC) of the creditor. If it ends with the
      # three-character branch code, this must be 11 characters long. Otherwise this
      # must be 8 characters and the branch code will be assumed to be `XXX`.
      sig { returns(String) }
      attr_accessor :bank_identification_code

      # The creditor's address.
      sig { returns(Increase::SwiftTransferCreateParams::CreditorAddress) }
      attr_reader :creditor_address

      sig do
        params(
          creditor_address:
            Increase::SwiftTransferCreateParams::CreditorAddress::OrHash
        ).void
      end
      attr_writer :creditor_address

      # The creditor's name.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The debtor's address.
      sig { returns(Increase::SwiftTransferCreateParams::DebtorAddress) }
      attr_reader :debtor_address

      sig do
        params(
          debtor_address:
            Increase::SwiftTransferCreateParams::DebtorAddress::OrHash
        ).void
      end
      attr_writer :debtor_address

      # The debtor's name.
      sig { returns(String) }
      attr_accessor :debtor_name

      # The amount, in minor units of `instructed_currency`, to send to the creditor.
      sig { returns(Integer) }
      attr_accessor :instructed_amount

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
      # instructed amount.
      sig do
        returns(
          Increase::SwiftTransferCreateParams::InstructedCurrency::OrSymbol
        )
      end
      attr_accessor :instructed_currency

      # The Account Number to include in the transfer as the debtor's account number.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # Unstructured remittance information to include in the transfer.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # The creditor's bank account routing or transit number. Required in certain
      # countries.
      sig { returns(T.nilable(String)) }
      attr_reader :routing_number

      sig { params(routing_number: String).void }
      attr_writer :routing_number

      sig do
        params(
          account_id: String,
          account_number: String,
          bank_identification_code: String,
          creditor_address:
            Increase::SwiftTransferCreateParams::CreditorAddress::OrHash,
          creditor_name: String,
          debtor_address:
            Increase::SwiftTransferCreateParams::DebtorAddress::OrHash,
          debtor_name: String,
          instructed_amount: Integer,
          instructed_currency:
            Increase::SwiftTransferCreateParams::InstructedCurrency::OrSymbol,
          source_account_number_id: String,
          unstructured_remittance_information: String,
          require_approval: T::Boolean,
          routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The creditor's account number.
        account_number:,
        # The bank identification code (BIC) of the creditor. If it ends with the
        # three-character branch code, this must be 11 characters long. Otherwise this
        # must be 8 characters and the branch code will be assumed to be `XXX`.
        bank_identification_code:,
        # The creditor's address.
        creditor_address:,
        # The creditor's name.
        creditor_name:,
        # The debtor's address.
        debtor_address:,
        # The debtor's name.
        debtor_name:,
        # The amount, in minor units of `instructed_currency`, to send to the creditor.
        instructed_amount:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
        # instructed amount.
        instructed_currency:,
        # The Account Number to include in the transfer as the debtor's account number.
        source_account_number_id:,
        # Unstructured remittance information to include in the transfer.
        unstructured_remittance_information:,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The creditor's bank account routing or transit number. Required in certain
        # countries.
        routing_number: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            account_number: String,
            bank_identification_code: String,
            creditor_address:
              Increase::SwiftTransferCreateParams::CreditorAddress,
            creditor_name: String,
            debtor_address: Increase::SwiftTransferCreateParams::DebtorAddress,
            debtor_name: String,
            instructed_amount: Integer,
            instructed_currency:
              Increase::SwiftTransferCreateParams::InstructedCurrency::OrSymbol,
            source_account_number_id: String,
            unstructured_remittance_information: String,
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
              Increase::SwiftTransferCreateParams::CreditorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(String) }
        attr_accessor :city

        # The two-letter
        # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        # the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address. This is usually the street number and street.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address. This might be the floor or room number.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # The ZIP or postal code of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_reader :postal_code

        sig { params(postal_code: String).void }
        attr_writer :postal_code

        # The state, province, or region of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        # The creditor's address.
        sig do
          params(
            city: String,
            country: String,
            line1: String,
            line2: String,
            postal_code: String,
            state: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The two-letter
          # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
          # the country of the address.
          country:,
          # The first line of the address. This is usually the street number and street.
          line1:,
          # The second line of the address. This might be the floor or room number.
          line2: nil,
          # The ZIP or postal code of the address. Required in certain countries.
          postal_code: nil,
          # The state, province, or region of the address. Required in certain countries.
          state: nil
        )
        end

        sig do
          override.returns(
            {
              city: String,
              country: String,
              line1: String,
              line2: String,
              postal_code: String,
              state: String
            }
          )
        end
        def to_hash
        end
      end

      class DebtorAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::SwiftTransferCreateParams::DebtorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(String) }
        attr_accessor :city

        # The two-letter
        # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        # the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address. This is usually the street number and street.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address. This might be the floor or room number.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # The ZIP or postal code of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_reader :postal_code

        sig { params(postal_code: String).void }
        attr_writer :postal_code

        # The state, province, or region of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        # The debtor's address.
        sig do
          params(
            city: String,
            country: String,
            line1: String,
            line2: String,
            postal_code: String,
            state: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The two-letter
          # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
          # the country of the address.
          country:,
          # The first line of the address. This is usually the street number and street.
          line1:,
          # The second line of the address. This might be the floor or room number.
          line2: nil,
          # The ZIP or postal code of the address. Required in certain countries.
          postal_code: nil,
          # The state, province, or region of the address. Required in certain countries.
          state: nil
        )
        end

        sig do
          override.returns(
            {
              city: String,
              country: String,
              line1: String,
              line2: String,
              postal_code: String,
              state: String
            }
          )
        end
        def to_hash
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
      # instructed amount.
      module InstructedCurrency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::SwiftTransferCreateParams::InstructedCurrency
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # United States Dollar
        USD =
          T.let(
            :USD,
            Increase::SwiftTransferCreateParams::InstructedCurrency::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::SwiftTransferCreateParams::InstructedCurrency::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
