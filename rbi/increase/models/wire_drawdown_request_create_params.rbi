# typed: strong

module Increase
  module Models
    class WireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::WireDrawdownRequestCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The Account Number to which the debtor should send funds.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The amount requested from the debtor, in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The creditor's address.
      sig do
        returns(Increase::WireDrawdownRequestCreateParams::CreditorAddress)
      end
      attr_reader :creditor_address

      sig do
        params(
          creditor_address:
            Increase::WireDrawdownRequestCreateParams::CreditorAddress::OrHash
        ).void
      end
      attr_writer :creditor_address

      # The creditor's name.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The debtor's address.
      sig { returns(Increase::WireDrawdownRequestCreateParams::DebtorAddress) }
      attr_reader :debtor_address

      sig do
        params(
          debtor_address:
            Increase::WireDrawdownRequestCreateParams::DebtorAddress::OrHash
        ).void
      end
      attr_writer :debtor_address

      # The debtor's name.
      sig { returns(String) }
      attr_accessor :debtor_name

      # Remittance information the debtor will see as part of the request.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # The debtor's account number.
      sig { returns(T.nilable(String)) }
      attr_reader :debtor_account_number

      sig { params(debtor_account_number: String).void }
      attr_writer :debtor_account_number

      # The ID of an External Account to initiate a transfer to. If this parameter is
      # provided, `debtor_account_number` and `debtor_routing_number` must be absent.
      sig { returns(T.nilable(String)) }
      attr_reader :debtor_external_account_id

      sig { params(debtor_external_account_id: String).void }
      attr_writer :debtor_external_account_id

      # The debtor's routing number.
      sig { returns(T.nilable(String)) }
      attr_reader :debtor_routing_number

      sig { params(debtor_routing_number: String).void }
      attr_writer :debtor_routing_number

      sig do
        params(
          account_number_id: String,
          amount: Integer,
          creditor_address:
            Increase::WireDrawdownRequestCreateParams::CreditorAddress::OrHash,
          creditor_name: String,
          debtor_address:
            Increase::WireDrawdownRequestCreateParams::DebtorAddress::OrHash,
          debtor_name: String,
          unstructured_remittance_information: String,
          debtor_account_number: String,
          debtor_external_account_id: String,
          debtor_routing_number: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account Number to which the debtor should send funds.
        account_number_id:,
        # The amount requested from the debtor, in USD cents.
        amount:,
        # The creditor's address.
        creditor_address:,
        # The creditor's name.
        creditor_name:,
        # The debtor's address.
        debtor_address:,
        # The debtor's name.
        debtor_name:,
        # Remittance information the debtor will see as part of the request.
        unstructured_remittance_information:,
        # The debtor's account number.
        debtor_account_number: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `debtor_account_number` and `debtor_routing_number` must be absent.
        debtor_external_account_id: nil,
        # The debtor's routing number.
        debtor_routing_number: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_number_id: String,
            amount: Integer,
            creditor_address:
              Increase::WireDrawdownRequestCreateParams::CreditorAddress,
            creditor_name: String,
            debtor_address:
              Increase::WireDrawdownRequestCreateParams::DebtorAddress,
            debtor_name: String,
            unstructured_remittance_information: String,
            debtor_account_number: String,
            debtor_external_account_id: String,
            debtor_routing_number: String,
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
              Increase::WireDrawdownRequestCreateParams::CreditorAddress,
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

        # The ZIP code of the address.
        sig { returns(T.nilable(String)) }
        attr_reader :postal_code

        sig { params(postal_code: String).void }
        attr_writer :postal_code

        # The address state.
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
          # The ZIP code of the address.
          postal_code: nil,
          # The address state.
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
              Increase::WireDrawdownRequestCreateParams::DebtorAddress,
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

        # The ZIP code of the address.
        sig { returns(T.nilable(String)) }
        attr_reader :postal_code

        sig { params(postal_code: String).void }
        attr_writer :postal_code

        # The address state.
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
          # The ZIP code of the address.
          postal_code: nil,
          # The address state.
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
    end
  end
end
