# typed: strong

module Increase
  module Models
    class FednowTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::FednowTransfer, Increase::Internal::AnyHash)
        end

      # The FedNow Transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account from which the transfer was sent.
      sig { returns(String) }
      attr_accessor :account_id

      # The destination account number.
      sig { returns(String) }
      attr_accessor :account_number

      # If the transfer is acknowledged by the recipient bank, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::FednowTransfer::Acknowledgement)) }
      attr_reader :acknowledgement

      sig do
        params(
          acknowledgement:
            T.nilable(Increase::FednowTransfer::Acknowledgement::OrHash)
        ).void
      end
      attr_writer :acknowledgement

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::FednowTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(Increase::FednowTransfer::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # The name of the transfer's recipient. This is set by the sender when creating
      # the transfer.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For FedNow transfers this is always equal to `USD`.
      sig { returns(Increase::FednowTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The name of the transfer's sender. If not provided, defaults to the name of the
      # account's entity.
      sig { returns(String) }
      attr_accessor :debtor_name

      # The identifier of the External Account the transfer was made to, if any.
      sig { returns(T.nilable(String)) }
      attr_accessor :external_account_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The ID for the pending transaction representing the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # If the transfer is rejected by FedNow or the destination financial institution,
      # this will contain supplemental details.
      sig { returns(T.nilable(Increase::FednowTransfer::Rejection)) }
      attr_reader :rejection

      sig do
        params(
          rejection: T.nilable(Increase::FednowTransfer::Rejection::OrHash)
        ).void
      end
      attr_writer :rejection

      # The destination American Bankers' Association (ABA) Routing Transit Number
      # (RTN).
      sig { returns(String) }
      attr_accessor :routing_number

      # The Account Number the recipient will see as having sent the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::FednowTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # After the transfer is submitted to FedNow, this will contain supplemental
      # details.
      sig { returns(T.nilable(Increase::FednowTransfer::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission: T.nilable(Increase::FednowTransfer::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # The Transaction funding the transfer once it is complete.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `fednow_transfer`.
      sig { returns(Increase::FednowTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # The Unique End-to-end Transaction Reference
      # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      # of the transfer.
      sig { returns(String) }
      attr_accessor :unique_end_to_end_transaction_reference

      # Unstructured information that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # FedNow transfers move funds, within seconds, between your Increase account and
      # any other account supporting FedNow.
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          acknowledgement:
            T.nilable(Increase::FednowTransfer::Acknowledgement::OrHash),
          amount: Integer,
          created_at: Time,
          created_by: T.nilable(Increase::FednowTransfer::CreatedBy::OrHash),
          creditor_name: String,
          currency: Increase::FednowTransfer::Currency::OrSymbol,
          debtor_name: String,
          external_account_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          pending_transaction_id: T.nilable(String),
          rejection: T.nilable(Increase::FednowTransfer::Rejection::OrHash),
          routing_number: String,
          source_account_number_id: String,
          status: Increase::FednowTransfer::Status::OrSymbol,
          submission: T.nilable(Increase::FednowTransfer::Submission::OrHash),
          transaction_id: T.nilable(String),
          type: Increase::FednowTransfer::Type::OrSymbol,
          unique_end_to_end_transaction_reference: String,
          unstructured_remittance_information: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The FedNow Transfer's identifier.
        id:,
        # The Account from which the transfer was sent.
        account_id:,
        # The destination account number.
        account_number:,
        # If the transfer is acknowledged by the recipient bank, this will contain
        # supplemental details.
        acknowledgement:,
        # The transfer amount in USD cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # What object created the transfer, either via the API or the dashboard.
        created_by:,
        # The name of the transfer's recipient. This is set by the sender when creating
        # the transfer.
        creditor_name:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
        # currency. For FedNow transfers this is always equal to `USD`.
        currency:,
        # The name of the transfer's sender. If not provided, defaults to the name of the
        # account's entity.
        debtor_name:,
        # The identifier of the External Account the transfer was made to, if any.
        external_account_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The ID for the pending transaction representing the transfer.
        pending_transaction_id:,
        # If the transfer is rejected by FedNow or the destination financial institution,
        # this will contain supplemental details.
        rejection:,
        # The destination American Bankers' Association (ABA) Routing Transit Number
        # (RTN).
        routing_number:,
        # The Account Number the recipient will see as having sent the transfer.
        source_account_number_id:,
        # The lifecycle status of the transfer.
        status:,
        # After the transfer is submitted to FedNow, this will contain supplemental
        # details.
        submission:,
        # The Transaction funding the transfer once it is complete.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `fednow_transfer`.
        type:,
        # The Unique End-to-end Transaction Reference
        # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
        # of the transfer.
        unique_end_to_end_transaction_reference:,
        # Unstructured information that will show on the recipient's bank statement.
        unstructured_remittance_information:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number: String,
            acknowledgement:
              T.nilable(Increase::FednowTransfer::Acknowledgement),
            amount: Integer,
            created_at: Time,
            created_by: T.nilable(Increase::FednowTransfer::CreatedBy),
            creditor_name: String,
            currency: Increase::FednowTransfer::Currency::TaggedSymbol,
            debtor_name: String,
            external_account_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            pending_transaction_id: T.nilable(String),
            rejection: T.nilable(Increase::FednowTransfer::Rejection),
            routing_number: String,
            source_account_number_id: String,
            status: Increase::FednowTransfer::Status::TaggedSymbol,
            submission: T.nilable(Increase::FednowTransfer::Submission),
            transaction_id: T.nilable(String),
            type: Increase::FednowTransfer::Type::TaggedSymbol,
            unique_end_to_end_transaction_reference: String,
            unstructured_remittance_information: String
          }
        )
      end
      def to_hash
      end

      class Acknowledgement < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FednowTransfer::Acknowledgement,
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

      class CreatedBy < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FednowTransfer::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::FednowTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(Increase::FednowTransfer::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # The type of object that created this transfer.
        sig do
          returns(Increase::FednowTransfer::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(Increase::FednowTransfer::CreatedBy::OAuthApplication)
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::FednowTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::FednowTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::FednowTransfer::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            api_key:
              T.nilable(Increase::FednowTransfer::CreatedBy::APIKey::OrHash),
            category: Increase::FednowTransfer::CreatedBy::Category::OrSymbol,
            oauth_application:
              T.nilable(
                Increase::FednowTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::FednowTransfer::CreatedBy::User::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # If present, details about the API key that created the transfer.
          api_key:,
          # The type of object that created this transfer.
          category:,
          # If present, details about the OAuth Application that created the transfer.
          oauth_application:,
          # If present, details about the User that created the transfer.
          user:
        )
        end

        sig do
          override.returns(
            {
              api_key: T.nilable(Increase::FednowTransfer::CreatedBy::APIKey),
              category:
                Increase::FednowTransfer::CreatedBy::Category::TaggedSymbol,
              oauth_application:
                T.nilable(
                  Increase::FednowTransfer::CreatedBy::OAuthApplication
                ),
              user: T.nilable(Increase::FednowTransfer::CreatedBy::User)
            }
          )
        end
        def to_hash
        end

        class APIKey < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::FednowTransfer::CreatedBy::APIKey,
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

        # The type of object that created this transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::FednowTransfer::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::FednowTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::FednowTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::FednowTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::FednowTransfer::CreatedBy::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class OAuthApplication < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::FednowTransfer::CreatedBy::OAuthApplication,
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
                Increase::FednowTransfer::CreatedBy::User,
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
      # currency. For FedNow transfers this is always equal to `USD`.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::FednowTransfer::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::FednowTransfer::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::FednowTransfer::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::FednowTransfer::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::FednowTransfer::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::FednowTransfer::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::FednowTransfer::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::FednowTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Rejection < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FednowTransfer::Rejection,
              Increase::Internal::AnyHash
            )
          end

        # Additional information about the rejection provided by the recipient bank.
        sig { returns(T.nilable(String)) }
        attr_accessor :reject_reason_additional_information

        # The reason the transfer was rejected as provided by the recipient bank or the
        # FedNow network.
        sig do
          returns(
            Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
          )
        end
        attr_accessor :reject_reason_code

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was rejected.
        sig { returns(T.nilable(Time)) }
        attr_accessor :rejected_at

        # If the transfer is rejected by FedNow or the destination financial institution,
        # this will contain supplemental details.
        sig do
          params(
            reject_reason_additional_information: T.nilable(String),
            reject_reason_code:
              Increase::FednowTransfer::Rejection::RejectReasonCode::OrSymbol,
            rejected_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional information about the rejection provided by the recipient bank.
          reject_reason_additional_information:,
          # The reason the transfer was rejected as provided by the recipient bank or the
          # FedNow network.
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
                Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol,
              rejected_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        # The reason the transfer was rejected as provided by the recipient bank or the
        # FedNow network.
        module RejectReasonCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::FednowTransfer::Rejection::RejectReasonCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The destination account is closed. Corresponds to the FedNow reason code `AC04`.
          ACCOUNT_CLOSED =
            T.let(
              :account_closed,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account is currently blocked from receiving transactions. Corresponds to the FedNow reason code `AC06`.
          ACCOUNT_BLOCKED =
            T.let(
              :account_blocked,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account is ineligible to receive FedNow transfers. Corresponds to the FedNow reason code `AC14`.
          INVALID_CREDITOR_ACCOUNT_TYPE =
            T.let(
              :invalid_creditor_account_type,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account does not exist. Corresponds to the FedNow reason code `AC03`.
          INVALID_CREDITOR_ACCOUNT_NUMBER =
            T.let(
              :invalid_creditor_account_number,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination routing number is invalid. Corresponds to the FedNow reason code `RC04`.
          INVALID_CREDITOR_FINANCIAL_INSTITUTION_IDENTIFIER =
            T.let(
              :invalid_creditor_financial_institution_identifier,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The destination account holder is deceased. Corresponds to the FedNow reason code `MD07`.
          END_CUSTOMER_DECEASED =
            T.let(
              :end_customer_deceased,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The reason is provided as narrative information in the additional information field. Corresponds to the FedNow reason code `NARR`.
          NARRATIVE =
            T.let(
              :narrative,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # FedNow transfers are not allowed to the destination account. Corresponds to the FedNow reason code `AG01`.
          TRANSACTION_FORBIDDEN =
            T.let(
              :transaction_forbidden,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # FedNow transfers are not enabled for the destination account. Corresponds to the FedNow reason code `AG03`.
          TRANSACTION_TYPE_NOT_SUPPORTED =
            T.let(
              :transaction_type_not_supported,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The amount is higher than the recipient is authorized to send or receive. Corresponds to the FedNow reason code `E990`.
          AMOUNT_EXCEEDS_BANK_LIMITS =
            T.let(
              :amount_exceeds_bank_limits,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The creditor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE04`.
          INVALID_CREDITOR_ADDRESS =
            T.let(
              :invalid_creditor_address,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The debtor's address is required, but missing or invalid. Corresponds to the FedNow reason code `BE07`.
          INVALID_DEBTOR_ADDRESS =
            T.let(
              :invalid_debtor_address,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # There was a timeout processing the transfer. Corresponds to the FedNow reason code `E997`.
          TIMEOUT =
            T.let(
              :timeout,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # The transfer was rejected due to an internal Increase issue. We have been notified.
          PROCESSING_ERROR =
            T.let(
              :processing_error,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          # Some other error or issue has occurred.
          OTHER =
            T.let(
              :other,
              Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::FednowTransfer::Rejection::RejectReasonCode::TaggedSymbol
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
          T.type_alias { T.all(Symbol, Increase::FednowTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending review by Increase.
        PENDING_REVIEWING =
          T.let(
            :pending_reviewing,
            Increase::FednowTransfer::Status::TaggedSymbol
          )

        # The transfer has been canceled.
        CANCELED =
          T.let(:canceled, Increase::FednowTransfer::Status::TaggedSymbol)

        # The transfer has been rejected by Increase.
        REVIEWING_REJECTED =
          T.let(
            :reviewing_rejected,
            Increase::FednowTransfer::Status::TaggedSymbol
          )

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::FednowTransfer::Status::TaggedSymbol
          )

        # The transfer is pending approval.
        PENDING_APPROVAL =
          T.let(
            :pending_approval,
            Increase::FednowTransfer::Status::TaggedSymbol
          )

        # The transfer is queued to be submitted to FedNow.
        PENDING_SUBMITTING =
          T.let(
            :pending_submitting,
            Increase::FednowTransfer::Status::TaggedSymbol
          )

        # The transfer has been submitted and is pending a response from FedNow.
        PENDING_RESPONSE =
          T.let(
            :pending_response,
            Increase::FednowTransfer::Status::TaggedSymbol
          )

        # The transfer has been sent successfully and is complete.
        COMPLETE =
          T.let(:complete, Increase::FednowTransfer::Status::TaggedSymbol)

        # The transfer was rejected by the network or the recipient's bank.
        REJECTED =
          T.let(:rejected, Increase::FednowTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::FednowTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::FednowTransfer::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The FedNow network identification of the message submitted.
        sig { returns(String) }
        attr_accessor :message_identification

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was submitted to FedNow.
        sig { returns(T.nilable(Time)) }
        attr_accessor :submitted_at

        # After the transfer is submitted to FedNow, this will contain supplemental
        # details.
        sig do
          params(
            message_identification: String,
            submitted_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # The FedNow network identification of the message submitted.
          message_identification:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was submitted to FedNow.
          submitted_at:
        )
        end

        sig do
          override.returns(
            { message_identification: String, submitted_at: T.nilable(Time) }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `fednow_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::FednowTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEDNOW_TRANSFER =
          T.let(:fednow_transfer, Increase::FednowTransfer::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::FednowTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
