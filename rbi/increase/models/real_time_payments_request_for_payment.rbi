# typed: strong

module Increase
  module Models
    class RealTimePaymentsRequestForPayment < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimePaymentsRequestForPayment,
            Increase::Internal::AnyHash
          )
        end

      # The Real-Time Payments Request for Payment's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account in which a successful transfer will arrive.
      sig { returns(String) }
      attr_accessor :account_id

      # The Account Number in which a successful transfer will arrive.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # If a cancellation has been requested, this will contain supplemental details.
      # The request for payment moves to `canceled` once the recipient bank acknowledges
      # the cancellation.
      sig do
        returns(
          T.nilable(Increase::RealTimePaymentsRequestForPayment::Cancellation)
        )
      end
      attr_reader :cancellation

      sig do
        params(
          cancellation:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Cancellation::OrHash
            )
        ).void
      end
      attr_writer :cancellation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the request for payment was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The name of the creditor requesting the payment.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For real-time payments transfers this is always equal to `USD`.
      sig do
        returns(
          Increase::RealTimePaymentsRequestForPayment::Currency::TaggedSymbol
        )
      end
      attr_accessor :currency

      # Details of the person being requested to pay.
      sig { returns(Increase::RealTimePaymentsRequestForPayment::Debtor) }
      attr_reader :debtor

      sig do
        params(
          debtor: Increase::RealTimePaymentsRequestForPayment::Debtor::OrHash
        ).void
      end
      attr_writer :debtor

      # The debtor's account number, which the request is sent to.
      sig { returns(String) }
      attr_accessor :debtor_account_number

      # The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :debtor_routing_number

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      # the request for payment is no longer valid. After this time the debtor's bank
      # should no longer allow the debtor to pay it.
      sig { returns(Time) }
      attr_accessor :expires_at

      # The identifier of the Inbound Real-Time Payments Transfer that fulfilled this
      # request.
      sig { returns(T.nilable(String)) }
      attr_accessor :fulfillment_inbound_real_time_payments_transfer_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # If the request for payment is refused by the destination financial institution
      # or the receiving customer, this will contain supplemental details.
      sig do
        returns(T.nilable(Increase::RealTimePaymentsRequestForPayment::Refusal))
      end
      attr_reader :refusal

      sig do
        params(
          refusal:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Refusal::OrHash
            )
        ).void
      end
      attr_writer :refusal

      # If the request for payment is rejected by Real-Time Payments or the destination
      # financial institution, this will contain supplemental details.
      sig do
        returns(
          T.nilable(Increase::RealTimePaymentsRequestForPayment::Rejection)
        )
      end
      attr_reader :rejection

      sig do
        params(
          rejection:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Rejection::OrHash
            )
        ).void
      end
      attr_writer :rejection

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      # the payment was requested to be made.
      sig { returns(T.nilable(Time)) }
      attr_accessor :requested_execution_at

      # The lifecycle status of the request for payment.
      sig do
        returns(
          Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # After the request for payment is submitted to Real-Time Payments, this will
      # contain supplemental details.
      sig do
        returns(
          T.nilable(Increase::RealTimePaymentsRequestForPayment::Submission)
        )
      end
      attr_reader :submission

      sig do
        params(
          submission:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Submission::OrHash
            )
        ).void
      end
      attr_writer :submission

      # A constant representing the object's type. For this resource it will always be
      # `real_time_payments_request_for_payment`.
      sig do
        returns(Increase::RealTimePaymentsRequestForPayment::Type::TaggedSymbol)
      end
      attr_accessor :type

      # Unstructured information that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # Real-Time Payments transfers move funds, within seconds, between your Increase
      # account and any other account on the Real-Time Payments network. A request for
      # payment is a request to the receiver to send funds to your account. The
      # permitted uses of Requests For Payment are limited by the Real-Time Payments
      # network to business-to-business payments and transfers between two accounts at
      # different banks owned by the same individual. Please contact
      # [support@increase.com](mailto:support@increase.com) to enable this API for your
      # team.
      sig do
        params(
          id: String,
          account_id: String,
          account_number_id: String,
          amount: Integer,
          cancellation:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Cancellation::OrHash
            ),
          created_at: Time,
          creditor_name: String,
          currency:
            Increase::RealTimePaymentsRequestForPayment::Currency::OrSymbol,
          debtor: Increase::RealTimePaymentsRequestForPayment::Debtor::OrHash,
          debtor_account_number: String,
          debtor_routing_number: String,
          expires_at: Time,
          fulfillment_inbound_real_time_payments_transfer_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          refusal:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Refusal::OrHash
            ),
          rejection:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Rejection::OrHash
            ),
          requested_execution_at: T.nilable(Time),
          status: Increase::RealTimePaymentsRequestForPayment::Status::OrSymbol,
          submission:
            T.nilable(
              Increase::RealTimePaymentsRequestForPayment::Submission::OrHash
            ),
          type: Increase::RealTimePaymentsRequestForPayment::Type::OrSymbol,
          unstructured_remittance_information: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The Real-Time Payments Request for Payment's identifier.
        id:,
        # The Account in which a successful transfer will arrive.
        account_id:,
        # The Account Number in which a successful transfer will arrive.
        account_number_id:,
        # The transfer amount in USD cents.
        amount:,
        # If a cancellation has been requested, this will contain supplemental details.
        # The request for payment moves to `canceled` once the recipient bank acknowledges
        # the cancellation.
        cancellation:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the request for payment was created.
        created_at:,
        # The name of the creditor requesting the payment.
        creditor_name:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
        # currency. For real-time payments transfers this is always equal to `USD`.
        currency:,
        # Details of the person being requested to pay.
        debtor:,
        # The debtor's account number, which the request is sent to.
        debtor_account_number:,
        # The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
        debtor_routing_number:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
        # the request for payment is no longer valid. After this time the debtor's bank
        # should no longer allow the debtor to pay it.
        expires_at:,
        # The identifier of the Inbound Real-Time Payments Transfer that fulfilled this
        # request.
        fulfillment_inbound_real_time_payments_transfer_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # If the request for payment is refused by the destination financial institution
        # or the receiving customer, this will contain supplemental details.
        refusal:,
        # If the request for payment is rejected by Real-Time Payments or the destination
        # financial institution, this will contain supplemental details.
        rejection:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
        # the payment was requested to be made.
        requested_execution_at:,
        # The lifecycle status of the request for payment.
        status:,
        # After the request for payment is submitted to Real-Time Payments, this will
        # contain supplemental details.
        submission:,
        # A constant representing the object's type. For this resource it will always be
        # `real_time_payments_request_for_payment`.
        type:,
        # Unstructured information that will show on the recipient's bank statement.
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
            cancellation:
              T.nilable(
                Increase::RealTimePaymentsRequestForPayment::Cancellation
              ),
            created_at: Time,
            creditor_name: String,
            currency:
              Increase::RealTimePaymentsRequestForPayment::Currency::TaggedSymbol,
            debtor: Increase::RealTimePaymentsRequestForPayment::Debtor,
            debtor_account_number: String,
            debtor_routing_number: String,
            expires_at: Time,
            fulfillment_inbound_real_time_payments_transfer_id:
              T.nilable(String),
            idempotency_key: T.nilable(String),
            refusal:
              T.nilable(Increase::RealTimePaymentsRequestForPayment::Refusal),
            rejection:
              T.nilable(Increase::RealTimePaymentsRequestForPayment::Rejection),
            requested_execution_at: T.nilable(Time),
            status:
              Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol,
            submission:
              T.nilable(
                Increase::RealTimePaymentsRequestForPayment::Submission
              ),
            type:
              Increase::RealTimePaymentsRequestForPayment::Type::TaggedSymbol,
            unstructured_remittance_information: String
          }
        )
      end
      def to_hash
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsRequestForPayment::Cancellation,
              Increase::Internal::AnyHash
            )
          end

        # Additional information about the cancellation, sent on to the recipient bank.
        sig { returns(T.nilable(String)) }
        attr_accessor :additional_information

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the cancellation was requested.
        sig { returns(Time) }
        attr_accessor :canceled_at

        # The reason the request for payment was canceled.
        sig do
          returns(
            Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # If a cancellation has been requested, this will contain supplemental details.
        # The request for payment moves to `canceled` once the recipient bank acknowledges
        # the cancellation.
        sig do
          params(
            additional_information: T.nilable(String),
            canceled_at: Time,
            reason:
              Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional information about the cancellation, sent on to the recipient bank.
          additional_information:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the cancellation was requested.
          canceled_at:,
          # The reason the request for payment was canceled.
          reason:
        )
        end

        sig do
          override.returns(
            {
              additional_information: T.nilable(String),
              canceled_at: Time,
              reason:
                Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason the request for payment was canceled.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The creditor no longer wants to be paid. Corresponds to the Real-Time Payments reason code `CUST`.
          REQUESTED_BY_CUSTOMER =
            T.let(
              :requested_by_customer,
              Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::TaggedSymbol
            )

          # The requested payment has already been made through another channel. Corresponds to the Real-Time Payments reason code `UPAY`.
          PAID_BY_OTHER_MEANS =
            T.let(
              :paid_by_other_means,
              Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::TaggedSymbol
            )

          # The request for payment duplicated another request for payment. Corresponds to the Real-Time Payments reason code `DUPL`.
          DUPLICATE =
            T.let(
              :duplicate,
              Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::TaggedSymbol
            )

          # The request for payment was sent for the wrong amount. Corresponds to the Real-Time Payments reason code `AM09`.
          WRONG_AMOUNT =
            T.let(
              :wrong_amount,
              Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimePaymentsRequestForPayment::Cancellation::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For real-time payments transfers this is always equal to `USD`.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::RealTimePaymentsRequestForPayment::Currency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD =
          T.let(
            :USD,
            Increase::RealTimePaymentsRequestForPayment::Currency::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::RealTimePaymentsRequestForPayment::Currency::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Debtor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsRequestForPayment::Debtor,
              Increase::Internal::AnyHash
            )
          end

        # Address of the debtor.
        sig do
          returns(Increase::RealTimePaymentsRequestForPayment::Debtor::Address)
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::RealTimePaymentsRequestForPayment::Debtor::Address::OrHash
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
              Increase::RealTimePaymentsRequestForPayment::Debtor::Address::OrHash,
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
                Increase::RealTimePaymentsRequestForPayment::Debtor::Address,
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
                Increase::RealTimePaymentsRequestForPayment::Debtor::Address,
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

          # Address of the debtor.
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

      class Refusal < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsRequestForPayment::Refusal,
              Increase::Internal::AnyHash
            )
          end

        # Additional information about the refusal provided by the recipient bank or the
        # customer. This is typically present when the `refusal_reason_code` is `other`.
        sig { returns(T.nilable(String)) }
        attr_accessor :refusal_reason_additional_information

        # The reason the request for payment was refused as provided by the recipient bank
        # or the customer.
        sig do
          returns(
            Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
          )
        end
        attr_accessor :refusal_reason_code

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the request for payment was refused.
        sig { returns(T.nilable(Time)) }
        attr_accessor :refused_at

        # If the request for payment is refused by the destination financial institution
        # or the receiving customer, this will contain supplemental details.
        sig do
          params(
            refusal_reason_additional_information: T.nilable(String),
            refusal_reason_code:
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::OrSymbol,
            refused_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional information about the refusal provided by the recipient bank or the
          # customer. This is typically present when the `refusal_reason_code` is `other`.
          refusal_reason_additional_information:,
          # The reason the request for payment was refused as provided by the recipient bank
          # or the customer.
          refusal_reason_code:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the request for payment was refused.
          refused_at:
        )
        end

        sig do
          override.returns(
            {
              refusal_reason_additional_information: T.nilable(String),
              refusal_reason_code:
                Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol,
              refused_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        # The reason the request for payment was refused as provided by the recipient bank
        # or the customer.
        module RefusalReasonCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The destination account is currently blocked from receiving transactions. Corresponds to the Real-Time Payments reason code `AC06`.
          ACCOUNT_BLOCKED =
            T.let(
              :account_blocked,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not allowed to the destination account. Corresponds to the Real-Time Payments reason code `AG01`.
          TRANSACTION_FORBIDDEN =
            T.let(
              :transaction_forbidden,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `AG03`.
          TRANSACTION_TYPE_NOT_SUPPORTED =
            T.let(
              :transaction_type_not_supported,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The amount of the transfer is different than expected by the recipient. Corresponds to the Real-Time Payments reason code `AM09`.
          UNEXPECTED_AMOUNT =
            T.let(
              :unexpected_amount,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the Real-Time Payments reason code `AM14`.
          AMOUNT_EXCEEDS_BANK_LIMITS =
            T.let(
              :amount_exceeds_bank_limits,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The debtor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE07`.
          INVALID_DEBTOR_ADDRESS =
            T.let(
              :invalid_debtor_address,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The creditor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE04`.
          INVALID_CREDITOR_ADDRESS =
            T.let(
              :invalid_creditor_address,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # Creditor identifier incorrect. Corresponds to the Real-Time Payments reason code `CH11`.
          CREDITOR_IDENTIFIER_INCORRECT =
            T.let(
              :creditor_identifier_incorrect,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The customer refused the request. Corresponds to the Real-Time Payments reason code `CUST`.
          REQUESTED_BY_CUSTOMER =
            T.let(
              :requested_by_customer,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The order was rejected. Corresponds to the Real-Time Payments reason code `DS04`.
          ORDER_REJECTED =
            T.let(
              :order_rejected,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The destination account holder is deceased. Corresponds to the Real-Time Payments reason code `MD07`.
          END_CUSTOMER_DECEASED =
            T.let(
              :end_customer_deceased,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # The customer has opted out of receiving requests for payments from this creditor. Corresponds to the Real-Time Payments reason code `SL12`.
          CUSTOMER_HAS_OPTED_OUT =
            T.let(
              :customer_has_opted_out,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          # Some other error or issue has occurred.
          OTHER =
            T.let(
              :other,
              Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimePaymentsRequestForPayment::Refusal::RefusalReasonCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Rejection < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsRequestForPayment::Rejection,
              Increase::Internal::AnyHash
            )
          end

        # Additional information about the rejection provided by the recipient bank or the
        # Real-Time Payments network. This is typically present when the
        # `reject_reason_code` is `narrative`.
        sig { returns(T.nilable(String)) }
        attr_accessor :reject_reason_additional_information

        # The reason the request for payment was rejected as provided by the recipient
        # bank or the Real-Time Payments network.
        sig do
          returns(
            Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
          )
        end
        attr_accessor :reject_reason_code

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the request for payment was rejected.
        sig { returns(T.nilable(Time)) }
        attr_accessor :rejected_at

        # If the request for payment is rejected by Real-Time Payments or the destination
        # financial institution, this will contain supplemental details.
        sig do
          params(
            reject_reason_additional_information: T.nilable(String),
            reject_reason_code:
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::OrSymbol,
            rejected_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional information about the rejection provided by the recipient bank or the
          # Real-Time Payments network. This is typically present when the
          # `reject_reason_code` is `narrative`.
          reject_reason_additional_information:,
          # The reason the request for payment was rejected as provided by the recipient
          # bank or the Real-Time Payments network.
          reject_reason_code:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the request for payment was rejected.
          rejected_at:
        )
        end

        sig do
          override.returns(
            {
              reject_reason_additional_information: T.nilable(String),
              reject_reason_code:
                Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol,
              rejected_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        # The reason the request for payment was rejected as provided by the recipient
        # bank or the Real-Time Payments network.
        module RejectReasonCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The destination account is closed. Corresponds to the Real-Time Payments reason code "AC04".
          ACCOUNT_CLOSED =
            T.let(
              :account_closed,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account is currently blocked from receiving transactions. Corresponds to the Real-Time Payments reason code "AC06".
          ACCOUNT_BLOCKED =
            T.let(
              :account_blocked,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account is ineligible to receive Real-Time Payments transfers. Corresponds to the Real-Time Payments reason code "AC14".
          INVALID_CREDITOR_ACCOUNT_TYPE =
            T.let(
              :invalid_creditor_account_type,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account does not exist. Corresponds to the Real-Time Payments reason code "AC03".
          INVALID_CREDITOR_ACCOUNT_NUMBER =
            T.let(
              :invalid_creditor_account_number,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination routing number is invalid. Corresponds to the Real-Time Payments reason code "RC04".
          INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER =
            T.let(
              :invalid_creditor_financial_institution_identifier,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account holder is deceased. Corresponds to the Real-Time Payments reason code "MD07".
          END_CUSTOMER_DECEASED =
            T.let(
              :end_customer_deceased,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The reason is provided as narrative information in the additional information field.
          NARRATIVE =
            T.let(
              :narrative,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not allowed to the destination account. Corresponds to the Real-Time Payments reason code "AG01".
          TRANSACTION_FORBIDDEN =
            T.let(
              :transaction_forbidden,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code "AG03".
          TRANSACTION_TYPE_NOT_SUPPORTED =
            T.let(
              :transaction_type_not_supported,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The amount of the transfer is different than expected by the recipient. Corresponds to the Real-Time Payments reason code "AM09".
          UNEXPECTED_AMOUNT =
            T.let(
              :unexpected_amount,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the Real-Time Payments reason code "AM14".
          AMOUNT_EXCEEDS_BANK_LIMITS =
            T.let(
              :amount_exceeds_bank_limits,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The creditor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code "BE04".
          INVALID_CREDITOR_ADDRESS =
            T.let(
              :invalid_creditor_address,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The specified creditor is unknown. Corresponds to the Real-Time Payments reason code "BE06".
          UNKNOWN_END_CUSTOMER =
            T.let(
              :unknown_end_customer,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The debtor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code "BE07".
          INVALID_DEBTOR_ADDRESS =
            T.let(
              :invalid_debtor_address,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # There was a timeout processing the transfer. Corresponds to the Real-Time Payments reason code "DS24".
          TIMEOUT =
            T.let(
              :timeout,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code "NOAT".
          UNSUPPORTED_MESSAGE_FOR_RECIPIENT =
            T.let(
              :unsupported_message_for_recipient,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination financial institution is currently not connected to Real-Time Payments. Corresponds to the Real-Time Payments reason code "9912".
          RECIPIENT_CONNECTION_NOT_AVAILABLE =
            T.let(
              :recipient_connection_not_available,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments is currently unavailable. Corresponds to the Real-Time Payments reason code "9948".
          REAL_TIME_PAYMENTS_SUSPENDED =
            T.let(
              :real_time_payments_suspended,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination financial institution is currently signed off of Real-Time Payments. Corresponds to the Real-Time Payments reason code "9910".
          INSTRUCTED_AGENT_SIGNED_OFF =
            T.let(
              :instructed_agent_signed_off,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The transfer was rejected due to an internal Increase issue. We have been notified.
          PROCESSING_ERROR =
            T.let(
              :processing_error,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Some other error or issue has occurred.
          OTHER =
            T.let(
              :other,
              Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimePaymentsRequestForPayment::Rejection::RejectReasonCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The lifecycle status of the request for payment.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::RealTimePaymentsRequestForPayment::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The request for payment is queued to be submitted to Real-Time Payments.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
          )

        # The request for payment has been submitted and is pending a response from Real-Time Payments.
        PENDING_RESPONSE =
          T.let(
            :pending_response,
            Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
          )

        # The request for payment was rejected by the network or the recipient.
        REJECTED =
          T.let(
            :rejected,
            Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
          )

        # The request for payment was accepted by the recipient but has not yet been paid.
        ACCEPTED =
          T.let(
            :accepted,
            Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
          )

        # The request for payment was refused by the recipient.
        REFUSED =
          T.let(
            :refused,
            Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
          )

        # The request for payment was fulfilled by the receiver.
        FULFILLED =
          T.let(
            :fulfilled,
            Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
          )

        # The request for payment was canceled and can no longer be paid.
        CANCELED =
          T.let(
            :canceled,
            Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::RealTimePaymentsRequestForPayment::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsRequestForPayment::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The Real-Time Payments payment information identification of the request.
        sig { returns(String) }
        attr_accessor :payment_information_identification

        # After the request for payment is submitted to Real-Time Payments, this will
        # contain supplemental details.
        sig do
          params(payment_information_identification: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The Real-Time Payments payment information identification of the request.
          payment_information_identification:
        )
        end

        sig { override.returns({ payment_information_identification: String }) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `real_time_payments_request_for_payment`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::RealTimePaymentsRequestForPayment::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT =
          T.let(
            :real_time_payments_request_for_payment,
            Increase::RealTimePaymentsRequestForPayment::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::RealTimePaymentsRequestForPayment::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
