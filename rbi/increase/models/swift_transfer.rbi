# typed: strong

module Increase
  module Models
    class SwiftTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::SwiftTransfer, Increase::Internal::AnyHash)
        end

      # The Swift transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account to which the transfer belongs.
      sig { returns(String) }
      attr_accessor :account_id

      # The creditor's account number.
      sig { returns(String) }
      attr_accessor :account_number

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The bank identification code (BIC) of the creditor.
      sig { returns(String) }
      attr_accessor :bank_identification_code

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(Increase::SwiftTransfer::CreatedBy) }
      attr_reader :created_by

      sig do
        params(created_by: Increase::SwiftTransfer::CreatedBy::OrHash).void
      end
      attr_writer :created_by

      # The creditor's address.
      sig { returns(Increase::SwiftTransfer::CreditorAddress) }
      attr_reader :creditor_address

      sig do
        params(
          creditor_address: Increase::SwiftTransfer::CreditorAddress::OrHash
        ).void
      end
      attr_writer :creditor_address

      # The creditor's name.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The debtor's address.
      sig { returns(Increase::SwiftTransfer::DebtorAddress) }
      attr_reader :debtor_address

      sig do
        params(
          debtor_address: Increase::SwiftTransfer::DebtorAddress::OrHash
        ).void
      end
      attr_writer :debtor_address

      # The debtor's name.
      sig { returns(String) }
      attr_accessor :debtor_name

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The amount that was instructed to be transferred in minor units of the
      # `instructed_currency`.
      sig { returns(Integer) }
      attr_accessor :instructed_amount

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
      # instructed amount.
      sig { returns(Increase::SwiftTransfer::InstructedCurrency::TaggedSymbol) }
      attr_accessor :instructed_currency

      # The ID for the pending transaction representing the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # The creditor's bank account routing or transit number. Required in certain
      # countries.
      sig { returns(T.nilable(String)) }
      attr_accessor :routing_number

      # The Account Number included in the transfer as the debtor's account number.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::SwiftTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # The ID for the transaction funding the transfer. This will be populated after
      # the transfer is initiated.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `swift_transfer`.
      sig { returns(Increase::SwiftTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # The Unique End-to-end Transaction Reference
      # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      # for the transfer.
      sig { returns(String) }
      attr_accessor :unique_end_to_end_transaction_reference

      # The unstructured remittance information that was included with the transfer.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # Swift Transfers send funds internationally.
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          amount: Integer,
          bank_identification_code: String,
          created_at: Time,
          created_by: Increase::SwiftTransfer::CreatedBy::OrHash,
          creditor_address: Increase::SwiftTransfer::CreditorAddress::OrHash,
          creditor_name: String,
          debtor_address: Increase::SwiftTransfer::DebtorAddress::OrHash,
          debtor_name: String,
          idempotency_key: T.nilable(String),
          instructed_amount: Integer,
          instructed_currency:
            Increase::SwiftTransfer::InstructedCurrency::OrSymbol,
          pending_transaction_id: T.nilable(String),
          routing_number: T.nilable(String),
          source_account_number_id: String,
          status: Increase::SwiftTransfer::Status::OrSymbol,
          transaction_id: T.nilable(String),
          type: Increase::SwiftTransfer::Type::OrSymbol,
          unique_end_to_end_transaction_reference: String,
          unstructured_remittance_information: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The Swift transfer's identifier.
        id:,
        # The Account to which the transfer belongs.
        account_id:,
        # The creditor's account number.
        account_number:,
        # The transfer amount in USD cents.
        amount:,
        # The bank identification code (BIC) of the creditor.
        bank_identification_code:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # What object created the transfer, either via the API or the dashboard.
        created_by:,
        # The creditor's address.
        creditor_address:,
        # The creditor's name.
        creditor_name:,
        # The debtor's address.
        debtor_address:,
        # The debtor's name.
        debtor_name:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The amount that was instructed to be transferred in minor units of the
        # `instructed_currency`.
        instructed_amount:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
        # instructed amount.
        instructed_currency:,
        # The ID for the pending transaction representing the transfer.
        pending_transaction_id:,
        # The creditor's bank account routing or transit number. Required in certain
        # countries.
        routing_number:,
        # The Account Number included in the transfer as the debtor's account number.
        source_account_number_id:,
        # The lifecycle status of the transfer.
        status:,
        # The ID for the transaction funding the transfer. This will be populated after
        # the transfer is initiated.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `swift_transfer`.
        type:,
        # The Unique End-to-end Transaction Reference
        # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
        # for the transfer.
        unique_end_to_end_transaction_reference:,
        # The unstructured remittance information that was included with the transfer.
        unstructured_remittance_information:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number: String,
            amount: Integer,
            bank_identification_code: String,
            created_at: Time,
            created_by: Increase::SwiftTransfer::CreatedBy,
            creditor_address: Increase::SwiftTransfer::CreditorAddress,
            creditor_name: String,
            debtor_address: Increase::SwiftTransfer::DebtorAddress,
            debtor_name: String,
            idempotency_key: T.nilable(String),
            instructed_amount: Integer,
            instructed_currency:
              Increase::SwiftTransfer::InstructedCurrency::TaggedSymbol,
            pending_transaction_id: T.nilable(String),
            routing_number: T.nilable(String),
            source_account_number_id: String,
            status: Increase::SwiftTransfer::Status::TaggedSymbol,
            transaction_id: T.nilable(String),
            type: Increase::SwiftTransfer::Type::TaggedSymbol,
            unique_end_to_end_transaction_reference: String,
            unstructured_remittance_information: String
          }
        )
      end
      def to_hash
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::SwiftTransfer::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # The type of object that created this transfer.
        sig do
          returns(Increase::SwiftTransfer::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::SwiftTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(Increase::SwiftTransfer::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(Increase::SwiftTransfer::CreatedBy::OAuthApplication)
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::SwiftTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::SwiftTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::SwiftTransfer::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            category: Increase::SwiftTransfer::CreatedBy::Category::OrSymbol,
            api_key:
              T.nilable(Increase::SwiftTransfer::CreatedBy::APIKey::OrHash),
            oauth_application:
              T.nilable(
                Increase::SwiftTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::SwiftTransfer::CreatedBy::User::OrHash)
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
                Increase::SwiftTransfer::CreatedBy::Category::TaggedSymbol,
              api_key: T.nilable(Increase::SwiftTransfer::CreatedBy::APIKey),
              oauth_application:
                T.nilable(Increase::SwiftTransfer::CreatedBy::OAuthApplication),
              user: T.nilable(Increase::SwiftTransfer::CreatedBy::User)
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
              T.all(Symbol, Increase::SwiftTransfer::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::SwiftTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::SwiftTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::SwiftTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::SwiftTransfer::CreatedBy::Category::TaggedSymbol
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
                Increase::SwiftTransfer::CreatedBy::APIKey,
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
                Increase::SwiftTransfer::CreatedBy::OAuthApplication,
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
                Increase::SwiftTransfer::CreatedBy::User,
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

      class CreditorAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::SwiftTransfer::CreditorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :city

        # The two-letter
        # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        # the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The ZIP or postal code of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

        # The state, province, or region of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_accessor :state

        # The creditor's address.
        sig do
          params(
            city: T.nilable(String),
            country: String,
            line1: String,
            line2: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The two-letter
          # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
          # the country of the address.
          country:,
          # The first line of the address.
          line1:,
          # The second line of the address.
          line2:,
          # The ZIP or postal code of the address.
          postal_code:,
          # The state, province, or region of the address. Required in certain countries.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: T.nilable(String),
              country: String,
              line1: String,
              line2: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String)
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
              Increase::SwiftTransfer::DebtorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :city

        # The two-letter
        # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        # the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The ZIP or postal code of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

        # The state, province, or region of the address. Required in certain countries.
        sig { returns(T.nilable(String)) }
        attr_accessor :state

        # The debtor's address.
        sig do
          params(
            city: T.nilable(String),
            country: String,
            line1: String,
            line2: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The two-letter
          # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
          # the country of the address.
          country:,
          # The first line of the address.
          line1:,
          # The second line of the address.
          line2:,
          # The ZIP or postal code of the address.
          postal_code:,
          # The state, province, or region of the address. Required in certain countries.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: T.nilable(String),
              country: String,
              line1: String,
              line2: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String)
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
            T.all(Symbol, Increase::SwiftTransfer::InstructedCurrency)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # United States Dollar
        USD =
          T.let(:USD, Increase::SwiftTransfer::InstructedCurrency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::SwiftTransfer::InstructedCurrency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::SwiftTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending approval.
        PENDING_APPROVAL =
          T.let(
            :pending_approval,
            Increase::SwiftTransfer::Status::TaggedSymbol
          )

        # The transfer has been canceled.
        CANCELED =
          T.let(:canceled, Increase::SwiftTransfer::Status::TaggedSymbol)

        # The transfer is pending review by Increase.
        PENDING_REVIEWING =
          T.let(
            :pending_reviewing,
            Increase::SwiftTransfer::Status::TaggedSymbol
          )

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::SwiftTransfer::Status::TaggedSymbol
          )

        # The transfer is pending initiation.
        PENDING_INITIATING =
          T.let(
            :pending_initiating,
            Increase::SwiftTransfer::Status::TaggedSymbol
          )

        # The transfer has been initiated.
        INITIATED =
          T.let(:initiated, Increase::SwiftTransfer::Status::TaggedSymbol)

        # The transfer has been rejected by Increase.
        REJECTED =
          T.let(:rejected, Increase::SwiftTransfer::Status::TaggedSymbol)

        # The transfer has been returned.
        RETURNED =
          T.let(:returned, Increase::SwiftTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::SwiftTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `swift_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::SwiftTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SWIFT_TRANSFER =
          T.let(:swift_transfer, Increase::SwiftTransfer::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::SwiftTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
