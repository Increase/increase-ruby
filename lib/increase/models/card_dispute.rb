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
      #   successful dispute.
      #
      #   @return [Increase::Models::CardDispute::Acceptance, nil]
      required :acceptance, -> { Increase::CardDispute::Acceptance }, nil?: true

      # @!attribute amount
      #   The amount of the dispute, if provided, or the transaction amount otherwise.
      #
      #   @return [Integer, nil]
      required :amount, Integer, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Card Dispute was created.
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
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute loss
      #   If the Card Dispute's status is `lost`, this will contain details of the lost
      #   dispute.
      #
      #   @return [Increase::Models::CardDispute::Loss, nil]
      required :loss, -> { Increase::CardDispute::Loss }, nil?: true

      # @!attribute rejection
      #   If the Card Dispute's status is `rejected`, this will contain details of the
      #   unsuccessful dispute.
      #
      #   @return [Increase::Models::CardDispute::Rejection, nil]
      required :rejection, -> { Increase::CardDispute::Rejection }, nil?: true

      # @!attribute status
      #   The results of the Dispute investigation.
      #
      #   @return [Symbol, Increase::Models::CardDispute::Status]
      required :status, enum: -> { Increase::CardDispute::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_dispute`.
      #
      #   @return [Symbol, Increase::Models::CardDispute::Type]
      required :type, enum: -> { Increase::CardDispute::Type }

      # @!attribute win
      #   If the Card Dispute's status is `won`, this will contain details of the won
      #   dispute.
      #
      #   @return [Increase::Models::CardDispute::Win, nil]
      required :win, -> { Increase::CardDispute::Win }, nil?: true

      # @!method initialize(id:, acceptance:, amount:, created_at:, disputed_transaction_id:, explanation:, idempotency_key:, loss:, rejection:, status:, type:, win:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardDispute} for more details.
      #
      #   If unauthorized activity occurs on a card, you can create a Card Dispute and
      #   we'll return the funds if appropriate.
      #
      #   @param id [String] The Card Dispute identifier.
      #
      #   @param acceptance [Increase::Models::CardDispute::Acceptance, nil] If the Card Dispute's status is `accepted`, this will contain details of the suc
      #
      #   @param amount [Integer, nil] The amount of the dispute, if provided, or the transaction amount otherwise.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param disputed_transaction_id [String] The identifier of the Transaction that was disputed.
      #
      #   @param explanation [String] Why you disputed the Transaction in question.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param loss [Increase::Models::CardDispute::Loss, nil] If the Card Dispute's status is `lost`, this will contain details of the lost di
      #
      #   @param rejection [Increase::Models::CardDispute::Rejection, nil] If the Card Dispute's status is `rejected`, this will contain details of the uns
      #
      #   @param status [Symbol, Increase::Models::CardDispute::Status] The results of the Dispute investigation.
      #
      #   @param type [Symbol, Increase::Models::CardDispute::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param win [Increase::Models::CardDispute::Win, nil] If the Card Dispute's status is `won`, this will contain details of the won disp

      # @see Increase::Models::CardDispute#acceptance
      class Acceptance < Increase::Internal::Type::BaseModel
        # @!attribute accepted_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Card Dispute was accepted.
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
        #   to your account.
        #
        #   @return [String]
        required :transaction_id, String

        # @!method initialize(accepted_at:, card_dispute_id:, transaction_id:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDispute::Acceptance} for more details.
        #
        #   If the Card Dispute's status is `accepted`, this will contain details of the
        #   successful dispute.
        #
        #   @param accepted_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param card_dispute_id [String] The identifier of the Card Dispute that was accepted.
        #
        #   @param transaction_id [String] The identifier of the Transaction that was created to return the disputed funds
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
        #   the Card Dispute was lost.
        #
        #   @return [Time]
        required :lost_at, Time

        # @!attribute transaction_id
        #   The identifier of the Transaction that was created to debit the disputed funds
        #   from your account.
        #
        #   @return [String]
        required :transaction_id, String

        # @!method initialize(card_dispute_id:, explanation:, lost_at:, transaction_id:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDispute::Loss} for more details.
        #
        #   If the Card Dispute's status is `lost`, this will contain details of the lost
        #   dispute.
        #
        #   @param card_dispute_id [String] The identifier of the Card Dispute that was lost.
        #
        #   @param explanation [String] Why the Card Dispute was lost.
        #
        #   @param lost_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param transaction_id [String] The identifier of the Transaction that was created to debit the disputed funds f
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
        #   the Card Dispute was rejected.
        #
        #   @return [Time]
        required :rejected_at, Time

        # @!method initialize(card_dispute_id:, explanation:, rejected_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDispute::Rejection} for more details.
        #
        #   If the Card Dispute's status is `rejected`, this will contain details of the
        #   unsuccessful dispute.
        #
        #   @param card_dispute_id [String] The identifier of the Card Dispute that was rejected.
        #
        #   @param explanation [String] Why the Card Dispute was rejected.
        #
        #   @param rejected_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_dispute`.
      #
      # @see Increase::Models::CardDispute#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_DISPUTE = :card_dispute

        # @!method self.values
        #   @return [Array<Symbol>]
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
        #   the Card Dispute was won.
        #
        #   @return [Time]
        required :won_at, Time

        # @!method initialize(card_dispute_id:, won_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDispute::Win} for more details.
        #
        #   If the Card Dispute's status is `won`, this will contain details of the won
        #   dispute.
        #
        #   @param card_dispute_id [String] The identifier of the Card Dispute that was won.
        #
        #   @param won_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      end
    end
  end
end
