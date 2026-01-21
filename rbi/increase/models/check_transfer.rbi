# typed: strong

module Increase
  module Models
    class CheckTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CheckTransfer, Increase::Internal::AnyHash)
        end

      # The Check transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the Account from which funds will be transferred.
      sig { returns(String) }
      attr_accessor :account_id

      # The account number printed on the check.
      sig { returns(String) }
      attr_accessor :account_number

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your account requires approvals for transfers and the transfer was approved,
      # this will contain details of the approval.
      sig { returns(T.nilable(Increase::CheckTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(
          approval: T.nilable(Increase::CheckTransfer::Approval::OrHash)
        ).void
      end
      attr_writer :approval

      # If the Check Transfer was successfully deposited, this will contain the
      # identifier of the Inbound Check Deposit object with details of the deposit.
      sig { returns(T.nilable(String)) }
      attr_accessor :approved_inbound_check_deposit_id

      # How the account's available balance should be checked.
      sig do
        returns(T.nilable(Increase::CheckTransfer::BalanceCheck::TaggedSymbol))
      end
      attr_accessor :balance_check

      # If your account requires approvals for transfers and the transfer was not
      # approved, this will contain details of the cancellation.
      sig { returns(T.nilable(Increase::CheckTransfer::Cancellation)) }
      attr_reader :cancellation

      sig do
        params(
          cancellation: T.nilable(Increase::CheckTransfer::Cancellation::OrHash)
        ).void
      end
      attr_writer :cancellation

      # The check number printed on the check.
      sig { returns(String) }
      attr_accessor :check_number

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::CheckTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(Increase::CheckTransfer::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
      # currency.
      sig { returns(Increase::CheckTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # Whether Increase will print and mail the check or if you will do it yourself.
      sig { returns(Increase::CheckTransfer::FulfillmentMethod::TaggedSymbol) }
      attr_accessor :fulfillment_method

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # If the check has been mailed by Increase, this will contain details of the
      # shipment.
      sig { returns(T.nilable(Increase::CheckTransfer::Mailing)) }
      attr_reader :mailing

      sig do
        params(
          mailing: T.nilable(Increase::CheckTransfer::Mailing::OrHash)
        ).void
      end
      attr_writer :mailing

      # The ID for the pending transaction representing the transfer. A pending
      # transaction is created when the transfer
      # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      # by someone else in your organization.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # Details relating to the physical check that Increase will print and mail. Will
      # be present if and only if `fulfillment_method` is equal to `physical_check`.
      sig { returns(T.nilable(Increase::CheckTransfer::PhysicalCheck)) }
      attr_reader :physical_check

      sig do
        params(
          physical_check:
            T.nilable(Increase::CheckTransfer::PhysicalCheck::OrHash)
        ).void
      end
      attr_writer :physical_check

      # The routing number printed on the check.
      sig { returns(String) }
      attr_accessor :routing_number

      # The identifier of the Account Number from which to send the transfer and print
      # on the check.
      sig { returns(T.nilable(String)) }
      attr_accessor :source_account_number_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::CheckTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # After a stop-payment is requested on the check, this will contain supplemental
      # details.
      sig { returns(T.nilable(Increase::CheckTransfer::StopPaymentRequest)) }
      attr_reader :stop_payment_request

      sig do
        params(
          stop_payment_request:
            T.nilable(Increase::CheckTransfer::StopPaymentRequest::OrHash)
        ).void
      end
      attr_writer :stop_payment_request

      # After the transfer is submitted, this will contain supplemental details.
      sig { returns(T.nilable(Increase::CheckTransfer::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission: T.nilable(Increase::CheckTransfer::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # Details relating to the custom fulfillment you will perform. Will be present if
      # and only if `fulfillment_method` is equal to `third_party`.
      sig { returns(T.nilable(Increase::CheckTransfer::ThirdParty)) }
      attr_reader :third_party

      sig do
        params(
          third_party: T.nilable(Increase::CheckTransfer::ThirdParty::OrHash)
        ).void
      end
      attr_writer :third_party

      # A constant representing the object's type. For this resource it will always be
      # `check_transfer`.
      sig { returns(Increase::CheckTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # If set, the check will be valid on or before this date. After this date, the
      # check transfer will be automatically stopped and deposits will not be accepted.
      # For checks printed by Increase, this date is included on the check as its
      # expiry.
      sig { returns(T.nilable(Date)) }
      attr_accessor :valid_until_date

      # Check Transfers move funds from your Increase account by mailing a physical
      # check.
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          amount: Integer,
          approval: T.nilable(Increase::CheckTransfer::Approval::OrHash),
          approved_inbound_check_deposit_id: T.nilable(String),
          balance_check:
            T.nilable(Increase::CheckTransfer::BalanceCheck::OrSymbol),
          cancellation:
            T.nilable(Increase::CheckTransfer::Cancellation::OrHash),
          check_number: String,
          created_at: Time,
          created_by: T.nilable(Increase::CheckTransfer::CreatedBy::OrHash),
          currency: Increase::CheckTransfer::Currency::OrSymbol,
          fulfillment_method:
            Increase::CheckTransfer::FulfillmentMethod::OrSymbol,
          idempotency_key: T.nilable(String),
          mailing: T.nilable(Increase::CheckTransfer::Mailing::OrHash),
          pending_transaction_id: T.nilable(String),
          physical_check:
            T.nilable(Increase::CheckTransfer::PhysicalCheck::OrHash),
          routing_number: String,
          source_account_number_id: T.nilable(String),
          status: Increase::CheckTransfer::Status::OrSymbol,
          stop_payment_request:
            T.nilable(Increase::CheckTransfer::StopPaymentRequest::OrHash),
          submission: T.nilable(Increase::CheckTransfer::Submission::OrHash),
          third_party: T.nilable(Increase::CheckTransfer::ThirdParty::OrHash),
          type: Increase::CheckTransfer::Type::OrSymbol,
          valid_until_date: T.nilable(Date)
        ).returns(T.attached_class)
      end
      def self.new(
        # The Check transfer's identifier.
        id:,
        # The identifier of the Account from which funds will be transferred.
        account_id:,
        # The account number printed on the check.
        account_number:,
        # The transfer amount in USD cents.
        amount:,
        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        approval:,
        # If the Check Transfer was successfully deposited, this will contain the
        # identifier of the Inbound Check Deposit object with details of the deposit.
        approved_inbound_check_deposit_id:,
        # How the account's available balance should be checked.
        balance_check:,
        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        cancellation:,
        # The check number printed on the check.
        check_number:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # What object created the transfer, either via the API or the dashboard.
        created_by:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
        # currency.
        currency:,
        # Whether Increase will print and mail the check or if you will do it yourself.
        fulfillment_method:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # If the check has been mailed by Increase, this will contain details of the
        # shipment.
        mailing:,
        # The ID for the pending transaction representing the transfer. A pending
        # transaction is created when the transfer
        # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
        # by someone else in your organization.
        pending_transaction_id:,
        # Details relating to the physical check that Increase will print and mail. Will
        # be present if and only if `fulfillment_method` is equal to `physical_check`.
        physical_check:,
        # The routing number printed on the check.
        routing_number:,
        # The identifier of the Account Number from which to send the transfer and print
        # on the check.
        source_account_number_id:,
        # The lifecycle status of the transfer.
        status:,
        # After a stop-payment is requested on the check, this will contain supplemental
        # details.
        stop_payment_request:,
        # After the transfer is submitted, this will contain supplemental details.
        submission:,
        # Details relating to the custom fulfillment you will perform. Will be present if
        # and only if `fulfillment_method` is equal to `third_party`.
        third_party:,
        # A constant representing the object's type. For this resource it will always be
        # `check_transfer`.
        type:,
        # If set, the check will be valid on or before this date. After this date, the
        # check transfer will be automatically stopped and deposits will not be accepted.
        # For checks printed by Increase, this date is included on the check as its
        # expiry.
        valid_until_date:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number: String,
            amount: Integer,
            approval: T.nilable(Increase::CheckTransfer::Approval),
            approved_inbound_check_deposit_id: T.nilable(String),
            balance_check:
              T.nilable(Increase::CheckTransfer::BalanceCheck::TaggedSymbol),
            cancellation: T.nilable(Increase::CheckTransfer::Cancellation),
            check_number: String,
            created_at: Time,
            created_by: T.nilable(Increase::CheckTransfer::CreatedBy),
            currency: Increase::CheckTransfer::Currency::TaggedSymbol,
            fulfillment_method:
              Increase::CheckTransfer::FulfillmentMethod::TaggedSymbol,
            idempotency_key: T.nilable(String),
            mailing: T.nilable(Increase::CheckTransfer::Mailing),
            pending_transaction_id: T.nilable(String),
            physical_check: T.nilable(Increase::CheckTransfer::PhysicalCheck),
            routing_number: String,
            source_account_number_id: T.nilable(String),
            status: Increase::CheckTransfer::Status::TaggedSymbol,
            stop_payment_request:
              T.nilable(Increase::CheckTransfer::StopPaymentRequest),
            submission: T.nilable(Increase::CheckTransfer::Submission),
            third_party: T.nilable(Increase::CheckTransfer::ThirdParty),
            type: Increase::CheckTransfer::Type::TaggedSymbol,
            valid_until_date: T.nilable(Date)
          }
        )
      end
      def to_hash
      end

      class Approval < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransfer::Approval,
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

      # How the account's available balance should be checked.
      module BalanceCheck
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckTransfer::BalanceCheck) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The available balance of the account must be at least the amount of the check, and a Pending Transaction will be created for the full amount. This is the default behavior if `balance_check` is omitted.
        FULL = T.let(:full, Increase::CheckTransfer::BalanceCheck::TaggedSymbol)

        # No balance check will performed when the check transfer is initiated. A zero-dollar Pending Transaction will be created. The balance will still be checked when the Inbound Check Deposit is created.
        NONE = T.let(:none, Increase::CheckTransfer::BalanceCheck::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CheckTransfer::BalanceCheck::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransfer::Cancellation,
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
              Increase::CheckTransfer::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::CheckTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(Increase::CheckTransfer::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # The type of object that created this transfer.
        sig do
          returns(Increase::CheckTransfer::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(Increase::CheckTransfer::CreatedBy::OAuthApplication)
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::CheckTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::CheckTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::CheckTransfer::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            api_key:
              T.nilable(Increase::CheckTransfer::CreatedBy::APIKey::OrHash),
            category: Increase::CheckTransfer::CreatedBy::Category::OrSymbol,
            oauth_application:
              T.nilable(
                Increase::CheckTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::CheckTransfer::CreatedBy::User::OrHash)
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
              api_key: T.nilable(Increase::CheckTransfer::CreatedBy::APIKey),
              category:
                Increase::CheckTransfer::CreatedBy::Category::TaggedSymbol,
              oauth_application:
                T.nilable(Increase::CheckTransfer::CreatedBy::OAuthApplication),
              user: T.nilable(Increase::CheckTransfer::CreatedBy::User)
            }
          )
        end
        def to_hash
        end

        class APIKey < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransfer::CreatedBy::APIKey,
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
              T.all(Symbol, Increase::CheckTransfer::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::CheckTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::CheckTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::CheckTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckTransfer::CreatedBy::Category::TaggedSymbol
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
                Increase::CheckTransfer::CreatedBy::OAuthApplication,
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
                Increase::CheckTransfer::CreatedBy::User,
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

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
      # currency.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckTransfer::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD = T.let(:USD, Increase::CheckTransfer::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CheckTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Whether Increase will print and mail the check or if you will do it yourself.
      module FulfillmentMethod
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::CheckTransfer::FulfillmentMethod)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Increase will print and mail a physical check.
        PHYSICAL_CHECK =
          T.let(
            :physical_check,
            Increase::CheckTransfer::FulfillmentMethod::TaggedSymbol
          )

        # Increase will not print a check; you are responsible for printing and mailing a check with the provided account number, routing number, check number, and amount.
        THIRD_PARTY =
          T.let(
            :third_party,
            Increase::CheckTransfer::FulfillmentMethod::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::CheckTransfer::FulfillmentMethod::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Mailing < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::CheckTransfer::Mailing, Increase::Internal::AnyHash)
          end

        # The ID of the file corresponding to an image of the check that was mailed, if
        # available.
        sig { returns(T.nilable(String)) }
        attr_accessor :image_id

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the check was mailed.
        sig { returns(Time) }
        attr_accessor :mailed_at

        # The tracking number of the shipment, if available for the shipping method.
        sig { returns(T.nilable(String)) }
        attr_accessor :tracking_number

        # If the check has been mailed by Increase, this will contain details of the
        # shipment.
        sig do
          params(
            image_id: T.nilable(String),
            mailed_at: Time,
            tracking_number: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the file corresponding to an image of the check that was mailed, if
          # available.
          image_id:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the check was mailed.
          mailed_at:,
          # The tracking number of the shipment, if available for the shipping method.
          tracking_number:
        )
        end

        sig do
          override.returns(
            {
              image_id: T.nilable(String),
              mailed_at: Time,
              tracking_number: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class PhysicalCheck < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransfer::PhysicalCheck,
              Increase::Internal::AnyHash
            )
          end

        # The ID of the file for the check attachment.
        sig { returns(T.nilable(String)) }
        attr_accessor :attachment_file_id

        # The ID of the file for the check voucher image.
        sig { returns(T.nilable(String)) }
        attr_accessor :check_voucher_image_file_id

        # Details for where Increase will mail the check.
        sig { returns(Increase::CheckTransfer::PhysicalCheck::MailingAddress) }
        attr_reader :mailing_address

        sig do
          params(
            mailing_address:
              Increase::CheckTransfer::PhysicalCheck::MailingAddress::OrHash
          ).void
        end
        attr_writer :mailing_address

        # The descriptor that will be printed on the memo field on the check.
        sig { returns(T.nilable(String)) }
        attr_accessor :memo

        # The descriptor that will be printed on the letter included with the check.
        sig { returns(T.nilable(String)) }
        attr_accessor :note

        # The payer of the check. This will be printed on the top-left portion of the
        # check and defaults to the return address if unspecified.
        sig { returns(T::Array[Increase::CheckTransfer::PhysicalCheck::Payer]) }
        attr_accessor :payer

        # The name that will be printed on the check.
        sig { returns(String) }
        attr_accessor :recipient_name

        # The return address to be printed on the check.
        sig do
          returns(
            T.nilable(Increase::CheckTransfer::PhysicalCheck::ReturnAddress)
          )
        end
        attr_reader :return_address

        sig do
          params(
            return_address:
              T.nilable(
                Increase::CheckTransfer::PhysicalCheck::ReturnAddress::OrHash
              )
          ).void
        end
        attr_writer :return_address

        # The shipping method for the check.
        sig do
          returns(
            T.nilable(
              Increase::CheckTransfer::PhysicalCheck::ShippingMethod::TaggedSymbol
            )
          )
        end
        attr_accessor :shipping_method

        # The text that will appear as the signature on the check in cursive font. If
        # blank, the check will be printed with 'No signature required'.
        sig { returns(T.nilable(String)) }
        attr_accessor :signature_text

        # Tracking updates relating to the physical check's delivery.
        sig do
          returns(
            T::Array[Increase::CheckTransfer::PhysicalCheck::TrackingUpdate]
          )
        end
        attr_accessor :tracking_updates

        # Details relating to the physical check that Increase will print and mail. Will
        # be present if and only if `fulfillment_method` is equal to `physical_check`.
        sig do
          params(
            attachment_file_id: T.nilable(String),
            check_voucher_image_file_id: T.nilable(String),
            mailing_address:
              Increase::CheckTransfer::PhysicalCheck::MailingAddress::OrHash,
            memo: T.nilable(String),
            note: T.nilable(String),
            payer:
              T::Array[Increase::CheckTransfer::PhysicalCheck::Payer::OrHash],
            recipient_name: String,
            return_address:
              T.nilable(
                Increase::CheckTransfer::PhysicalCheck::ReturnAddress::OrHash
              ),
            shipping_method:
              T.nilable(
                Increase::CheckTransfer::PhysicalCheck::ShippingMethod::OrSymbol
              ),
            signature_text: T.nilable(String),
            tracking_updates:
              T::Array[
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the file for the check attachment.
          attachment_file_id:,
          # The ID of the file for the check voucher image.
          check_voucher_image_file_id:,
          # Details for where Increase will mail the check.
          mailing_address:,
          # The descriptor that will be printed on the memo field on the check.
          memo:,
          # The descriptor that will be printed on the letter included with the check.
          note:,
          # The payer of the check. This will be printed on the top-left portion of the
          # check and defaults to the return address if unspecified.
          payer:,
          # The name that will be printed on the check.
          recipient_name:,
          # The return address to be printed on the check.
          return_address:,
          # The shipping method for the check.
          shipping_method:,
          # The text that will appear as the signature on the check in cursive font. If
          # blank, the check will be printed with 'No signature required'.
          signature_text:,
          # Tracking updates relating to the physical check's delivery.
          tracking_updates:
        )
        end

        sig do
          override.returns(
            {
              attachment_file_id: T.nilable(String),
              check_voucher_image_file_id: T.nilable(String),
              mailing_address:
                Increase::CheckTransfer::PhysicalCheck::MailingAddress,
              memo: T.nilable(String),
              note: T.nilable(String),
              payer: T::Array[Increase::CheckTransfer::PhysicalCheck::Payer],
              recipient_name: String,
              return_address:
                T.nilable(
                  Increase::CheckTransfer::PhysicalCheck::ReturnAddress
                ),
              shipping_method:
                T.nilable(
                  Increase::CheckTransfer::PhysicalCheck::ShippingMethod::TaggedSymbol
                ),
              signature_text: T.nilable(String),
              tracking_updates:
                T::Array[Increase::CheckTransfer::PhysicalCheck::TrackingUpdate]
            }
          )
        end
        def to_hash
        end

        class MailingAddress < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransfer::PhysicalCheck::MailingAddress,
                Increase::Internal::AnyHash
              )
            end

          # The city of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :city

          # The street address of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :line1

          # The second line of the address of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The name component of the check's mailing address.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # The phone number to be used in case of delivery issues at the check's mailing
          # address. Only used for FedEx overnight shipping.
          sig { returns(T.nilable(String)) }
          attr_accessor :phone

          # The postal code of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :postal_code

          # The state of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :state

          # Details for where Increase will mail the check.
          sig do
            params(
              city: T.nilable(String),
              line1: T.nilable(String),
              line2: T.nilable(String),
              name: T.nilable(String),
              phone: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the check's destination.
            city:,
            # The street address of the check's destination.
            line1:,
            # The second line of the address of the check's destination.
            line2:,
            # The name component of the check's mailing address.
            name:,
            # The phone number to be used in case of delivery issues at the check's mailing
            # address. Only used for FedEx overnight shipping.
            phone:,
            # The postal code of the check's destination.
            postal_code:,
            # The state of the check's destination.
            state:
          )
          end

          sig do
            override.returns(
              {
                city: T.nilable(String),
                line1: T.nilable(String),
                line2: T.nilable(String),
                name: T.nilable(String),
                phone: T.nilable(String),
                postal_code: T.nilable(String),
                state: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class Payer < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransfer::PhysicalCheck::Payer,
                Increase::Internal::AnyHash
              )
            end

          # The contents of the line.
          sig { returns(String) }
          attr_accessor :contents

          sig { params(contents: String).returns(T.attached_class) }
          def self.new(
            # The contents of the line.
            contents:
          )
          end

          sig { override.returns({ contents: String }) }
          def to_hash
          end
        end

        class ReturnAddress < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransfer::PhysicalCheck::ReturnAddress,
                Increase::Internal::AnyHash
              )
            end

          # The city of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :city

          # The street address of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :line1

          # The second line of the address of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The name component of the check's return address.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # The shipper's phone number to be used in case of delivery issues. Only used for
          # FedEx overnight shipping.
          sig { returns(T.nilable(String)) }
          attr_accessor :phone

          # The postal code of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :postal_code

          # The state of the check's destination.
          sig { returns(T.nilable(String)) }
          attr_accessor :state

          # The return address to be printed on the check.
          sig do
            params(
              city: T.nilable(String),
              line1: T.nilable(String),
              line2: T.nilable(String),
              name: T.nilable(String),
              phone: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the check's destination.
            city:,
            # The street address of the check's destination.
            line1:,
            # The second line of the address of the check's destination.
            line2:,
            # The name component of the check's return address.
            name:,
            # The shipper's phone number to be used in case of delivery issues. Only used for
            # FedEx overnight shipping.
            phone:,
            # The postal code of the check's destination.
            postal_code:,
            # The state of the check's destination.
            state:
          )
          end

          sig do
            override.returns(
              {
                city: T.nilable(String),
                line1: T.nilable(String),
                line2: T.nilable(String),
                name: T.nilable(String),
                phone: T.nilable(String),
                postal_code: T.nilable(String),
                state: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        # The shipping method for the check.
        module ShippingMethod
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CheckTransfer::PhysicalCheck::ShippingMethod
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # USPS First Class
          USPS_FIRST_CLASS =
            T.let(
              :usps_first_class,
              Increase::CheckTransfer::PhysicalCheck::ShippingMethod::TaggedSymbol
            )

          # FedEx Overnight
          FEDEX_OVERNIGHT =
            T.let(
              :fedex_overnight,
              Increase::CheckTransfer::PhysicalCheck::ShippingMethod::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckTransfer::PhysicalCheck::ShippingMethod::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TrackingUpdate < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate,
                Increase::Internal::AnyHash
              )
            end

          # The type of tracking event.
          sig do
            returns(
              Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the tracking event took place.
          sig { returns(Time) }
          attr_accessor :created_at

          # The postal code where the event took place.
          sig { returns(String) }
          attr_accessor :postal_code

          sig do
            params(
              category:
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::OrSymbol,
              created_at: Time,
              postal_code: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The type of tracking event.
            category:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the tracking event took place.
            created_at:,
            # The postal code where the event took place.
            postal_code:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol,
                created_at: Time,
                postal_code: String
              }
            )
          end
          def to_hash
          end

          # The type of tracking event.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The check is in transit.
            IN_TRANSIT =
              T.let(
                :in_transit,
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol
              )

            # The check has been processed for delivery.
            PROCESSED_FOR_DELIVERY =
              T.let(
                :processed_for_delivery,
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol
              )

            # The check has been delivered.
            DELIVERED =
              T.let(
                :delivered,
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol
              )

            # There is an issue preventing delivery. The delivery will be attempted again if possible. If the issue cannot be resolved, the check will be returned to sender.
            DELIVERY_ISSUE =
              T.let(
                :delivery_issue,
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol
              )

            # Delivery failed and the check was returned to sender.
            RETURNED_TO_SENDER =
              T.let(
                :returned_to_sender,
                Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is awaiting approval.
        PENDING_APPROVAL =
          T.let(
            :pending_approval,
            Increase::CheckTransfer::Status::TaggedSymbol
          )

        # The transfer has been canceled.
        CANCELED =
          T.let(:canceled, Increase::CheckTransfer::Status::TaggedSymbol)

        # The transfer is pending submission.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::CheckTransfer::Status::TaggedSymbol
          )

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::CheckTransfer::Status::TaggedSymbol
          )

        # The transfer has been rejected.
        REJECTED =
          T.let(:rejected, Increase::CheckTransfer::Status::TaggedSymbol)

        # The check is queued for mailing.
        PENDING_MAILING =
          T.let(:pending_mailing, Increase::CheckTransfer::Status::TaggedSymbol)

        # The check has been mailed.
        MAILED = T.let(:mailed, Increase::CheckTransfer::Status::TaggedSymbol)

        # The check has been deposited.
        DEPOSITED =
          T.let(:deposited, Increase::CheckTransfer::Status::TaggedSymbol)

        # A stop-payment was requested for this check.
        STOPPED = T.let(:stopped, Increase::CheckTransfer::Status::TaggedSymbol)

        # The transfer has been returned.
        RETURNED =
          T.let(:returned, Increase::CheckTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CheckTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class StopPaymentRequest < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransfer::StopPaymentRequest,
              Increase::Internal::AnyHash
            )
          end

        # The reason why this transfer was stopped.
        sig do
          returns(
            Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # The time the stop-payment was requested.
        sig { returns(Time) }
        attr_accessor :requested_at

        # The ID of the check transfer that was stopped.
        sig { returns(String) }
        attr_accessor :transfer_id

        # A constant representing the object's type. For this resource it will always be
        # `check_transfer_stop_payment_request`.
        sig do
          returns(
            Increase::CheckTransfer::StopPaymentRequest::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # After a stop-payment is requested on the check, this will contain supplemental
        # details.
        sig do
          params(
            reason:
              Increase::CheckTransfer::StopPaymentRequest::Reason::OrSymbol,
            requested_at: Time,
            transfer_id: String,
            type: Increase::CheckTransfer::StopPaymentRequest::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The reason why this transfer was stopped.
          reason:,
          # The time the stop-payment was requested.
          requested_at:,
          # The ID of the check transfer that was stopped.
          transfer_id:,
          # A constant representing the object's type. For this resource it will always be
          # `check_transfer_stop_payment_request`.
          type:
        )
        end

        sig do
          override.returns(
            {
              reason:
                Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol,
              requested_at: Time,
              transfer_id: String,
              type:
                Increase::CheckTransfer::StopPaymentRequest::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason why this transfer was stopped.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckTransfer::StopPaymentRequest::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The check could not be delivered.
          MAIL_DELIVERY_FAILED =
            T.let(
              :mail_delivery_failed,
              Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol
            )

          # The check was canceled by an Increase operator who will provide details out-of-band.
          REJECTED_BY_INCREASE =
            T.let(
              :rejected_by_increase,
              Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol
            )

          # The check was not authorized.
          NOT_AUTHORIZED =
            T.let(
              :not_authorized,
              Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol
            )

          # The check was stopped for `valid_until_date` being in the past.
          VALID_UNTIL_DATE_PASSED =
            T.let(
              :valid_until_date_passed,
              Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol
            )

          # The check was stopped for another reason.
          UNKNOWN =
            T.let(
              :unknown,
              Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckTransfer::StopPaymentRequest::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # A constant representing the object's type. For this resource it will always be
        # `check_transfer_stop_payment_request`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CheckTransfer::StopPaymentRequest::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHECK_TRANSFER_STOP_PAYMENT_REQUEST =
            T.let(
              :check_transfer_stop_payment_request,
              Increase::CheckTransfer::StopPaymentRequest::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckTransfer::StopPaymentRequest::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransfer::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The address we submitted to the printer. This is what is physically printed on
        # the check.
        sig { returns(Increase::CheckTransfer::Submission::SubmittedAddress) }
        attr_reader :submitted_address

        sig do
          params(
            submitted_address:
              Increase::CheckTransfer::Submission::SubmittedAddress::OrHash
          ).void
        end
        attr_writer :submitted_address

        # When this check was submitted to our check printer.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # After the transfer is submitted, this will contain supplemental details.
        sig do
          params(
            submitted_address:
              Increase::CheckTransfer::Submission::SubmittedAddress::OrHash,
            submitted_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The address we submitted to the printer. This is what is physically printed on
          # the check.
          submitted_address:,
          # When this check was submitted to our check printer.
          submitted_at:
        )
        end

        sig do
          override.returns(
            {
              submitted_address:
                Increase::CheckTransfer::Submission::SubmittedAddress,
              submitted_at: Time
            }
          )
        end
        def to_hash
        end

        class SubmittedAddress < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransfer::Submission::SubmittedAddress,
                Increase::Internal::AnyHash
              )
            end

          # The submitted address city.
          sig { returns(String) }
          attr_accessor :city

          # The submitted address line 1.
          sig { returns(String) }
          attr_accessor :line1

          # The submitted address line 2.
          sig { returns(T.nilable(String)) }
          attr_accessor :line2

          # The submitted recipient name.
          sig { returns(String) }
          attr_accessor :recipient_name

          # The submitted address state.
          sig { returns(String) }
          attr_accessor :state

          # The submitted address zip.
          sig { returns(String) }
          attr_accessor :zip

          # The address we submitted to the printer. This is what is physically printed on
          # the check.
          sig do
            params(
              city: String,
              line1: String,
              line2: T.nilable(String),
              recipient_name: String,
              state: String,
              zip: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The submitted address city.
            city:,
            # The submitted address line 1.
            line1:,
            # The submitted address line 2.
            line2:,
            # The submitted recipient name.
            recipient_name:,
            # The submitted address state.
            state:,
            # The submitted address zip.
            zip:
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                line2: T.nilable(String),
                recipient_name: String,
                state: String,
                zip: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class ThirdParty < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransfer::ThirdParty,
              Increase::Internal::AnyHash
            )
          end

        # The name that you will print on the check.
        sig { returns(T.nilable(String)) }
        attr_accessor :recipient_name

        # Details relating to the custom fulfillment you will perform. Will be present if
        # and only if `fulfillment_method` is equal to `third_party`.
        sig do
          params(recipient_name: T.nilable(String)).returns(T.attached_class)
        end
        def self.new(
          # The name that you will print on the check.
          recipient_name:
        )
        end

        sig { override.returns({ recipient_name: T.nilable(String) }) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `check_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CheckTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CHECK_TRANSFER =
          T.let(:check_transfer, Increase::CheckTransfer::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CheckTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
