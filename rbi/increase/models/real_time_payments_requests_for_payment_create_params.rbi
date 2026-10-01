# typed: strong

module Increase
  module Models
    class RealTimePaymentsRequestsForPaymentCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimePaymentsRequestsForPaymentCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Account Number where the funds will land.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The requested amount in USD cents. Must be positive.
      sig { returns(Integer) }
      attr_accessor :amount

      # Details of the person being requested to pay.
      sig do
        returns(
          Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor
        )
      end
      attr_reader :debtor

      sig do
        params(
          debtor:
            Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::OrHash
        ).void
      end
      attr_writer :debtor

      # The debtor's account number, which the funds will be requested from.
      sig { returns(String) }
      attr_accessor :debtor_account_number

      # The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :debtor_routing_number

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      # the request for payment is no longer valid. After this time the debtor's bank
      # should no longer allow the debtor to pay it. Must not be before
      # `requested_execution_at`.
      sig { returns(Time) }
      attr_accessor :expires_at

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      # you are requesting the payment to be made.
      sig { returns(Time) }
      attr_accessor :requested_execution_at

      # Unstructured information that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # The name of the creditor requesting the payment. If not provided, defaults to
      # the name of the account's entity.
      sig { returns(T.nilable(String)) }
      attr_reader :creditor_name

      sig { params(creditor_name: String).void }
      attr_writer :creditor_name

      sig do
        params(
          account_number_id: String,
          amount: Integer,
          debtor:
            Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::OrHash,
          debtor_account_number: String,
          debtor_routing_number: String,
          expires_at: Time,
          requested_execution_at: Time,
          unstructured_remittance_information: String,
          creditor_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account Number where the funds will land.
        account_number_id:,
        # The requested amount in USD cents. Must be positive.
        amount:,
        # Details of the person being requested to pay.
        debtor:,
        # The debtor's account number, which the funds will be requested from.
        debtor_account_number:,
        # The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
        debtor_routing_number:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
        # the request for payment is no longer valid. After this time the debtor's bank
        # should no longer allow the debtor to pay it. Must not be before
        # `requested_execution_at`.
        expires_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
        # you are requesting the payment to be made.
        requested_execution_at:,
        # Unstructured information that will show on the recipient's bank statement.
        unstructured_remittance_information:,
        # The name of the creditor requesting the payment. If not provided, defaults to
        # the name of the account's entity.
        creditor_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_number_id: String,
            amount: Integer,
            debtor:
              Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor,
            debtor_account_number: String,
            debtor_routing_number: String,
            expires_at: Time,
            requested_execution_at: Time,
            unstructured_remittance_information: String,
            creditor_name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Debtor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor,
              Increase::Internal::AnyHash
            )
          end

        # Address of the debtor.
        sig do
          returns(
            Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address::OrHash
          ).void
        end
        attr_writer :address

        # The name of the debtor.
        sig { returns(String) }
        attr_accessor :name

        # Details of the person being requested to pay.
        sig do
          params(
            address:
              Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Address of the debtor.
          address:,
          # The name of the debtor.
          name:
        )
        end

        sig do
          override.returns(
            {
              address:
                Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address,
              name: String
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address,
                Increase::Internal::AnyHash
              )
            end

          # The ISO 3166, Alpha-2 country code.
          #
          # Defaults to `US`.
          sig { returns(String) }
          attr_accessor :country

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

          # The town or city.
          sig { returns(T.nilable(String)) }
          attr_reader :city

          sig { params(city: String).void }
          attr_writer :city

          # The postal code or zip.
          sig { returns(T.nilable(String)) }
          attr_reader :postal_code

          sig { params(postal_code: String).void }
          attr_writer :postal_code

          # The US state component of the address.
          sig { returns(T.nilable(String)) }
          attr_reader :state

          sig { params(state: String).void }
          attr_writer :state

          # The street name without the street number.
          sig { returns(T.nilable(String)) }
          attr_reader :street_name

          sig { params(street_name: String).void }
          attr_writer :street_name

          # Address of the debtor.
          sig do
            params(
              country: String,
              address_line2: String,
              building_number: String,
              city: String,
              postal_code: String,
              state: String,
              street_name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The ISO 3166, Alpha-2 country code.
            #
            # Defaults to `US`.
            country:,
            # A second address line, such as an apartment or suite number. The first address
            # line is separated into `building_number` and `street_name`.
            address_line2: nil,
            # The number identifying the position of the building on the street.
            building_number: nil,
            # The town or city.
            city: nil,
            # The postal code or zip.
            postal_code: nil,
            # The US state component of the address.
            state: nil,
            # The street name without the street number.
            street_name: nil
          )
          end

          sig do
            override.returns(
              {
                country: String,
                address_line2: String,
                building_number: String,
                city: String,
                postal_code: String,
                state: String,
                street_name: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
