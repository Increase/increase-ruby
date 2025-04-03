# typed: strong

module Increase
  module Models
    class WireTransfer < Increase::Internal::Type::BaseModel
      # The wire transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account to which the transfer belongs.
      sig { returns(String) }
      attr_accessor :account_id

      # The destination account number.
      sig { returns(String) }
      attr_accessor :account_number

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your account requires approvals for transfers and the transfer was approved,
      #   this will contain details of the approval.
      sig { returns(T.nilable(Increase::Models::WireTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(approval: T.nilable(T.any(Increase::Models::WireTransfer::Approval, Increase::Internal::AnyHash)))
          .void
      end
      attr_writer :approval

      # The beneficiary's address line 1.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line1

      # The beneficiary's address line 2.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line2

      # The beneficiary's address line 3.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line3

      # The beneficiary's name.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_name

      # If your account requires approvals for transfers and the transfer was not
      #   approved, this will contain details of the cancellation.
      sig { returns(T.nilable(Increase::Models::WireTransfer::Cancellation)) }
      attr_reader :cancellation

      sig do
        params(
          cancellation: T.nilable(T.any(Increase::Models::WireTransfer::Cancellation, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :cancellation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::Models::WireTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :created_by

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency. For wire transfers this is always equal to `usd`.
      sig { returns(Increase::Models::WireTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The identifier of the External Account the transfer was made to, if any.
      sig { returns(T.nilable(String)) }
      attr_accessor :external_account_id

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The message that will show on the recipient's bank statement.
      sig { returns(T.nilable(String)) }
      attr_accessor :message_to_recipient

      # The transfer's network.
      sig { returns(Increase::Models::WireTransfer::Network::TaggedSymbol) }
      attr_accessor :network

      # The originator's address line 1.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line1

      # The originator's address line 2.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line2

      # The originator's address line 3.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line3

      # The originator's name.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_name

      # The ID for the pending transaction representing the transfer. A pending
      #   transaction is created when the transfer
      #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   by someone else in your organization.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # If your transfer is reversed, this will contain details of the reversal.
      sig { returns(T.nilable(Increase::Models::WireTransfer::Reversal)) }
      attr_reader :reversal

      sig do
        params(reversal: T.nilable(T.any(Increase::Models::WireTransfer::Reversal, Increase::Internal::AnyHash)))
          .void
      end
      attr_writer :reversal

      # The American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :routing_number

      # The Account Number that was passed to the wire's recipient.
      sig { returns(T.nilable(String)) }
      attr_accessor :source_account_number_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::Models::WireTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # After the transfer is submitted to Fedwire, this will contain supplemental
      #   details.
      sig { returns(T.nilable(Increase::Models::WireTransfer::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission: T.nilable(T.any(Increase::Models::WireTransfer::Submission, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :submission

      # The ID for the transaction funding the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      #   `wire_transfer`.
      sig { returns(Increase::Models::WireTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # Wire transfers move funds between your Increase account and any other account
      #   accessible by Fedwire.
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          amount: Integer,
          approval: T.nilable(T.any(Increase::Models::WireTransfer::Approval, Increase::Internal::AnyHash)),
          beneficiary_address_line1: T.nilable(String),
          beneficiary_address_line2: T.nilable(String),
          beneficiary_address_line3: T.nilable(String),
          beneficiary_name: T.nilable(String),
          cancellation: T.nilable(T.any(Increase::Models::WireTransfer::Cancellation, Increase::Internal::AnyHash)),
          created_at: Time,
          created_by: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy, Increase::Internal::AnyHash)),
          currency: Increase::Models::WireTransfer::Currency::OrSymbol,
          external_account_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          message_to_recipient: T.nilable(String),
          network: Increase::Models::WireTransfer::Network::OrSymbol,
          originator_address_line1: T.nilable(String),
          originator_address_line2: T.nilable(String),
          originator_address_line3: T.nilable(String),
          originator_name: T.nilable(String),
          pending_transaction_id: T.nilable(String),
          reversal: T.nilable(T.any(Increase::Models::WireTransfer::Reversal, Increase::Internal::AnyHash)),
          routing_number: String,
          source_account_number_id: T.nilable(String),
          status: Increase::Models::WireTransfer::Status::OrSymbol,
          submission: T.nilable(T.any(Increase::Models::WireTransfer::Submission, Increase::Internal::AnyHash)),
          transaction_id: T.nilable(String),
          type: Increase::Models::WireTransfer::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        account_id:,
        account_number:,
        amount:,
        approval:,
        beneficiary_address_line1:,
        beneficiary_address_line2:,
        beneficiary_address_line3:,
        beneficiary_name:,
        cancellation:,
        created_at:,
        created_by:,
        currency:,
        external_account_id:,
        idempotency_key:,
        message_to_recipient:,
        network:,
        originator_address_line1:,
        originator_address_line2:,
        originator_address_line3:,
        originator_name:,
        pending_transaction_id:,
        reversal:,
        routing_number:,
        source_account_number_id:,
        status:,
        submission:,
        transaction_id:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              account_id: String,
              account_number: String,
              amount: Integer,
              approval: T.nilable(Increase::Models::WireTransfer::Approval),
              beneficiary_address_line1: T.nilable(String),
              beneficiary_address_line2: T.nilable(String),
              beneficiary_address_line3: T.nilable(String),
              beneficiary_name: T.nilable(String),
              cancellation: T.nilable(Increase::Models::WireTransfer::Cancellation),
              created_at: Time,
              created_by: T.nilable(Increase::Models::WireTransfer::CreatedBy),
              currency: Increase::Models::WireTransfer::Currency::TaggedSymbol,
              external_account_id: T.nilable(String),
              idempotency_key: T.nilable(String),
              message_to_recipient: T.nilable(String),
              network: Increase::Models::WireTransfer::Network::TaggedSymbol,
              originator_address_line1: T.nilable(String),
              originator_address_line2: T.nilable(String),
              originator_address_line3: T.nilable(String),
              originator_name: T.nilable(String),
              pending_transaction_id: T.nilable(String),
              reversal: T.nilable(Increase::Models::WireTransfer::Reversal),
              routing_number: String,
              source_account_number_id: T.nilable(String),
              status: Increase::Models::WireTransfer::Status::TaggedSymbol,
              submission: T.nilable(Increase::Models::WireTransfer::Submission),
              transaction_id: T.nilable(String),
              type: Increase::Models::WireTransfer::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      class Approval < Increase::Internal::Type::BaseModel
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was approved.
        sig { returns(Time) }
        attr_accessor :approved_at

        # If the Transfer was approved by a user in the dashboard, the email address of
        #   that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :approved_by

        # If your account requires approvals for transfers and the transfer was approved,
        #   this will contain details of the approval.
        sig { params(approved_at: Time, approved_by: T.nilable(String)).returns(T.attached_class) }
        def self.new(approved_at:, approved_by:)
        end

        sig { override.returns({approved_at: Time, approved_by: T.nilable(String)}) }
        def to_hash
        end
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Transfer was canceled.
        sig { returns(Time) }
        attr_accessor :canceled_at

        # If the Transfer was canceled by a user in the dashboard, the email address of
        #   that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :canceled_by

        # If your account requires approvals for transfers and the transfer was not
        #   approved, this will contain details of the cancellation.
        sig { params(canceled_at: Time, canceled_by: T.nilable(String)).returns(T.attached_class) }
        def self.new(canceled_at:, canceled_by:)
        end

        sig { override.returns({canceled_at: Time, canceled_by: T.nilable(String)}) }
        def to_hash
        end
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::Models::WireTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy::APIKey, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :api_key

        # The type of object that created this transfer.
        sig { returns(Increase::Models::WireTransfer::CreatedBy::Category::TaggedSymbol) }
        attr_accessor :category

        # If present, details about the OAuth Application that created the transfer.
        sig { returns(T.nilable(Increase::Models::WireTransfer::CreatedBy::OAuthApplication)) }
        attr_reader :oauth_application

        sig do
          params(
            oauth_application: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy::OAuthApplication, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::Models::WireTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy::User, Increase::Internal::AnyHash))
          )
            .void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            api_key: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy::APIKey, Increase::Internal::AnyHash)),
            category: Increase::Models::WireTransfer::CreatedBy::Category::OrSymbol,
            oauth_application: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy::OAuthApplication, Increase::Internal::AnyHash)),
            user: T.nilable(T.any(Increase::Models::WireTransfer::CreatedBy::User, Increase::Internal::AnyHash))
          )
            .returns(T.attached_class)
        end
        def self.new(api_key:, category:, oauth_application:, user:)
        end

        sig do
          override
            .returns(
              {
                api_key: T.nilable(Increase::Models::WireTransfer::CreatedBy::APIKey),
                category: Increase::Models::WireTransfer::CreatedBy::Category::TaggedSymbol,
                oauth_application: T.nilable(Increase::Models::WireTransfer::CreatedBy::OAuthApplication),
                user: T.nilable(Increase::Models::WireTransfer::CreatedBy::User)
              }
            )
        end
        def to_hash
        end

        class APIKey < Increase::Internal::Type::BaseModel
          # The description set for the API key when it was created.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # If present, details about the API key that created the transfer.
          sig { params(description: T.nilable(String)).returns(T.attached_class) }
          def self.new(description:)
          end

          sig { override.returns({description: T.nilable(String)}) }
          def to_hash
          end
        end

        # The type of object that created this transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::WireTransfer::CreatedBy::Category) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::WireTransfer::CreatedBy::Category::TaggedSymbol) }

          # An API key. Details will be under the `api_key` object.
          API_KEY = T.let(:api_key, Increase::Models::WireTransfer::CreatedBy::Category::TaggedSymbol)

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(:oauth_application, Increase::Models::WireTransfer::CreatedBy::Category::TaggedSymbol)

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = T.let(:user, Increase::Models::WireTransfer::CreatedBy::Category::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::WireTransfer::CreatedBy::Category::TaggedSymbol]) }
          def self.values
          end
        end

        class OAuthApplication < Increase::Internal::Type::BaseModel
          # The name of the OAuth Application.
          sig { returns(String) }
          attr_accessor :name

          # If present, details about the OAuth Application that created the transfer.
          sig { params(name: String).returns(T.attached_class) }
          def self.new(name:)
          end

          sig { override.returns({name: String}) }
          def to_hash
          end
        end

        class User < Increase::Internal::Type::BaseModel
          # The email address of the User.
          sig { returns(String) }
          attr_accessor :email

          # If present, details about the User that created the transfer.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(email:)
          end

          sig { override.returns({email: String}) }
          def to_hash
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency. For wire transfers this is always equal to `usd`.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::WireTransfer::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::WireTransfer::Currency::TaggedSymbol) }

        # Canadian Dollar (CAD)
        CAD = T.let(:CAD, Increase::Models::WireTransfer::Currency::TaggedSymbol)

        # Swiss Franc (CHF)
        CHF = T.let(:CHF, Increase::Models::WireTransfer::Currency::TaggedSymbol)

        # Euro (EUR)
        EUR = T.let(:EUR, Increase::Models::WireTransfer::Currency::TaggedSymbol)

        # British Pound (GBP)
        GBP = T.let(:GBP, Increase::Models::WireTransfer::Currency::TaggedSymbol)

        # Japanese Yen (JPY)
        JPY = T.let(:JPY, Increase::Models::WireTransfer::Currency::TaggedSymbol)

        # US Dollar (USD)
        USD = T.let(:USD, Increase::Models::WireTransfer::Currency::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::WireTransfer::Currency::TaggedSymbol]) }
        def self.values
        end
      end

      # The transfer's network.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::WireTransfer::Network) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::WireTransfer::Network::TaggedSymbol) }

        WIRE = T.let(:wire, Increase::Models::WireTransfer::Network::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::WireTransfer::Network::TaggedSymbol]) }
        def self.values
        end
      end

      class Reversal < Increase::Internal::Type::BaseModel
        # The amount that was reversed in USD cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the reversal was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The description on the reversal message from Fedwire, set by the reversing bank.
        sig { returns(String) }
        attr_accessor :description

        # Additional financial institution information included in the wire reversal.
        sig { returns(T.nilable(String)) }
        attr_accessor :financial_institution_to_financial_institution_information

        # The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00
        #   PM Eastern Time on the evening before the `cycle date`.
        sig { returns(Date) }
        attr_accessor :input_cycle_date

        # The Fedwire transaction identifier.
        sig { returns(String) }
        attr_accessor :input_message_accountability_data

        # The Fedwire sequence number.
        sig { returns(String) }
        attr_accessor :input_sequence_number

        # The Fedwire input source identifier.
        sig { returns(String) }
        attr_accessor :input_source

        # The American Banking Association (ABA) routing number of the bank originating
        #   the transfer.
        sig { returns(T.nilable(String)) }
        attr_accessor :originator_routing_number

        # The Fedwire cycle date for the wire transfer that is being reversed by this
        #   message.
        sig { returns(Date) }
        attr_accessor :previous_message_input_cycle_date

        # The Fedwire transaction identifier for the wire transfer that was reversed.
        sig { returns(String) }
        attr_accessor :previous_message_input_message_accountability_data

        # The Fedwire sequence number for the wire transfer that was reversed.
        sig { returns(String) }
        attr_accessor :previous_message_input_sequence_number

        # The Fedwire input source identifier for the wire transfer that was reversed.
        sig { returns(String) }
        attr_accessor :previous_message_input_source

        # Information included in the wire reversal for the receiving financial
        #   institution.
        sig { returns(T.nilable(String)) }
        attr_accessor :receiver_financial_institution_information

        # The sending bank's reference number for the wire reversal.
        sig { returns(T.nilable(String)) }
        attr_accessor :sender_reference

        # The ID for the Transaction associated with the transfer reversal.
        sig { returns(String) }
        attr_accessor :transaction_id

        # The ID for the Wire Transfer that is being reversed.
        sig { returns(String) }
        attr_accessor :wire_transfer_id

        # If your transfer is reversed, this will contain details of the reversal.
        sig do
          params(
            amount: Integer,
            created_at: Time,
            description: String,
            financial_institution_to_financial_institution_information: T.nilable(String),
            input_cycle_date: Date,
            input_message_accountability_data: String,
            input_sequence_number: String,
            input_source: String,
            originator_routing_number: T.nilable(String),
            previous_message_input_cycle_date: Date,
            previous_message_input_message_accountability_data: String,
            previous_message_input_sequence_number: String,
            previous_message_input_source: String,
            receiver_financial_institution_information: T.nilable(String),
            sender_reference: T.nilable(String),
            transaction_id: String,
            wire_transfer_id: String
          )
            .returns(T.attached_class)
        end
        def self.new(
          amount:,
          created_at:,
          description:,
          financial_institution_to_financial_institution_information:,
          input_cycle_date:,
          input_message_accountability_data:,
          input_sequence_number:,
          input_source:,
          originator_routing_number:,
          previous_message_input_cycle_date:,
          previous_message_input_message_accountability_data:,
          previous_message_input_sequence_number:,
          previous_message_input_source:,
          receiver_financial_institution_information:,
          sender_reference:,
          transaction_id:,
          wire_transfer_id:
        )
        end

        sig do
          override
            .returns(
              {
                amount: Integer,
                created_at: Time,
                description: String,
                financial_institution_to_financial_institution_information: T.nilable(String),
                input_cycle_date: Date,
                input_message_accountability_data: String,
                input_sequence_number: String,
                input_source: String,
                originator_routing_number: T.nilable(String),
                previous_message_input_cycle_date: Date,
                previous_message_input_message_accountability_data: String,
                previous_message_input_sequence_number: String,
                previous_message_input_source: String,
                receiver_financial_institution_information: T.nilable(String),
                sender_reference: T.nilable(String),
                transaction_id: String,
                wire_transfer_id: String
              }
            )
        end
        def to_hash
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::WireTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::WireTransfer::Status::TaggedSymbol) }

        # The transfer is pending approval.
        PENDING_APPROVAL = T.let(:pending_approval, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer has been canceled.
        CANCELED = T.let(:canceled, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer is pending review by Increase.
        PENDING_REVIEWING = T.let(:pending_reviewing, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer has been rejected by Increase.
        REJECTED = T.let(:rejected, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = T.let(:requires_attention, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer is pending creation.
        PENDING_CREATING = T.let(:pending_creating, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer has been reversed.
        REVERSED = T.let(:reversed, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer has been submitted to Fedwire.
        SUBMITTED = T.let(:submitted, Increase::Models::WireTransfer::Status::TaggedSymbol)

        # The transfer has been acknowledged by Fedwire and can be considered complete.
        COMPLETE = T.let(:complete, Increase::Models::WireTransfer::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::WireTransfer::Status::TaggedSymbol]) }
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        # The accountability data for the submission.
        sig { returns(String) }
        attr_accessor :input_message_accountability_data

        # When this wire transfer was submitted to Fedwire.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # After the transfer is submitted to Fedwire, this will contain supplemental
        #   details.
        sig do
          params(input_message_accountability_data: String, submitted_at: Time).returns(T.attached_class)
        end
        def self.new(input_message_accountability_data:, submitted_at:)
        end

        sig { override.returns({input_message_accountability_data: String, submitted_at: Time}) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `wire_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::WireTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::WireTransfer::Type::TaggedSymbol) }

        WIRE_TRANSFER = T.let(:wire_transfer, Increase::Models::WireTransfer::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::WireTransfer::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
