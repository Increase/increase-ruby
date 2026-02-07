# typed: strong

module Increase
  module Models
    class WireTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::WireTransfer, Increase::Internal::AnyHash)
        end

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
      # this will contain details of the approval.
      sig { returns(T.nilable(Increase::WireTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(
          approval: T.nilable(Increase::WireTransfer::Approval::OrHash)
        ).void
      end
      attr_writer :approval

      # If your account requires approvals for transfers and the transfer was not
      # approved, this will contain details of the cancellation.
      sig { returns(T.nilable(Increase::WireTransfer::Cancellation)) }
      attr_reader :cancellation

      sig do
        params(
          cancellation: T.nilable(Increase::WireTransfer::Cancellation::OrHash)
        ).void
      end
      attr_writer :cancellation

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::WireTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(Increase::WireTransfer::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # The person or business that is receiving the funds from the transfer.
      sig { returns(T.nilable(Increase::WireTransfer::Creditor)) }
      attr_reader :creditor

      sig do
        params(
          creditor: T.nilable(Increase::WireTransfer::Creditor::OrHash)
        ).void
      end
      attr_writer :creditor

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For wire transfers this is always equal to `usd`.
      sig { returns(Increase::WireTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The person or business whose funds are being transferred.
      sig { returns(T.nilable(Increase::WireTransfer::Debtor)) }
      attr_reader :debtor

      sig do
        params(debtor: T.nilable(Increase::WireTransfer::Debtor::OrHash)).void
      end
      attr_writer :debtor

      # The identifier of the External Account the transfer was made to, if any.
      sig { returns(T.nilable(String)) }
      attr_accessor :external_account_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The ID of an Inbound Wire Drawdown Request in response to which this transfer
      # was sent.
      sig { returns(T.nilable(String)) }
      attr_accessor :inbound_wire_drawdown_request_id

      # The transfer's network.
      sig { returns(Increase::WireTransfer::Network::TaggedSymbol) }
      attr_accessor :network

      # The ID for the pending transaction representing the transfer. A pending
      # transaction is created when the transfer
      # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      # by someone else in your organization.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # Remittance information sent with the wire transfer.
      sig { returns(T.nilable(Increase::WireTransfer::Remittance)) }
      attr_reader :remittance

      sig do
        params(
          remittance: T.nilable(Increase::WireTransfer::Remittance::OrHash)
        ).void
      end
      attr_writer :remittance

      # If your transfer is reversed, this will contain details of the reversal.
      sig { returns(T.nilable(Increase::WireTransfer::Reversal)) }
      attr_reader :reversal

      sig do
        params(
          reversal: T.nilable(Increase::WireTransfer::Reversal::OrHash)
        ).void
      end
      attr_writer :reversal

      # The American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :routing_number

      # The Account Number that was passed to the wire's recipient.
      sig { returns(T.nilable(String)) }
      attr_accessor :source_account_number_id

      # The lifecycle status of the transfer.
      sig { returns(Increase::WireTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # After the transfer is submitted to Fedwire, this will contain supplemental
      # details.
      sig { returns(T.nilable(Increase::WireTransfer::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission: T.nilable(Increase::WireTransfer::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # The ID for the transaction funding the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `wire_transfer`.
      sig { returns(Increase::WireTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # Wire transfers move funds between your Increase account and any other account
      # accessible by Fedwire.
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          amount: Integer,
          approval: T.nilable(Increase::WireTransfer::Approval::OrHash),
          cancellation: T.nilable(Increase::WireTransfer::Cancellation::OrHash),
          created_at: Time,
          created_by: T.nilable(Increase::WireTransfer::CreatedBy::OrHash),
          creditor: T.nilable(Increase::WireTransfer::Creditor::OrHash),
          currency: Increase::WireTransfer::Currency::OrSymbol,
          debtor: T.nilable(Increase::WireTransfer::Debtor::OrHash),
          external_account_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          inbound_wire_drawdown_request_id: T.nilable(String),
          network: Increase::WireTransfer::Network::OrSymbol,
          pending_transaction_id: T.nilable(String),
          remittance: T.nilable(Increase::WireTransfer::Remittance::OrHash),
          reversal: T.nilable(Increase::WireTransfer::Reversal::OrHash),
          routing_number: String,
          source_account_number_id: T.nilable(String),
          status: Increase::WireTransfer::Status::OrSymbol,
          submission: T.nilable(Increase::WireTransfer::Submission::OrHash),
          transaction_id: T.nilable(String),
          type: Increase::WireTransfer::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The wire transfer's identifier.
        id:,
        # The Account to which the transfer belongs.
        account_id:,
        # The destination account number.
        account_number:,
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
        # The person or business that is receiving the funds from the transfer.
        creditor:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
        # currency. For wire transfers this is always equal to `usd`.
        currency:,
        # The person or business whose funds are being transferred.
        debtor:,
        # The identifier of the External Account the transfer was made to, if any.
        external_account_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The ID of an Inbound Wire Drawdown Request in response to which this transfer
        # was sent.
        inbound_wire_drawdown_request_id:,
        # The transfer's network.
        network:,
        # The ID for the pending transaction representing the transfer. A pending
        # transaction is created when the transfer
        # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
        # by someone else in your organization.
        pending_transaction_id:,
        # Remittance information sent with the wire transfer.
        remittance:,
        # If your transfer is reversed, this will contain details of the reversal.
        reversal:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN).
        routing_number:,
        # The Account Number that was passed to the wire's recipient.
        source_account_number_id:,
        # The lifecycle status of the transfer.
        status:,
        # After the transfer is submitted to Fedwire, this will contain supplemental
        # details.
        submission:,
        # The ID for the transaction funding the transfer.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `wire_transfer`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number: String,
            amount: Integer,
            approval: T.nilable(Increase::WireTransfer::Approval),
            cancellation: T.nilable(Increase::WireTransfer::Cancellation),
            created_at: Time,
            created_by: T.nilable(Increase::WireTransfer::CreatedBy),
            creditor: T.nilable(Increase::WireTransfer::Creditor),
            currency: Increase::WireTransfer::Currency::TaggedSymbol,
            debtor: T.nilable(Increase::WireTransfer::Debtor),
            external_account_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            inbound_wire_drawdown_request_id: T.nilable(String),
            network: Increase::WireTransfer::Network::TaggedSymbol,
            pending_transaction_id: T.nilable(String),
            remittance: T.nilable(Increase::WireTransfer::Remittance),
            reversal: T.nilable(Increase::WireTransfer::Reversal),
            routing_number: String,
            source_account_number_id: T.nilable(String),
            status: Increase::WireTransfer::Status::TaggedSymbol,
            submission: T.nilable(Increase::WireTransfer::Submission),
            transaction_id: T.nilable(String),
            type: Increase::WireTransfer::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Approval < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::WireTransfer::Approval, Increase::Internal::AnyHash)
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
              Increase::WireTransfer::Cancellation,
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
              Increase::WireTransfer::CreatedBy,
              Increase::Internal::AnyHash
            )
          end

        # The type of object that created this transfer.
        sig do
          returns(Increase::WireTransfer::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::WireTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key:
              T.nilable(Increase::WireTransfer::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(
            T.nilable(Increase::WireTransfer::CreatedBy::OAuthApplication)
          )
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::WireTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::WireTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::WireTransfer::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            category: Increase::WireTransfer::CreatedBy::Category::OrSymbol,
            api_key:
              T.nilable(Increase::WireTransfer::CreatedBy::APIKey::OrHash),
            oauth_application:
              T.nilable(
                Increase::WireTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::WireTransfer::CreatedBy::User::OrHash)
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
                Increase::WireTransfer::CreatedBy::Category::TaggedSymbol,
              api_key: T.nilable(Increase::WireTransfer::CreatedBy::APIKey),
              oauth_application:
                T.nilable(Increase::WireTransfer::CreatedBy::OAuthApplication),
              user: T.nilable(Increase::WireTransfer::CreatedBy::User)
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
              T.all(Symbol, Increase::WireTransfer::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::WireTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::WireTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::WireTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::WireTransfer::CreatedBy::Category::TaggedSymbol
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
                Increase::WireTransfer::CreatedBy::APIKey,
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
                Increase::WireTransfer::CreatedBy::OAuthApplication,
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
                Increase::WireTransfer::CreatedBy::User,
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

      class Creditor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::WireTransfer::Creditor, Increase::Internal::AnyHash)
          end

        # The person or business's address.
        sig { returns(T.nilable(Increase::WireTransfer::Creditor::Address)) }
        attr_reader :address

        sig do
          params(
            address:
              T.nilable(Increase::WireTransfer::Creditor::Address::OrHash)
          ).void
        end
        attr_writer :address

        # The person or business's name.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The person or business that is receiving the funds from the transfer.
        sig do
          params(
            address:
              T.nilable(Increase::WireTransfer::Creditor::Address::OrHash),
            name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The person or business's address.
          address:,
          # The person or business's name.
          name:
        )
        end

        sig do
          override.returns(
            {
              address: T.nilable(Increase::WireTransfer::Creditor::Address),
              name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransfer::Creditor::Address,
                Increase::Internal::AnyHash
              )
            end

          # Unstructured address lines.
          sig do
            returns(
              T.nilable(Increase::WireTransfer::Creditor::Address::Unstructured)
            )
          end
          attr_reader :unstructured

          sig do
            params(
              unstructured:
                T.nilable(
                  Increase::WireTransfer::Creditor::Address::Unstructured::OrHash
                )
            ).void
          end
          attr_writer :unstructured

          # The person or business's address.
          sig do
            params(
              unstructured:
                T.nilable(
                  Increase::WireTransfer::Creditor::Address::Unstructured::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Unstructured address lines.
            unstructured:
          )
          end

          sig do
            override.returns(
              {
                unstructured:
                  T.nilable(
                    Increase::WireTransfer::Creditor::Address::Unstructured
                  )
              }
            )
          end
          def to_hash
          end

          class Unstructured < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::WireTransfer::Creditor::Address::Unstructured,
                  Increase::Internal::AnyHash
                )
              end

            # The first line.
            sig { returns(T.nilable(String)) }
            attr_accessor :line1

            # The second line.
            sig { returns(T.nilable(String)) }
            attr_accessor :line2

            # The third line.
            sig { returns(T.nilable(String)) }
            attr_accessor :line3

            # Unstructured address lines.
            sig do
              params(
                line1: T.nilable(String),
                line2: T.nilable(String),
                line3: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The first line.
              line1:,
              # The second line.
              line2:,
              # The third line.
              line3:
            )
            end

            sig do
              override.returns(
                {
                  line1: T.nilable(String),
                  line2: T.nilable(String),
                  line3: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For wire transfers this is always equal to `usd`.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireTransfer::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD = T.let(:USD, Increase::WireTransfer::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::WireTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Debtor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::WireTransfer::Debtor, Increase::Internal::AnyHash)
          end

        # The person or business's address.
        sig { returns(T.nilable(Increase::WireTransfer::Debtor::Address)) }
        attr_reader :address

        sig do
          params(
            address: T.nilable(Increase::WireTransfer::Debtor::Address::OrHash)
          ).void
        end
        attr_writer :address

        # The person or business's name.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The person or business whose funds are being transferred.
        sig do
          params(
            address: T.nilable(Increase::WireTransfer::Debtor::Address::OrHash),
            name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The person or business's address.
          address:,
          # The person or business's name.
          name:
        )
        end

        sig do
          override.returns(
            {
              address: T.nilable(Increase::WireTransfer::Debtor::Address),
              name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransfer::Debtor::Address,
                Increase::Internal::AnyHash
              )
            end

          # Unstructured address lines.
          sig do
            returns(
              T.nilable(Increase::WireTransfer::Debtor::Address::Unstructured)
            )
          end
          attr_reader :unstructured

          sig do
            params(
              unstructured:
                T.nilable(
                  Increase::WireTransfer::Debtor::Address::Unstructured::OrHash
                )
            ).void
          end
          attr_writer :unstructured

          # The person or business's address.
          sig do
            params(
              unstructured:
                T.nilable(
                  Increase::WireTransfer::Debtor::Address::Unstructured::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Unstructured address lines.
            unstructured:
          )
          end

          sig do
            override.returns(
              {
                unstructured:
                  T.nilable(
                    Increase::WireTransfer::Debtor::Address::Unstructured
                  )
              }
            )
          end
          def to_hash
          end

          class Unstructured < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::WireTransfer::Debtor::Address::Unstructured,
                  Increase::Internal::AnyHash
                )
              end

            # The first line.
            sig { returns(T.nilable(String)) }
            attr_accessor :line1

            # The second line.
            sig { returns(T.nilable(String)) }
            attr_accessor :line2

            # The third line.
            sig { returns(T.nilable(String)) }
            attr_accessor :line3

            # Unstructured address lines.
            sig do
              params(
                line1: T.nilable(String),
                line2: T.nilable(String),
                line3: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The first line.
              line1:,
              # The second line.
              line2:,
              # The third line.
              line3:
            )
            end

            sig do
              override.returns(
                {
                  line1: T.nilable(String),
                  line2: T.nilable(String),
                  line3: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      # The transfer's network.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireTransfer::Network) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WIRE = T.let(:wire, Increase::WireTransfer::Network::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::WireTransfer::Network::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Remittance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireTransfer::Remittance,
              Increase::Internal::AnyHash
            )
          end

        # The type of remittance information being passed.
        sig do
          returns(Increase::WireTransfer::Remittance::Category::TaggedSymbol)
        end
        attr_accessor :category

        # Internal Revenue Service (IRS) tax repayment information. Required if `category`
        # is equal to `tax`.
        sig { returns(T.nilable(Increase::WireTransfer::Remittance::Tax)) }
        attr_reader :tax

        sig do
          params(
            tax: T.nilable(Increase::WireTransfer::Remittance::Tax::OrHash)
          ).void
        end
        attr_writer :tax

        # Unstructured remittance information. Required if `category` is equal to
        # `unstructured`.
        sig do
          returns(T.nilable(Increase::WireTransfer::Remittance::Unstructured))
        end
        attr_reader :unstructured

        sig do
          params(
            unstructured:
              T.nilable(
                Increase::WireTransfer::Remittance::Unstructured::OrHash
              )
          ).void
        end
        attr_writer :unstructured

        # Remittance information sent with the wire transfer.
        sig do
          params(
            category: Increase::WireTransfer::Remittance::Category::OrSymbol,
            tax: T.nilable(Increase::WireTransfer::Remittance::Tax::OrHash),
            unstructured:
              T.nilable(
                Increase::WireTransfer::Remittance::Unstructured::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of remittance information being passed.
          category:,
          # Internal Revenue Service (IRS) tax repayment information. Required if `category`
          # is equal to `tax`.
          tax: nil,
          # Unstructured remittance information. Required if `category` is equal to
          # `unstructured`.
          unstructured: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::WireTransfer::Remittance::Category::TaggedSymbol,
              tax: T.nilable(Increase::WireTransfer::Remittance::Tax),
              unstructured:
                T.nilable(Increase::WireTransfer::Remittance::Unstructured)
            }
          )
        end
        def to_hash
        end

        # The type of remittance information being passed.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::WireTransfer::Remittance::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The wire transfer contains unstructured remittance information.
          UNSTRUCTURED =
            T.let(
              :unstructured,
              Increase::WireTransfer::Remittance::Category::TaggedSymbol
            )

          # The wire transfer is for tax payment purposes to the Internal Revenue Service (IRS).
          TAX =
            T.let(
              :tax,
              Increase::WireTransfer::Remittance::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::WireTransfer::Remittance::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Tax < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransfer::Remittance::Tax,
                Increase::Internal::AnyHash
              )
            end

          # The month and year the tax payment is for, in YYYY-MM-DD format. The day is
          # ignored.
          sig { returns(Date) }
          attr_accessor :date

          # The 9-digit Tax Identification Number (TIN) or Employer Identification Number
          # (EIN).
          sig { returns(String) }
          attr_accessor :identification_number

          # The 5-character tax type code.
          sig { returns(String) }
          attr_accessor :type_code

          # Internal Revenue Service (IRS) tax repayment information. Required if `category`
          # is equal to `tax`.
          sig do
            params(
              date: Date,
              identification_number: String,
              type_code: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The month and year the tax payment is for, in YYYY-MM-DD format. The day is
            # ignored.
            date:,
            # The 9-digit Tax Identification Number (TIN) or Employer Identification Number
            # (EIN).
            identification_number:,
            # The 5-character tax type code.
            type_code:
          )
          end

          sig do
            override.returns(
              { date: Date, identification_number: String, type_code: String }
            )
          end
          def to_hash
          end
        end

        class Unstructured < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransfer::Remittance::Unstructured,
                Increase::Internal::AnyHash
              )
            end

          # The message to the beneficiary.
          sig { returns(String) }
          attr_accessor :message

          # Unstructured remittance information. Required if `category` is equal to
          # `unstructured`.
          sig { params(message: String).returns(T.attached_class) }
          def self.new(
            # The message to the beneficiary.
            message:
          )
          end

          sig { override.returns({ message: String }) }
          def to_hash
          end
        end
      end

      class Reversal < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::WireTransfer::Reversal, Increase::Internal::AnyHash)
          end

        # The amount that was reversed in USD cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the reversal was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The debtor's routing number.
        sig { returns(T.nilable(String)) }
        attr_accessor :debtor_routing_number

        # The description on the reversal message from Fedwire, set by the reversing bank.
        sig { returns(String) }
        attr_accessor :description

        # The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00
        # PM Eastern Time on the evening before the `cycle date`.
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

        # The sending bank's identifier for the reversal.
        sig { returns(T.nilable(String)) }
        attr_accessor :instruction_identification

        # Additional information about the reason for the reversal.
        sig { returns(T.nilable(String)) }
        attr_accessor :return_reason_additional_information

        # A code provided by the sending bank giving a reason for the reversal. The common
        # return reason codes are
        # [documented here](/documentation/wire-reversals#reversal-reason-codes).
        sig { returns(T.nilable(String)) }
        attr_accessor :return_reason_code

        # An Increase-generated description of the `return_reason_code`.
        sig { returns(T.nilable(String)) }
        attr_accessor :return_reason_code_description

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
            debtor_routing_number: T.nilable(String),
            description: String,
            input_cycle_date: Date,
            input_message_accountability_data: String,
            input_sequence_number: String,
            input_source: String,
            instruction_identification: T.nilable(String),
            return_reason_additional_information: T.nilable(String),
            return_reason_code: T.nilable(String),
            return_reason_code_description: T.nilable(String),
            transaction_id: String,
            wire_transfer_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The amount that was reversed in USD cents.
          amount:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the reversal was created.
          created_at:,
          # The debtor's routing number.
          debtor_routing_number:,
          # The description on the reversal message from Fedwire, set by the reversing bank.
          description:,
          # The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00
          # PM Eastern Time on the evening before the `cycle date`.
          input_cycle_date:,
          # The Fedwire transaction identifier.
          input_message_accountability_data:,
          # The Fedwire sequence number.
          input_sequence_number:,
          # The Fedwire input source identifier.
          input_source:,
          # The sending bank's identifier for the reversal.
          instruction_identification:,
          # Additional information about the reason for the reversal.
          return_reason_additional_information:,
          # A code provided by the sending bank giving a reason for the reversal. The common
          # return reason codes are
          # [documented here](/documentation/wire-reversals#reversal-reason-codes).
          return_reason_code:,
          # An Increase-generated description of the `return_reason_code`.
          return_reason_code_description:,
          # The ID for the Transaction associated with the transfer reversal.
          transaction_id:,
          # The ID for the Wire Transfer that is being reversed.
          wire_transfer_id:
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              created_at: Time,
              debtor_routing_number: T.nilable(String),
              description: String,
              input_cycle_date: Date,
              input_message_accountability_data: String,
              input_sequence_number: String,
              input_source: String,
              instruction_identification: T.nilable(String),
              return_reason_additional_information: T.nilable(String),
              return_reason_code: T.nilable(String),
              return_reason_code_description: T.nilable(String),
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

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending approval.
        PENDING_APPROVAL =
          T.let(:pending_approval, Increase::WireTransfer::Status::TaggedSymbol)

        # The transfer has been canceled.
        CANCELED =
          T.let(:canceled, Increase::WireTransfer::Status::TaggedSymbol)

        # The transfer is pending review by Increase.
        PENDING_REVIEWING =
          T.let(
            :pending_reviewing,
            Increase::WireTransfer::Status::TaggedSymbol
          )

        # The transfer has been rejected by Increase.
        REJECTED =
          T.let(:rejected, Increase::WireTransfer::Status::TaggedSymbol)

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::WireTransfer::Status::TaggedSymbol
          )

        # The transfer is pending creation.
        PENDING_CREATING =
          T.let(:pending_creating, Increase::WireTransfer::Status::TaggedSymbol)

        # The transfer has been reversed.
        REVERSED =
          T.let(:reversed, Increase::WireTransfer::Status::TaggedSymbol)

        # The transfer has been submitted to Fedwire.
        SUBMITTED =
          T.let(:submitted, Increase::WireTransfer::Status::TaggedSymbol)

        # The transfer has been acknowledged by Fedwire and can be considered complete.
        COMPLETE =
          T.let(:complete, Increase::WireTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::WireTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireTransfer::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The accountability data for the submission.
        sig { returns(String) }
        attr_accessor :input_message_accountability_data

        # When this wire transfer was submitted to Fedwire.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # After the transfer is submitted to Fedwire, this will contain supplemental
        # details.
        sig do
          params(
            input_message_accountability_data: String,
            submitted_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The accountability data for the submission.
          input_message_accountability_data:,
          # When this wire transfer was submitted to Fedwire.
          submitted_at:
        )
        end

        sig do
          override.returns(
            { input_message_accountability_data: String, submitted_at: Time }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `wire_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WIRE_TRANSFER =
          T.let(:wire_transfer, Increase::WireTransfer::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::WireTransfer::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
