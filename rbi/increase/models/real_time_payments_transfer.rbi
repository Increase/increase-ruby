# typed: strong

module Increase
  module Models
    class RealTimePaymentsTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::RealTimePaymentsTransfer, Increase::Internal::AnyHash)
        end

      # The Real-Time Payments Transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account from which the transfer was sent.
      sig { returns(String) }
      attr_accessor :account_id

      # If the transfer is acknowledged by the recipient bank, this will contain
      # supplemental details.
      sig do
        returns(T.nilable(Increase::RealTimePaymentsTransfer::Acknowledgement))
      end
      attr_reader :acknowledgement

      sig do
        params(
          acknowledgement:
            T.nilable(
              Increase::RealTimePaymentsTransfer::Acknowledgement::OrHash
            )
        ).void
      end
      attr_writer :acknowledgement

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your account requires approvals for transfers and the transfer was approved,
      # this will contain details of the approval.
      sig { returns(T.nilable(Increase::RealTimePaymentsTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(
          approval:
            T.nilable(Increase::RealTimePaymentsTransfer::Approval::OrHash)
        ).void
      end
      attr_writer :approval

      # If your account requires approvals for transfers and the transfer was not
      # approved, this will contain details of the cancellation.
      sig do
        returns(T.nilable(Increase::RealTimePaymentsTransfer::Cancellation))
      end
      attr_reader :cancellation

      sig do
        params(
          cancellation:
            T.nilable(Increase::RealTimePaymentsTransfer::Cancellation::OrHash)
        ).void
      end
      attr_writer :cancellation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::RealTimePaymentsTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by:
            T.nilable(Increase::RealTimePaymentsTransfer::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # The name of the transfer's recipient. This is set by the sender when creating
      # the transfer.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For real-time payments transfers this is always equal to `USD`.
      sig do
        returns(Increase::RealTimePaymentsTransfer::Currency::TaggedSymbol)
      end
      attr_accessor :currency

      # The name of the transfer's sender. If not provided, defaults to the name of the
      # account's entity.
      sig { returns(T.nilable(String)) }
      attr_accessor :debtor_name

      # The destination account number.
      sig { returns(String) }
      attr_accessor :destination_account_number

      # The destination American Bankers' Association (ABA) Routing Transit Number
      # (RTN).
      sig { returns(String) }
      attr_accessor :destination_routing_number

      # The identifier of the External Account the transfer was made to, if any.
      sig { returns(T.nilable(String)) }
      attr_accessor :external_account_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The ID for the pending transaction representing the transfer. A pending
      # transaction is created when the transfer
      # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      # by someone else in your organization.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # If the transfer is rejected by Real-Time Payments or the destination financial
      # institution, this will contain supplemental details.
      sig { returns(T.nilable(Increase::RealTimePaymentsTransfer::Rejection)) }
      attr_reader :rejection

      sig do
        params(
          rejection:
            T.nilable(Increase::RealTimePaymentsTransfer::Rejection::OrHash)
        ).void
      end
      attr_writer :rejection

      # Unstructured information that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :remittance_information

      # The Account Number the recipient will see as having sent the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::RealTimePaymentsTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # After the transfer is submitted to Real-Time Payments, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::RealTimePaymentsTransfer::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission:
            T.nilable(Increase::RealTimePaymentsTransfer::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # The Transaction funding the transfer once it is complete.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `real_time_payments_transfer`.
      sig { returns(Increase::RealTimePaymentsTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # The name of the ultimate recipient of the transfer. Set this if the creditor is
      # an intermediary receiving the payment for someone else.
      sig { returns(T.nilable(String)) }
      attr_accessor :ultimate_creditor_name

      # The name of the ultimate sender of the transfer. Set this if the funds are being
      # sent on behalf of someone who is not the account holder at Increase.
      sig { returns(T.nilable(String)) }
      attr_accessor :ultimate_debtor_name

      # Real-Time Payments transfers move funds, within seconds, between your Increase
      # account and any other account on the Real-Time Payments network.
      sig do
        params(
          id: String,
          account_id: String,
          acknowledgement:
            T.nilable(
              Increase::RealTimePaymentsTransfer::Acknowledgement::OrHash
            ),
          amount: Integer,
          approval:
            T.nilable(Increase::RealTimePaymentsTransfer::Approval::OrHash),
          cancellation:
            T.nilable(Increase::RealTimePaymentsTransfer::Cancellation::OrHash),
          created_at: Time,
          created_by:
            T.nilable(Increase::RealTimePaymentsTransfer::CreatedBy::OrHash),
          creditor_name: String,
          currency: Increase::RealTimePaymentsTransfer::Currency::OrSymbol,
          debtor_name: T.nilable(String),
          destination_account_number: String,
          destination_routing_number: String,
          external_account_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          pending_transaction_id: T.nilable(String),
          rejection:
            T.nilable(Increase::RealTimePaymentsTransfer::Rejection::OrHash),
          remittance_information: String,
          source_account_number_id: String,
          status: Increase::RealTimePaymentsTransfer::Status::OrSymbol,
          submission:
            T.nilable(Increase::RealTimePaymentsTransfer::Submission::OrHash),
          transaction_id: T.nilable(String),
          type: Increase::RealTimePaymentsTransfer::Type::OrSymbol,
          ultimate_creditor_name: T.nilable(String),
          ultimate_debtor_name: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The Real-Time Payments Transfer's identifier.
        id:,
        # The Account from which the transfer was sent.
        account_id:,
        # If the transfer is acknowledged by the recipient bank, this will contain
        # supplemental details.
        acknowledgement:,
        # The transfer amount in USD cents.
        amount:,
        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        approval:,
        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        cancellation:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # What object created the transfer, either via the API or the dashboard.
        created_by:,
        # The name of the transfer's recipient. This is set by the sender when creating
        # the transfer.
        creditor_name:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
        # currency. For real-time payments transfers this is always equal to `USD`.
        currency:,
        # The name of the transfer's sender. If not provided, defaults to the name of the
        # account's entity.
        debtor_name:,
        # The destination account number.
        destination_account_number:,
        # The destination American Bankers' Association (ABA) Routing Transit Number
        # (RTN).
        destination_routing_number:,
        # The identifier of the External Account the transfer was made to, if any.
        external_account_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The ID for the pending transaction representing the transfer. A pending
        # transaction is created when the transfer
        # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
        # by someone else in your organization.
        pending_transaction_id:,
        # If the transfer is rejected by Real-Time Payments or the destination financial
        # institution, this will contain supplemental details.
        rejection:,
        # Unstructured information that will show on the recipient's bank statement.
        remittance_information:,
        # The Account Number the recipient will see as having sent the transfer.
        source_account_number_id:,
        # The lifecycle status of the transfer.
        status:,
        # After the transfer is submitted to Real-Time Payments, this will contain
        # supplemental details.
        submission:,
        # The Transaction funding the transfer once it is complete.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `real_time_payments_transfer`.
        type:,
        # The name of the ultimate recipient of the transfer. Set this if the creditor is
        # an intermediary receiving the payment for someone else.
        ultimate_creditor_name:,
        # The name of the ultimate sender of the transfer. Set this if the funds are being
        # sent on behalf of someone who is not the account holder at Increase.
        ultimate_debtor_name:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            acknowledgement:
              T.nilable(Increase::RealTimePaymentsTransfer::Acknowledgement),
            amount: Integer,
            approval: T.nilable(Increase::RealTimePaymentsTransfer::Approval),
            cancellation:
              T.nilable(Increase::RealTimePaymentsTransfer::Cancellation),
            created_at: Time,
            created_by:
              T.nilable(Increase::RealTimePaymentsTransfer::CreatedBy),
            creditor_name: String,
            currency:
              Increase::RealTimePaymentsTransfer::Currency::TaggedSymbol,
            debtor_name: T.nilable(String),
            destination_account_number: String,
            destination_routing_number: String,
            external_account_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            pending_transaction_id: T.nilable(String),
            rejection: T.nilable(Increase::RealTimePaymentsTransfer::Rejection),
            remittance_information: String,
            source_account_number_id: String,
            status: Increase::RealTimePaymentsTransfer::Status::TaggedSymbol,
            submission:
              T.nilable(Increase::RealTimePaymentsTransfer::Submission),
            transaction_id: T.nilable(String),
            type: Increase::RealTimePaymentsTransfer::Type::TaggedSymbol,
            ultimate_creditor_name: T.nilable(String),
            ultimate_debtor_name: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Acknowledgement < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsTransfer::Acknowledgement,
              Increase::Internal::AnyHash
            )
          end

        # When the transfer was acknowledged.
        sig { returns(Time) }
        attr_accessor :acknowledged_at

        # If the transfer is acknowledged by the recipient bank, this will contain
        # supplemental details.
        sig { params(acknowledged_at: Time).returns(T.attached_class) }
        def self.new(
          # When the transfer was acknowledged.
          acknowledged_at:
        )
        end

        sig { override.returns({ acknowledged_at: Time }) }
        def to_hash
        end
      end

      class Approval < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsTransfer::Approval,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was approved.
        sig { returns(Time) }
        attr_accessor :approved_at

        # If the Transfer was approved by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :approved_by

        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        sig do
          params(approved_at: Time, approved_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was approved.
          approved_at:,
          # If the Transfer was approved by a user in the dashboard, the email address of
          # that user.
          approved_by:
        )
        end

        sig do
          override.returns(
            { approved_at: Time, approved_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsTransfer::Cancellation,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Transfer was canceled.
        sig { returns(Time) }
        attr_accessor :canceled_at

        # If the Transfer was canceled by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :canceled_by

        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        sig do
          params(canceled_at: Time, canceled_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Transfer was canceled.
          canceled_at:,
          # If the Transfer was canceled by a user in the dashboard, the email address of
          # that user.
          canceled_by:
        )
        end

        sig do
          override.returns(
            { canceled_at: Time, canceled_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsTransfer::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # The type of object that created this transfer.
        sig do
          returns(
            Increase::RealTimePaymentsTransfer::CreatedBy::Category::TaggedSymbol
          )
        end
        attr_accessor :category

        # If present, details about the API key that created the transfer.
        sig do
          returns(
            T.nilable(Increase::RealTimePaymentsTransfer::CreatedBy::APIKey)
          )
        end
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(
                Increase::RealTimePaymentsTransfer::CreatedBy::APIKey::OrHash
              )
          ).void
        end
        attr_writer :api_key

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(
              Increase::RealTimePaymentsTransfer::CreatedBy::OAuthApplication
            )
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::RealTimePaymentsTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig do
          returns(
            T.nilable(Increase::RealTimePaymentsTransfer::CreatedBy::User)
          )
        end
        attr_reader :user

        sig do
          params(
            user:
              T.nilable(
                Increase::RealTimePaymentsTransfer::CreatedBy::User::OrHash
              )
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            category:
              Increase::RealTimePaymentsTransfer::CreatedBy::Category::OrSymbol,
            api_key:
              T.nilable(
                Increase::RealTimePaymentsTransfer::CreatedBy::APIKey::OrHash
              ),
            oauth_application:
              T.nilable(
                Increase::RealTimePaymentsTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user:
              T.nilable(
                Increase::RealTimePaymentsTransfer::CreatedBy::User::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of object that created this transfer.
          category:,
          # If present, details about the API key that created the transfer.
          api_key: nil,
          # If present, details about the OAuth Application that created the transfer.
          oauth_application: nil,
          # If present, details about the User that created the transfer.
          user: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::RealTimePaymentsTransfer::CreatedBy::Category::TaggedSymbol,
              api_key:
                T.nilable(
                  Increase::RealTimePaymentsTransfer::CreatedBy::APIKey
                ),
              oauth_application:
                T.nilable(
                  Increase::RealTimePaymentsTransfer::CreatedBy::OAuthApplication
                ),
              user:
                T.nilable(Increase::RealTimePaymentsTransfer::CreatedBy::User)
            }
          )
        end
        def to_hash
        end

        # The type of object that created this transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimePaymentsTransfer::CreatedBy::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::RealTimePaymentsTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::RealTimePaymentsTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::RealTimePaymentsTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimePaymentsTransfer::CreatedBy::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class APIKey < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimePaymentsTransfer::CreatedBy::APIKey,
                Increase::Internal::AnyHash
              )
            end

          # The description set for the API key when it was created.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # If present, details about the API key that created the transfer.
          sig do
            params(description: T.nilable(String)).returns(T.attached_class)
          end
          def self.new(
            # The description set for the API key when it was created.
            description:
          )
          end

          sig { override.returns({ description: T.nilable(String) }) }
          def to_hash
          end
        end

        class OAuthApplication < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimePaymentsTransfer::CreatedBy::OAuthApplication,
                Increase::Internal::AnyHash
              )
            end

          # The name of the OAuth Application.
          sig { returns(String) }
          attr_accessor :name

          # If present, details about the OAuth Application that created the transfer.
          sig { params(name: String).returns(T.attached_class) }
          def self.new(
            # The name of the OAuth Application.
            name:
          )
          end

          sig { override.returns({ name: String }) }
          def to_hash
          end
        end

        class User < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimePaymentsTransfer::CreatedBy::User,
                Increase::Internal::AnyHash
              )
            end

          # The email address of the User.
          sig { returns(String) }
          attr_accessor :email

          # If present, details about the User that created the transfer.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(
            # The email address of the User.
            email:
          )
          end

          sig { override.returns({ email: String }) }
          def to_hash
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For real-time payments transfers this is always equal to `USD`.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::RealTimePaymentsTransfer::Currency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD =
          T.let(
            :USD,
            Increase::RealTimePaymentsTransfer::Currency::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::RealTimePaymentsTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Rejection < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsTransfer::Rejection,
              Increase::Internal::AnyHash
            )
          end

        # Additional information about the rejection provided by the recipient bank when
        # the `reject_reason_code` is `NARRATIVE`.
        sig { returns(T.nilable(String)) }
        attr_accessor :reject_reason_additional_information

        # The reason the transfer was rejected as provided by the recipient bank or the
        # Real-Time Payments network.
        sig do
          returns(
            Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
          )
        end
        attr_accessor :reject_reason_code

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was rejected.
        sig { returns(T.nilable(Time)) }
        attr_accessor :rejected_at

        # If the transfer is rejected by Real-Time Payments or the destination financial
        # institution, this will contain supplemental details.
        sig do
          params(
            reject_reason_additional_information: T.nilable(String),
            reject_reason_code:
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::OrSymbol,
            rejected_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional information about the rejection provided by the recipient bank when
          # the `reject_reason_code` is `NARRATIVE`.
          reject_reason_additional_information:,
          # The reason the transfer was rejected as provided by the recipient bank or the
          # Real-Time Payments network.
          reject_reason_code:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was rejected.
          rejected_at:
        )
        end

        sig do
          override.returns(
            {
              reject_reason_additional_information: T.nilable(String),
              reject_reason_code:
                Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol,
              rejected_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        # The reason the transfer was rejected as provided by the recipient bank or the
        # Real-Time Payments network.
        module RejectReasonCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The destination account is closed. Corresponds to the Real-Time Payments reason code `AC04`.
          ACCOUNT_CLOSED =
            T.let(
              :account_closed,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account is currently blocked from receiving transactions. Corresponds to the Real-Time Payments reason code `AC06`.
          ACCOUNT_BLOCKED =
            T.let(
              :account_blocked,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account is ineligible to receive Real-Time Payments transfers. Corresponds to the Real-Time Payments reason code `AC14`.
          INVALID_CREDITOR_ACCOUNT_TYPE =
            T.let(
              :invalid_creditor_account_type,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account does not exist. Corresponds to the Real-Time Payments reason code `AC03`.
          INVALID_CREDITOR_ACCOUNT_NUMBER =
            T.let(
              :invalid_creditor_account_number,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination routing number is invalid. Corresponds to the Real-Time Payments reason code `RC04`.
          INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER =
            T.let(
              :invalid_creditor_financial_institution_identifier,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account holder is deceased. Corresponds to the Real-Time Payments reason code `MD07`.
          END_CUSTOMER_DECEASED =
            T.let(
              :end_customer_deceased,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The reason is provided as narrative information in the additional information field.
          NARRATIVE =
            T.let(
              :narrative,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not allowed to the destination account. Corresponds to the Real-Time Payments reason code `AG01`.
          TRANSACTION_FORBIDDEN =
            T.let(
              :transaction_forbidden,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `AG03`.
          TRANSACTION_TYPE_NOT_SUPPORTED =
            T.let(
              :transaction_type_not_supported,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The amount of the transfer is different than expected by the recipient. Corresponds to the Real-Time Payments reason code `AM09`.
          UNEXPECTED_AMOUNT =
            T.let(
              :unexpected_amount,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the Real-Time Payments reason code `AM14`.
          AMOUNT_EXCEEDS_BANK_LIMITS =
            T.let(
              :amount_exceeds_bank_limits,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The creditor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE04`.
          INVALID_CREDITOR_ADDRESS =
            T.let(
              :invalid_creditor_address,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The specified creditor is unknown. Corresponds to the Real-Time Payments reason code `BE06`.
          UNKNOWN_END_CUSTOMER =
            T.let(
              :unknown_end_customer,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The debtor's address is required, but missing or invalid. Corresponds to the Real-Time Payments reason code `BE07`.
          INVALID_DEBTOR_ADDRESS =
            T.let(
              :invalid_debtor_address,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # There was a timeout processing the transfer. Corresponds to the Real-Time Payments reason code `DS24`.
          TIMEOUT =
            T.let(
              :timeout,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments transfers are not enabled for the destination account. Corresponds to the Real-Time Payments reason code `NOAT`.
          UNSUPPORTED_MESSAGE_FOR_RECIPIENT =
            T.let(
              :unsupported_message_for_recipient,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination financial institution is currently not connected to Real-Time Payments. Corresponds to the Real-Time Payments reason code `9912`.
          RECIPIENT_CONNECTION_NOT_AVAILABLE =
            T.let(
              :recipient_connection_not_available,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Real-Time Payments is currently unavailable. Corresponds to the Real-Time Payments reason code `9948`.
          REAL_TIME_PAYMENTS_SUSPENDED =
            T.let(
              :real_time_payments_suspended,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination financial institution is currently signed off of Real-Time Payments. Corresponds to the Real-Time Payments reason code `9910`.
          INSTRUCTED_AGENT_SIGNED_OFF =
            T.let(
              :instructed_agent_signed_off,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The transfer was rejected due to an internal Increase issue. We have been notified.
          PROCESSING_ERROR =
            T.let(
              :processing_error,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Some other error or issue has occurred.
          OTHER =
            T.let(
              :other,
              Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimePaymentsTransfer::Rejection::RejectReasonCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::RealTimePaymentsTransfer::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending approval.
        PENDING_APPROVAL =
          T.let(
            :pending_approval,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer has been canceled.
        CANCELED =
          T.let(
            :canceled,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer is pending review by Increase.
        PENDING_REVIEWING =
          T.let(
            :pending_reviewing,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer was rejected by the network or the recipient's bank.
        REJECTED =
          T.let(
            :rejected,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer is queued to be submitted to Real-Time Payments.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer has been submitted and is pending a response from Real-Time Payments.
        SUBMITTED =
          T.let(
            :submitted,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        # The transfer has been sent successfully and is complete.
        COMPLETE =
          T.let(
            :complete,
            Increase::RealTimePaymentsTransfer::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::RealTimePaymentsTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimePaymentsTransfer::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was submitted to The Clearing House.
        sig { returns(T.nilable(Time)) }
        attr_accessor :submitted_at

        # The Real-Time Payments network identification of the transfer.
        sig { returns(String) }
        attr_accessor :transaction_identification

        # After the transfer is submitted to Real-Time Payments, this will contain
        # supplemental details.
        sig do
          params(
            submitted_at: T.nilable(Time),
            transaction_identification: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was submitted to The Clearing House.
          submitted_at:,
          # The Real-Time Payments network identification of the transfer.
          transaction_identification:
        )
        end

        sig do
          override.returns(
            {
              submitted_at: T.nilable(Time),
              transaction_identification: String
            }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `real_time_payments_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::RealTimePaymentsTransfer::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REAL_TIME_PAYMENTS_TRANSFER =
          T.let(
            :real_time_payments_transfer,
            Increase::RealTimePaymentsTransfer::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::RealTimePaymentsTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
