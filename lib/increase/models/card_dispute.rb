# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#create
    class CardDispute < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Card Dispute identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute acceptance
      #   If the Card Dispute's status is `accepted`, this will contain details of the
      #     successful dispute.
      #
      #   @return [Increase::Models::CardDispute::Acceptance, nil]
      required :acceptance, -> { Increase::Models::CardDispute::Acceptance }, nil?: true

      # @!attribute amount
      #   The amount of the dispute, if provided, or the transaction amount otherwise.
      #
      #   @return [Integer, nil]
      required :amount, Integer, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the Card Dispute was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute disputed_transaction_id
      #   The identifier of the Transaction that was disputed.
      #
      #   @return [String]
      required :disputed_transaction_id, String

      # @!attribute explanation
      #   Why you disputed the Transaction in question.
      #
      #   @return [String]
      required :explanation, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute loss
      #   If the Card Dispute's status is `lost`, this will contain details of the lost
      #     dispute.
      #
      #   @return [Increase::Models::CardDispute::Loss, nil]
      required :loss, -> { Increase::Models::CardDispute::Loss }, nil?: true

      # @!attribute rejection
      #   If the Card Dispute's status is `rejected`, this will contain details of the
      #     unsuccessful dispute.
      #
      #   @return [Increase::Models::CardDispute::Rejection, nil]
      required :rejection, -> { Increase::Models::CardDispute::Rejection }, nil?: true

      # @!attribute status
      #   The results of the Dispute investigation.
      #
      #   @return [Symbol, Increase::Models::CardDispute::Status]
      required :status, enum: -> { Increase::Models::CardDispute::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `card_dispute`.
      #
      #   @return [Symbol, Increase::Models::CardDispute::Type]
      required :type, enum: -> { Increase::Models::CardDispute::Type }

      # @!attribute win
      #   If the Card Dispute's status is `won`, this will contain details of the won
      #     dispute.
      #
      #   @return [Increase::Models::CardDispute::Win, nil]
      required :win, -> { Increase::Models::CardDispute::Win }, nil?: true

      # @!parse
      #   # If unauthorized activity occurs on a card, you can create a Card Dispute and
      #   #   we'll return the funds if appropriate.
      #   #
      #   # @param id [String]
      #   # @param acceptance [Increase::Models::CardDispute::Acceptance, nil]
      #   # @param amount [Integer, nil]
      #   # @param created_at [Time]
      #   # @param disputed_transaction_id [String]
      #   # @param explanation [String]
      #   # @param idempotency_key [String, nil]
      #   # @param loss [Increase::Models::CardDispute::Loss, nil]
      #   # @param rejection [Increase::Models::CardDispute::Rejection, nil]
      #   # @param status [Symbol, Increase::Models::CardDispute::Status]
      #   # @param type [Symbol, Increase::Models::CardDispute::Type]
      #   # @param win [Increase::Models::CardDispute::Win, nil]
      #   #
      #   def initialize(
      #     id:,
      #     acceptance:,
      #     amount:,
      #     created_at:,
      #     disputed_transaction_id:,
      #     explanation:,
      #     idempotency_key:,
      #     loss:,
      #     rejection:,
      #     status:,
      #     type:,
      #     win:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # @see Increase::Models::CardDispute#acceptance
      class Acceptance < Increase::Internal::Type::BaseModel
        # @!attribute accepted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the Card Dispute was accepted.
        #
        #   @return [Time]
        required :accepted_at, Time

        # @!attribute card_dispute_id
        #   The identifier of the Card Dispute that was accepted.
        #
        #   @return [String]
        required :card_dispute_id, String

        # @!attribute transaction_id
        #   The identifier of the Transaction that was created to return the disputed funds
        #     to your account.
        #
        #   @return [String]
        required :transaction_id, String

        # @!parse
        #   # If the Card Dispute's status is `accepted`, this will contain details of the
        #   #   successful dispute.
        #   #
        #   # @param accepted_at [Time]
        #   # @param card_dispute_id [String]
        #   # @param transaction_id [String]
        #   #
        #   def initialize(accepted_at:, card_dispute_id:, transaction_id:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # @see Increase::Models::CardDispute#loss
      class Loss < Increase::Internal::Type::BaseModel
        # @!attribute card_dispute_id
        #   The identifier of the Card Dispute that was lost.
        #
        #   @return [String]
        required :card_dispute_id, String

        # @!attribute explanation
        #   Why the Card Dispute was lost.
        #
        #   @return [String]
        required :explanation, String

        # @!attribute lost_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the Card Dispute was lost.
        #
        #   @return [Time]
        required :lost_at, Time

        # @!attribute transaction_id
        #   The identifier of the Transaction that was created to debit the disputed funds
        #     from your account.
        #
        #   @return [String]
        required :transaction_id, String

        # @!parse
        #   # If the Card Dispute's status is `lost`, this will contain details of the lost
        #   #   dispute.
        #   #
        #   # @param card_dispute_id [String]
        #   # @param explanation [String]
        #   # @param lost_at [Time]
        #   # @param transaction_id [String]
        #   #
        #   def initialize(card_dispute_id:, explanation:, lost_at:, transaction_id:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # @see Increase::Models::CardDispute#rejection
      class Rejection < Increase::Internal::Type::BaseModel
        # @!attribute card_dispute_id
        #   The identifier of the Card Dispute that was rejected.
        #
        #   @return [String]
        required :card_dispute_id, String

        # @!attribute explanation
        #   Why the Card Dispute was rejected.
        #
        #   @return [String]
        required :explanation, String

        # @!attribute rejected_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the Card Dispute was rejected.
        #
        #   @return [Time]
        required :rejected_at, Time

        # @!parse
        #   # If the Card Dispute's status is `rejected`, this will contain details of the
        #   #   unsuccessful dispute.
        #   #
        #   # @param card_dispute_id [String]
        #   # @param explanation [String]
        #   # @param rejected_at [Time]
        #   #
        #   def initialize(card_dispute_id:, explanation:, rejected_at:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # The results of the Dispute investigation.
      #
      # @see Increase::Models::CardDispute#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Card Dispute is pending review.
        PENDING_REVIEWING = :pending_reviewing

        # Increase has requested more information related to the Card Dispute from you.
        PENDING_USER_INFORMATION = :pending_user_information

        # The Card Dispute has been accepted and your funds have been returned. The card dispute will eventually transition into `won` or `lost` depending on the outcome.
        ACCEPTED = :accepted

        # The Card Dispute has been rejected.
        REJECTED = :rejected

        # The Card Dispute has been lost and funds previously credited from the acceptance have been debited.
        LOST = :lost

        # The Card Dispute has been won and no further action can be taken.
        WON = :won

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `card_dispute`.
      #
      # @see Increase::Models::CardDispute#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_DISPUTE = :card_dispute

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # @see Increase::Models::CardDispute#win
      class Win < Increase::Internal::Type::BaseModel
        # @!attribute card_dispute_id
        #   The identifier of the Card Dispute that was won.
        #
        #   @return [String]
        required :card_dispute_id, String

        # @!attribute won_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the Card Dispute was won.
        #
        #   @return [Time]
        required :won_at, Time

        # @!parse
        #   # If the Card Dispute's status is `won`, this will contain details of the won
        #   #   dispute.
        #   #
        #   # @param card_dispute_id [String]
        #   # @param won_at [Time]
        #   #
        #   def initialize(card_dispute_id:, won_at:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
