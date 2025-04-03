# typed: strong

module Increase
  module Models
    module Simulations
      class InboundFundsHoldReleaseResponse < Increase::Internal::Type::BaseModel
        # The Inbound Funds Hold identifier.
        sig { returns(String) }
        attr_accessor :id

        # The held amount in the minor unit of the account's currency. For dollars, for
        #   example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # When the hold will be released automatically. Certain conditions may cause it to
        #   be released before this time.
        sig { returns(Time) }
        attr_accessor :automatically_releases_at

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        #   was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
        sig { returns(Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol) }
        attr_accessor :currency

        # The ID of the Transaction for which funds were held.
        sig { returns(T.nilable(String)) }
        attr_accessor :held_transaction_id

        # The ID of the Pending Transaction representing the held funds.
        sig { returns(T.nilable(String)) }
        attr_accessor :pending_transaction_id

        # When the hold was released (if it has been released).
        sig { returns(T.nilable(Time)) }
        attr_accessor :released_at

        # The status of the hold.
        sig { returns(Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status::TaggedSymbol) }
        attr_accessor :status

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        sig { returns(Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type::TaggedSymbol) }
        attr_accessor :type

        # We hold funds for certain transaction types to account for return windows where
        #   funds might still be clawed back by the sending institution.
        sig do
          params(
            id: String,
            amount: Integer,
            automatically_releases_at: Time,
            created_at: Time,
            currency: Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::OrSymbol,
            held_transaction_id: T.nilable(String),
            pending_transaction_id: T.nilable(String),
            released_at: T.nilable(Time),
            status: Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status::OrSymbol,
            type: Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type::OrSymbol
          )
            .returns(T.attached_class)
        end
        def self.new(
          id:,
          amount:,
          automatically_releases_at:,
          created_at:,
          currency:,
          held_transaction_id:,
          pending_transaction_id:,
          released_at:,
          status:,
          type:
        )
        end

        sig do
          override
            .returns(
              {
                id: String,
                amount: Integer,
                automatically_releases_at: Time,
                created_at: Time,
                currency: Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol,
                held_transaction_id: T.nilable(String),
                pending_transaction_id: T.nilable(String),
                released_at: T.nilable(Time),
                status: Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status::TaggedSymbol,
                type: Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type::TaggedSymbol
              }
            )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol
              )
            end

          # Canadian Dollar (CAD)
          CAD = T.let(:CAD, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol)

          # Swiss Franc (CHF)
          CHF = T.let(:CHF, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol)

          # Euro (EUR)
          EUR = T.let(:EUR, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol)

          # British Pound (GBP)
          GBP = T.let(:GBP, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol)

          # Japanese Yen (JPY)
          JPY = T.let(:JPY, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol)

          # US Dollar (USD)
          USD = T.let(:USD, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol)

          sig do
            override
              .returns(T::Array[Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Currency::TaggedSymbol])
          end
          def self.values
          end
        end

        # The status of the hold.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status::TaggedSymbol
              )
            end

          # Funds are still being held.
          HELD = T.let(:held, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status::TaggedSymbol)

          # Funds have been released.
          COMPLETE =
            T.let(:complete, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status::TaggedSymbol)

          sig do
            override
              .returns(T::Array[Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Status::TaggedSymbol])
          end
          def self.values
          end
        end

        # A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type::TaggedSymbol) }

          INBOUND_FUNDS_HOLD =
            T.let(
              :inbound_funds_hold,
              Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type::TaggedSymbol
            )

          sig do
            override
              .returns(T::Array[Increase::Models::Simulations::InboundFundsHoldReleaseResponse::Type::TaggedSymbol])
          end
          def self.values
          end
        end
      end
    end
  end
end
