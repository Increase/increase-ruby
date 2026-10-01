# typed: strong

module Increase
  module Models
    class InboundRealTimePaymentsRequestForPayment < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundRealTimePaymentsRequestForPayment,
            Increase::Internal::AnyHash
          )
        end

      # The inbound Real-Time Payments request for payment's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account the request for payment is for.
      sig { returns(String) }
      attr_accessor :account_id

      # The identifier of the Account Number the request for payment is for.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The requested amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the request for payment was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Details of the party requesting payment.
      sig do
        returns(Increase::InboundRealTimePaymentsRequestForPayment::Creditor)
      end
      attr_reader :creditor

      sig do
        params(
          creditor:
            Increase::InboundRealTimePaymentsRequestForPayment::Creditor::OrHash
        ).void
      end
      attr_writer :creditor

      # The creditor's account number.
      sig { returns(String) }
      attr_accessor :creditor_account_number

      # The creditor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :creditor_routing_number

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the requested
      # currency. This will always be "USD" for a Real-Time Payments request for
      # payment.
      sig do
        returns(
          Increase::InboundRealTimePaymentsRequestForPayment::Currency::TaggedSymbol
        )
      end
      attr_accessor :currency

      # The name of the account holder the payment is requested from, as provided by the
      # creditor.
      sig { returns(String) }
      attr_accessor :debtor_name

      # A free-form reference string set by the creditor, to help identify the request
      # for payment.
      sig { returns(String) }
      attr_accessor :end_to_end_identification

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      # the request for payment is no longer valid and should no longer be paid.
      sig { returns(Time) }
      attr_accessor :expires_at

      # The identifier of the Real-Time Payments Transfer that fulfilled this request
      # for payment. This is set once a transfer sent in response to the request for
      # payment has been acknowledged by the Real-Time Payments network.
      sig { returns(T.nilable(String)) }
      attr_accessor :fulfillment_real_time_payments_transfer_id

      # An identifier for the party that issued the invoice, for requests for payment
      # sent on behalf of another party.
      sig { returns(T.nilable(String)) }
      attr_accessor :invoicer_identification

      # The Real-Time Payments network identification of the request for payment.
      sig { returns(String) }
      attr_accessor :payment_information_identification

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      # the creditor requests the payment to be made.
      sig { returns(T.nilable(Time)) }
      attr_accessor :requested_execution_at

      # A constant representing the object's type. For this resource it will always be
      # `inbound_real_time_payments_request_for_payment`.
      sig do
        returns(
          Increase::InboundRealTimePaymentsRequestForPayment::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      # Unstructured information included with the request for payment.
      sig { returns(T.nilable(String)) }
      attr_accessor :unstructured_remittance_information

      # An Inbound Real-Time Payments Request for Payment is a request initiated outside
      # of Increase for one of your accounts to send a Real-Time Payments transfer.
      sig do
        params(
          id: String,
          account_id: String,
          account_number_id: String,
          amount: Integer,
          created_at: Time,
          creditor:
            Increase::InboundRealTimePaymentsRequestForPayment::Creditor::OrHash,
          creditor_account_number: String,
          creditor_routing_number: String,
          currency:
            Increase::InboundRealTimePaymentsRequestForPayment::Currency::OrSymbol,
          debtor_name: String,
          end_to_end_identification: String,
          expires_at: Time,
          fulfillment_real_time_payments_transfer_id: T.nilable(String),
          invoicer_identification: T.nilable(String),
          payment_information_identification: String,
          requested_execution_at: T.nilable(Time),
          type:
            Increase::InboundRealTimePaymentsRequestForPayment::Type::OrSymbol,
          unstructured_remittance_information: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The inbound Real-Time Payments request for payment's identifier.
        id:,
        # The Account the request for payment is for.
        account_id:,
        # The identifier of the Account Number the request for payment is for.
        account_number_id:,
        # The requested amount in USD cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the request for payment was created.
        created_at:,
        # Details of the party requesting payment.
        creditor:,
        # The creditor's account number.
        creditor_account_number:,
        # The creditor's American Bankers' Association (ABA) Routing Transit Number (RTN).
        creditor_routing_number:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the requested
        # currency. This will always be "USD" for a Real-Time Payments request for
        # payment.
        currency:,
        # The name of the account holder the payment is requested from, as provided by the
        # creditor.
        debtor_name:,
        # A free-form reference string set by the creditor, to help identify the request
        # for payment.
        end_to_end_identification:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
        # the request for payment is no longer valid and should no longer be paid.
        expires_at:,
        # The identifier of the Real-Time Payments Transfer that fulfilled this request
        # for payment. This is set once a transfer sent in response to the request for
        # payment has been acknowledged by the Real-Time Payments network.
        fulfillment_real_time_payments_transfer_id:,
        # An identifier for the party that issued the invoice, for requests for payment
        # sent on behalf of another party.
        invoicer_identification:,
        # The Real-Time Payments network identification of the request for payment.
        payment_information_identification:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
        # the creditor requests the payment to be made.
        requested_execution_at:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_real_time_payments_request_for_payment`.
        type:,
        # Unstructured information included with the request for payment.
        unstructured_remittance_information:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number_id: String,
            amount: Integer,
            created_at: Time,
            creditor:
              Increase::InboundRealTimePaymentsRequestForPayment::Creditor,
            creditor_account_number: String,
            creditor_routing_number: String,
            currency:
              Increase::InboundRealTimePaymentsRequestForPayment::Currency::TaggedSymbol,
            debtor_name: String,
            end_to_end_identification: String,
            expires_at: Time,
            fulfillment_real_time_payments_transfer_id: T.nilable(String),
            invoicer_identification: T.nilable(String),
            payment_information_identification: String,
            requested_execution_at: T.nilable(Time),
            type:
              Increase::InboundRealTimePaymentsRequestForPayment::Type::TaggedSymbol,
            unstructured_remittance_information: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Creditor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundRealTimePaymentsRequestForPayment::Creditor,
              Increase::Internal::AnyHash
            )
          end

        # The name of the account that would receive the payment, as provided by the
        # creditor.
        sig { returns(T.nilable(String)) }
        attr_accessor :account_name

        # Address of the creditor.
        sig do
          returns(
            Increase::InboundRealTimePaymentsRequestForPayment::Creditor::Address
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::InboundRealTimePaymentsRequestForPayment::Creditor::Address::OrHash
          ).void
        end
        attr_writer :address

        # The name of the creditor.
        sig { returns(String) }
        attr_accessor :name

        # Details of the party requesting payment.
        sig do
          params(
            account_name: T.nilable(String),
            address:
              Increase::InboundRealTimePaymentsRequestForPayment::Creditor::Address::OrHash,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The name of the account that would receive the payment, as provided by the
          # creditor.
          account_name:,
          # Address of the creditor.
          address:,
          # The name of the creditor.
          name:
        )
        end

        sig do
          override.returns(
            {
              account_name: T.nilable(String),
              address:
                Increase::InboundRealTimePaymentsRequestForPayment::Creditor::Address,
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
                Increase::InboundRealTimePaymentsRequestForPayment::Creditor::Address,
                Increase::Internal::AnyHash
              )
            end

          # A second address line, such as an apartment or suite number. The first address
          # line is separated into `building_number` and `street_name`.
          sig { returns(T.nilable(String)) }
          attr_accessor :address_line2

          # The number identifying the position of the building on the street.
          sig { returns(T.nilable(String)) }
          attr_accessor :building_number

          # The town or city.
          sig { returns(T.nilable(String)) }
          attr_accessor :city

          # The ISO 3166, Alpha-2 country code.
          sig { returns(T.nilable(String)) }
          attr_accessor :country

          # The postal code or zip.
          sig { returns(T.nilable(String)) }
          attr_accessor :postal_code

          # The US state component of the address.
          sig { returns(T.nilable(String)) }
          attr_accessor :state

          # The street name without the street number.
          sig { returns(T.nilable(String)) }
          attr_accessor :street_name

          # Address of the creditor.
          sig do
            params(
              address_line2: T.nilable(String),
              building_number: T.nilable(String),
              city: T.nilable(String),
              country: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String),
              street_name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # A second address line, such as an apartment or suite number. The first address
            # line is separated into `building_number` and `street_name`.
            address_line2:,
            # The number identifying the position of the building on the street.
            building_number:,
            # The town or city.
            city:,
            # The ISO 3166, Alpha-2 country code.
            country:,
            # The postal code or zip.
            postal_code:,
            # The US state component of the address.
            state:,
            # The street name without the street number.
            street_name:
          )
          end

          sig do
            override.returns(
              {
                address_line2: T.nilable(String),
                building_number: T.nilable(String),
                city: T.nilable(String),
                country: T.nilable(String),
                postal_code: T.nilable(String),
                state: T.nilable(String),
                street_name: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the requested
      # currency. This will always be "USD" for a Real-Time Payments request for
      # payment.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::InboundRealTimePaymentsRequestForPayment::Currency
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD =
          T.let(
            :USD,
            Increase::InboundRealTimePaymentsRequestForPayment::Currency::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundRealTimePaymentsRequestForPayment::Currency::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_real_time_payments_request_for_payment`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::InboundRealTimePaymentsRequestForPayment::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT =
          T.let(
            :inbound_real_time_payments_request_for_payment,
            Increase::InboundRealTimePaymentsRequestForPayment::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundRealTimePaymentsRequestForPayment::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
