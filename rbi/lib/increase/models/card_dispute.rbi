# typed: strong

module Increase
  module Models
    class CardDispute < Increase::Internal::Type::BaseModel
      # The Card Dispute identifier.
      sig { returns(String) }
      attr_accessor :id

      # If the Card Dispute's status is `accepted`, this will contain details of the
      #   successful dispute.
      sig { returns(T.nilable(Increase::Models::CardDispute::Acceptance)) }
      attr_reader :acceptance

      sig do
        params(
          acceptance: T.nilable(T.any(Increase::Models::CardDispute::Acceptance, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :acceptance

      # The amount of the dispute, if provided, or the transaction amount otherwise.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Card Dispute was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The identifier of the Transaction that was disputed.
      sig { returns(String) }
      attr_accessor :disputed_transaction_id

      # Why you disputed the Transaction in question.
      sig { returns(String) }
      attr_accessor :explanation

      # The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # If the Card Dispute's status is `lost`, this will contain details of the lost
      #   dispute.
      sig { returns(T.nilable(Increase::Models::CardDispute::Loss)) }
      attr_reader :loss

      sig { params(loss: T.nilable(T.any(Increase::Models::CardDispute::Loss, Increase::Internal::AnyHash))).void }
      attr_writer :loss

      # If the Card Dispute's status is `rejected`, this will contain details of the
      #   unsuccessful dispute.
      sig { returns(T.nilable(Increase::Models::CardDispute::Rejection)) }
      attr_reader :rejection

      sig do
        params(rejection: T.nilable(T.any(Increase::Models::CardDispute::Rejection, Increase::Internal::AnyHash)))
          .void
      end
      attr_writer :rejection

      # The results of the Dispute investigation.
      sig { returns(Increase::Models::CardDispute::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      #   `card_dispute`.
      sig { returns(Increase::Models::CardDispute::Type::TaggedSymbol) }
      attr_accessor :type

      # If the Card Dispute's status is `won`, this will contain details of the won
      #   dispute.
      sig { returns(T.nilable(Increase::Models::CardDispute::Win)) }
      attr_reader :win

      sig { params(win: T.nilable(T.any(Increase::Models::CardDispute::Win, Increase::Internal::AnyHash))).void }
      attr_writer :win

      # If unauthorized activity occurs on a card, you can create a Card Dispute and
      #   we'll return the funds if appropriate.
      sig do
        params(
          id: String,
          acceptance: T.nilable(T.any(Increase::Models::CardDispute::Acceptance, Increase::Internal::AnyHash)),
          amount: T.nilable(Integer),
          created_at: Time,
          disputed_transaction_id: String,
          explanation: String,
          idempotency_key: T.nilable(String),
          loss: T.nilable(T.any(Increase::Models::CardDispute::Loss, Increase::Internal::AnyHash)),
          rejection: T.nilable(T.any(Increase::Models::CardDispute::Rejection, Increase::Internal::AnyHash)),
          status: Increase::Models::CardDispute::Status::OrSymbol,
          type: Increase::Models::CardDispute::Type::OrSymbol,
          win: T.nilable(T.any(Increase::Models::CardDispute::Win, Increase::Internal::AnyHash))
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        acceptance:,
        amount:,
        created_at:,
        disputed_transaction_id:,
        explanation:,
        idempotency_key:,
        loss:,
        rejection:,
        status:,
        type:,
        win:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              acceptance: T.nilable(Increase::Models::CardDispute::Acceptance),
              amount: T.nilable(Integer),
              created_at: Time,
              disputed_transaction_id: String,
              explanation: String,
              idempotency_key: T.nilable(String),
              loss: T.nilable(Increase::Models::CardDispute::Loss),
              rejection: T.nilable(Increase::Models::CardDispute::Rejection),
              status: Increase::Models::CardDispute::Status::TaggedSymbol,
              type: Increase::Models::CardDispute::Type::TaggedSymbol,
              win: T.nilable(Increase::Models::CardDispute::Win)
            }
          )
      end
      def to_hash
      end

      class Acceptance < Increase::Internal::Type::BaseModel
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Card Dispute was accepted.
        sig { returns(Time) }
        attr_accessor :accepted_at

        # The identifier of the Card Dispute that was accepted.
        sig { returns(String) }
        attr_accessor :card_dispute_id

        # The identifier of the Transaction that was created to return the disputed funds
        #   to your account.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If the Card Dispute's status is `accepted`, this will contain details of the
        #   successful dispute.
        sig do
          params(accepted_at: Time, card_dispute_id: String, transaction_id: String).returns(T.attached_class)
        end
        def self.new(accepted_at:, card_dispute_id:, transaction_id:)
        end

        sig { override.returns({accepted_at: Time, card_dispute_id: String, transaction_id: String}) }
        def to_hash
        end
      end

      class Loss < Increase::Internal::Type::BaseModel
        # The identifier of the Card Dispute that was lost.
        sig { returns(String) }
        attr_accessor :card_dispute_id

        # Why the Card Dispute was lost.
        sig { returns(String) }
        attr_accessor :explanation

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Card Dispute was lost.
        sig { returns(Time) }
        attr_accessor :lost_at

        # The identifier of the Transaction that was created to debit the disputed funds
        #   from your account.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If the Card Dispute's status is `lost`, this will contain details of the lost
        #   dispute.
        sig do
          params(card_dispute_id: String, explanation: String, lost_at: Time, transaction_id: String)
            .returns(T.attached_class)
        end
        def self.new(card_dispute_id:, explanation:, lost_at:, transaction_id:)
        end

        sig do
          override.returns(
            {
              card_dispute_id: String,
              explanation: String,
              lost_at: Time,
              transaction_id: String
            }
          )
        end
        def to_hash
        end
      end

      class Rejection < Increase::Internal::Type::BaseModel
        # The identifier of the Card Dispute that was rejected.
        sig { returns(String) }
        attr_accessor :card_dispute_id

        # Why the Card Dispute was rejected.
        sig { returns(String) }
        attr_accessor :explanation

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Card Dispute was rejected.
        sig { returns(Time) }
        attr_accessor :rejected_at

        # If the Card Dispute's status is `rejected`, this will contain details of the
        #   unsuccessful dispute.
        sig do
          params(card_dispute_id: String, explanation: String, rejected_at: Time).returns(T.attached_class)
        end
        def self.new(card_dispute_id:, explanation:, rejected_at:)
        end

        sig { override.returns({card_dispute_id: String, explanation: String, rejected_at: Time}) }
        def to_hash
        end
      end

      # The results of the Dispute investigation.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CardDispute::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::CardDispute::Status::TaggedSymbol) }

        # The Card Dispute is pending review.
        PENDING_REVIEWING = T.let(:pending_reviewing, Increase::Models::CardDispute::Status::TaggedSymbol)

        # Increase has requested more information related to the Card Dispute from you.
        PENDING_USER_INFORMATION =
          T.let(:pending_user_information, Increase::Models::CardDispute::Status::TaggedSymbol)

        # The Card Dispute has been accepted and your funds have been returned. The card dispute will eventually transition into `won` or `lost` depending on the outcome.
        ACCEPTED = T.let(:accepted, Increase::Models::CardDispute::Status::TaggedSymbol)

        # The Card Dispute has been rejected.
        REJECTED = T.let(:rejected, Increase::Models::CardDispute::Status::TaggedSymbol)

        # The Card Dispute has been lost and funds previously credited from the acceptance have been debited.
        LOST = T.let(:lost, Increase::Models::CardDispute::Status::TaggedSymbol)

        # The Card Dispute has been won and no further action can be taken.
        WON = T.let(:won, Increase::Models::CardDispute::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::CardDispute::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `card_dispute`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::CardDispute::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::CardDispute::Type::TaggedSymbol) }

        CARD_DISPUTE = T.let(:card_dispute, Increase::Models::CardDispute::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::CardDispute::Type::TaggedSymbol]) }
        def self.values
        end
      end

      class Win < Increase::Internal::Type::BaseModel
        # The identifier of the Card Dispute that was won.
        sig { returns(String) }
        attr_accessor :card_dispute_id

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Card Dispute was won.
        sig { returns(Time) }
        attr_accessor :won_at

        # If the Card Dispute's status is `won`, this will contain details of the won
        #   dispute.
        sig { params(card_dispute_id: String, won_at: Time).returns(T.attached_class) }
        def self.new(card_dispute_id:, won_at:)
        end

        sig { override.returns({card_dispute_id: String, won_at: Time}) }
        def to_hash
        end
      end
    end
  end
end
