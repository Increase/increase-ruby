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

      # @!attribute amount
      #   The amount of the dispute.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute card_id
      #   The Card that the Card Dispute is associated with.
      #
      #   @return [String]
      required :card_id, String

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

      # @!attribute network
      #   The network that the Card Dispute is associated with.
      #
      #   @return [Symbol, Increase::Models::CardDispute::Network]
      required :network, enum: -> { Increase::CardDispute::Network }

      # @!attribute status
      #   The status of the Card Dispute.
      #
      #   @return [Symbol, Increase::Models::CardDispute::Status]
      required :status, enum: -> { Increase::CardDispute::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_dispute`.
      #
      #   @return [Symbol, Increase::Models::CardDispute::Type]
      required :type, enum: -> { Increase::CardDispute::Type }

      # @!attribute user_submission_required_by
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the user submission is required by. Present only if status is
      #   `user_submission_required` and a user submission is required by a certain time.
      #   Otherwise, this will be `nil`.
      #
      #   @return [Time, nil]
      required :user_submission_required_by, Time, nil?: true

      # @!attribute visa
      #   Card Dispute information for card payments processed over Visa's network. This
      #   field will be present in the JSON response if and only if `network` is equal to
      #   `visa`.
      #
      #   @return [Increase::Models::CardDispute::Visa, nil]
      required :visa, -> { Increase::CardDispute::Visa }, nil?: true

      # @!attribute win
      #   If the Card Dispute's status is `won`, this will contain details of the won
      #   dispute.
      #
      #   @return [Increase::Models::CardDispute::Win, nil]
      required :win, -> { Increase::CardDispute::Win }, nil?: true

      # @!attribute withdrawal
      #   If the Card Dispute has been withdrawn, this will contain details of the
      #   withdrawal.
      #
      #   @return [Increase::Models::CardDispute::Withdrawal, nil]
      required :withdrawal, -> { Increase::CardDispute::Withdrawal }, nil?: true

      # @!method initialize(id:, amount:, card_id:, created_at:, disputed_transaction_id:, idempotency_key:, loss:, network:, status:, type:, user_submission_required_by:, visa:, win:, withdrawal:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardDispute} for more details.
      #
      #   If unauthorized activity occurs on a card, you can create a Card Dispute and
      #   we'll work with the card networks to return the funds if appropriate.
      #
      #   @param id [String] The Card Dispute identifier.
      #
      #   @param amount [Integer] The amount of the dispute.
      #
      #   @param card_id [String] The Card that the Card Dispute is associated with.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param disputed_transaction_id [String] The identifier of the Transaction that was disputed.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param loss [Increase::Models::CardDispute::Loss, nil] If the Card Dispute's status is `lost`, this will contain details of the lost di
      #
      #   @param network [Symbol, Increase::Models::CardDispute::Network] The network that the Card Dispute is associated with.
      #
      #   @param status [Symbol, Increase::Models::CardDispute::Status] The status of the Card Dispute.
      #
      #   @param type [Symbol, Increase::Models::CardDispute::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param user_submission_required_by [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param visa [Increase::Models::CardDispute::Visa, nil] Card Dispute information for card payments processed over Visa's network. This f
      #
      #   @param win [Increase::Models::CardDispute::Win, nil] If the Card Dispute's status is `won`, this will contain details of the won disp
      #
      #   @param withdrawal [Increase::Models::CardDispute::Withdrawal, nil] If the Card Dispute has been withdrawn, this will contain details of the withdra

      # @see Increase::Models::CardDispute#loss
      class Loss < Increase::Internal::Type::BaseModel
        # @!attribute lost_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Card Dispute was lost.
        #
        #   @return [Time]
        required :lost_at, Time

        # @!attribute reason
        #   The reason the Card Dispute was lost.
        #
        #   @return [Symbol, Increase::Models::CardDispute::Loss::Reason]
        required :reason, enum: -> { Increase::CardDispute::Loss::Reason }

        # @!method initialize(lost_at:, reason:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDispute::Loss} for more details.
        #
        #   If the Card Dispute's status is `lost`, this will contain details of the lost
        #   dispute.
        #
        #   @param lost_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param reason [Symbol, Increase::Models::CardDispute::Loss::Reason] The reason the Card Dispute was lost.

        # The reason the Card Dispute was lost.
        #
        # @see Increase::Models::CardDispute::Loss#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The user withdrew the Card Dispute.
          USER_WITHDRAWN = :user_withdrawn

          # The Card Dispute was lost according to network rules.
          LOSS = :loss

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The network that the Card Dispute is associated with.
      #
      # @see Increase::Models::CardDispute#network
      module Network
        extend Increase::Internal::Type::Enum

        # Visa: details will be under the `visa` object.
        VISA = :visa

        # Pulse: details will be under the `pulse` object.
        PULSE = :pulse

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The status of the Card Dispute.
      #
      # @see Increase::Models::CardDispute#status
      module Status
        extend Increase::Internal::Type::Enum

        # A User Submission is required to continue with the Card Dispute.
        USER_SUBMISSION_REQUIRED = :user_submission_required

        # The most recent User Submission is being reviewed.
        PENDING_USER_SUBMISSION_REVIEWING = :pending_user_submission_reviewing

        # The most recent User Submission is being submitted to the network.
        PENDING_USER_SUBMISSION_SUBMITTING = :pending_user_submission_submitting

        # The user's withdrawal of the Card Dispute is being submitted to the network.
        PENDING_USER_WITHDRAWAL_SUBMITTING = :pending_user_withdrawal_submitting

        # The Card Dispute is pending a response from the network.
        PENDING_RESPONSE = :pending_response

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

      # @see Increase::Models::CardDispute#visa
      class Visa < Increase::Internal::Type::BaseModel
        # @!attribute network_events
        #   The network events for the Card Dispute.
        #
        #   @return [Array<Increase::Models::CardDispute::Visa::NetworkEvent>]
        required :network_events,
                 -> { Increase::Internal::Type::ArrayOf[Increase::CardDispute::Visa::NetworkEvent] }

        # @!attribute required_user_submission_category
        #   The category of the currently required user submission if the user wishes to
        #   proceed with the dispute. Present if and only if status is
        #   `user_submission_required`. Otherwise, this will be `nil`.
        #
        #   @return [Symbol, Increase::Models::CardDispute::Visa::RequiredUserSubmissionCategory, nil]
        required :required_user_submission_category,
                 enum: -> { Increase::CardDispute::Visa::RequiredUserSubmissionCategory },
                 nil?: true

        # @!attribute user_submissions
        #   The user submissions for the Card Dispute.
        #
        #   @return [Array<Increase::Models::CardDispute::Visa::UserSubmission>]
        required :user_submissions,
                 -> { Increase::Internal::Type::ArrayOf[Increase::CardDispute::Visa::UserSubmission] }

        # @!method initialize(network_events:, required_user_submission_category:, user_submissions:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDispute::Visa} for more details.
        #
        #   Card Dispute information for card payments processed over Visa's network. This
        #   field will be present in the JSON response if and only if `network` is equal to
        #   `visa`.
        #
        #   @param network_events [Array<Increase::Models::CardDispute::Visa::NetworkEvent>] The network events for the Card Dispute.
        #
        #   @param required_user_submission_category [Symbol, Increase::Models::CardDispute::Visa::RequiredUserSubmissionCategory, nil] The category of the currently required user submission if the user wishes to pro
        #
        #   @param user_submissions [Array<Increase::Models::CardDispute::Visa::UserSubmission>] The user submissions for the Card Dispute.

        class NetworkEvent < Increase::Internal::Type::BaseModel
          # @!attribute attachment_files
          #   The files attached to the Visa Card Dispute User Submission.
          #
          #   @return [Array<Increase::Models::CardDispute::Visa::NetworkEvent::AttachmentFile>]
          required :attachment_files,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardDispute::Visa::NetworkEvent::AttachmentFile] }

          # @!attribute category
          #   The category of the user submission. We may add additional possible values for
          #   this enum over time; your application should be able to handle such additions
          #   gracefully.
          #
          #   @return [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::Category]
          required :category, enum: -> { Increase::CardDispute::Visa::NetworkEvent::Category }

          # @!attribute created_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the Visa Card Dispute Network Event was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute dispute_financial_transaction_id
          #   The dispute financial transaction that resulted from the network event, if any.
          #
          #   @return [String, nil]
          required :dispute_financial_transaction_id, String, nil?: true

          # @!attribute chargeback_accepted
          #   A Card Dispute Chargeback Accepted Visa Network Event object. This field will be
          #   present in the JSON response if and only if `category` is equal to
          #   `chargeback_accepted`. Contains the details specific to a chargeback accepted
          #   Visa Card Dispute Network Event, which represents that a chargeback has been
          #   accepted by the merchant.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::ChargebackAccepted, nil]
          optional :chargeback_accepted,
                   -> { Increase::CardDispute::Visa::NetworkEvent::ChargebackAccepted },
                   nil?: true

          # @!attribute chargeback_submitted
          #   A Card Dispute Chargeback Submitted Visa Network Event object. This field will
          #   be present in the JSON response if and only if `category` is equal to
          #   `chargeback_submitted`. Contains the details specific to a chargeback submitted
          #   Visa Card Dispute Network Event, which represents that a chargeback has been
          #   submitted to the network.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::ChargebackSubmitted, nil]
          optional :chargeback_submitted,
                   -> { Increase::CardDispute::Visa::NetworkEvent::ChargebackSubmitted },
                   nil?: true

          # @!attribute chargeback_timed_out
          #   A Card Dispute Chargeback Timed Out Visa Network Event object. This field will
          #   be present in the JSON response if and only if `category` is equal to
          #   `chargeback_timed_out`. Contains the details specific to a chargeback timed out
          #   Visa Card Dispute Network Event, which represents that the chargeback has timed
          #   out in the user's favor.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::ChargebackTimedOut, nil]
          optional :chargeback_timed_out,
                   -> { Increase::CardDispute::Visa::NetworkEvent::ChargebackTimedOut },
                   nil?: true

          # @!attribute merchant_prearbitration_decline_submitted
          #   A Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event
          #   object. This field will be present in the JSON response if and only if
          #   `category` is equal to `merchant_prearbitration_decline_submitted`. Contains the
          #   details specific to a merchant prearbitration decline submitted Visa Card
          #   Dispute Network Event, which represents that the user has declined the
          #   merchant's request for a prearbitration request decision in their favor.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted, nil]
          optional :merchant_prearbitration_decline_submitted,
                   -> { Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted },
                   nil?: true

          # @!attribute merchant_prearbitration_received
          #   A Card Dispute Merchant Pre-Arbitration Received Visa Network Event object. This
          #   field will be present in the JSON response if and only if `category` is equal to
          #   `merchant_prearbitration_received`. Contains the details specific to a merchant
          #   prearbitration received Visa Card Dispute Network Event, which represents that
          #   the merchant has issued a prearbitration request in the user's favor.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived, nil]
          optional :merchant_prearbitration_received,
                   -> { Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived },
                   nil?: true

          # @!attribute merchant_prearbitration_timed_out
          #   A Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event object.
          #   This field will be present in the JSON response if and only if `category` is
          #   equal to `merchant_prearbitration_timed_out`. Contains the details specific to a
          #   merchant prearbitration timed out Visa Card Dispute Network Event, which
          #   represents that the user has timed out responding to the merchant's
          #   prearbitration request.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut, nil]
          optional :merchant_prearbitration_timed_out,
                   -> { Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut },
                   nil?: true

          # @!attribute represented
          #   A Card Dispute Re-presented Visa Network Event object. This field will be
          #   present in the JSON response if and only if `category` is equal to
          #   `represented`. Contains the details specific to a re-presented Visa Card Dispute
          #   Network Event, which represents that the merchant has declined the user's
          #   chargeback and has re-presented the payment.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented, nil]
          optional :represented, -> { Increase::CardDispute::Visa::NetworkEvent::Represented }, nil?: true

          # @!attribute representment_timed_out
          #   A Card Dispute Re-presentment Timed Out Visa Network Event object. This field
          #   will be present in the JSON response if and only if `category` is equal to
          #   `representment_timed_out`. Contains the details specific to a re-presentment
          #   time-out Visa Card Dispute Network Event, which represents that the user did not
          #   respond to the re-presentment by the merchant within the time limit.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut, nil]
          optional :representment_timed_out,
                   -> { Increase::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut },
                   nil?: true

          # @!attribute user_prearbitration_accepted
          #   A Card Dispute User Pre-Arbitration Accepted Visa Network Event object. This
          #   field will be present in the JSON response if and only if `category` is equal to
          #   `user_prearbitration_accepted`. Contains the details specific to a user
          #   prearbitration accepted Visa Card Dispute Network Event, which represents that
          #   the merchant has accepted the user's prearbitration request in the user's favor.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted, nil]
          optional :user_prearbitration_accepted,
                   -> { Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted },
                   nil?: true

          # @!attribute user_prearbitration_declined
          #   A Card Dispute User Pre-Arbitration Declined Visa Network Event object. This
          #   field will be present in the JSON response if and only if `category` is equal to
          #   `user_prearbitration_declined`. Contains the details specific to a user
          #   prearbitration declined Visa Card Dispute Network Event, which represents that
          #   the merchant has declined the user's prearbitration request.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined, nil]
          optional :user_prearbitration_declined,
                   -> { Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined },
                   nil?: true

          # @!attribute user_prearbitration_submitted
          #   A Card Dispute User Pre-Arbitration Submitted Visa Network Event object. This
          #   field will be present in the JSON response if and only if `category` is equal to
          #   `user_prearbitration_submitted`. Contains the details specific to a user
          #   prearbitration submitted Visa Card Dispute Network Event, which represents that
          #   the user's request for prearbitration has been submitted to the network.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted, nil]
          optional :user_prearbitration_submitted,
                   -> { Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted },
                   nil?: true

          # @!attribute user_prearbitration_timed_out
          #   A Card Dispute User Pre-Arbitration Timed Out Visa Network Event object. This
          #   field will be present in the JSON response if and only if `category` is equal to
          #   `user_prearbitration_timed_out`. Contains the details specific to a user
          #   prearbitration timed out Visa Card Dispute Network Event, which represents that
          #   the merchant has timed out responding to the user's prearbitration request.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut, nil]
          optional :user_prearbitration_timed_out,
                   -> { Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut },
                   nil?: true

          # @!attribute user_withdrawal_submitted
          #   A Card Dispute User Withdrawal Submitted Visa Network Event object. This field
          #   will be present in the JSON response if and only if `category` is equal to
          #   `user_withdrawal_submitted`. Contains the details specific to a user withdrawal
          #   submitted Visa Card Dispute Network Event, which represents that the user's
          #   request to withdraw the dispute has been submitted to the network.
          #
          #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted, nil]
          optional :user_withdrawal_submitted,
                   -> { Increase::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted },
                   nil?: true

          # @!method initialize(attachment_files:, category:, created_at:, dispute_financial_transaction_id:, chargeback_accepted: nil, chargeback_submitted: nil, chargeback_timed_out: nil, merchant_prearbitration_decline_submitted: nil, merchant_prearbitration_received: nil, merchant_prearbitration_timed_out: nil, represented: nil, representment_timed_out: nil, user_prearbitration_accepted: nil, user_prearbitration_declined: nil, user_prearbitration_submitted: nil, user_prearbitration_timed_out: nil, user_withdrawal_submitted: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDispute::Visa::NetworkEvent} for more details.
          #
          #   @param attachment_files [Array<Increase::Models::CardDispute::Visa::NetworkEvent::AttachmentFile>] The files attached to the Visa Card Dispute User Submission.
          #
          #   @param category [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::Category] The category of the user submission. We may add additional possible values for t
          #
          #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param dispute_financial_transaction_id [String, nil] The dispute financial transaction that resulted from the network event, if any.
          #
          #   @param chargeback_accepted [Increase::Models::CardDispute::Visa::NetworkEvent::ChargebackAccepted, nil] A Card Dispute Chargeback Accepted Visa Network Event object. This field will be
          #
          #   @param chargeback_submitted [Increase::Models::CardDispute::Visa::NetworkEvent::ChargebackSubmitted, nil] A Card Dispute Chargeback Submitted Visa Network Event object. This field will b
          #
          #   @param chargeback_timed_out [Increase::Models::CardDispute::Visa::NetworkEvent::ChargebackTimedOut, nil] A Card Dispute Chargeback Timed Out Visa Network Event object. This field will b
          #
          #   @param merchant_prearbitration_decline_submitted [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted, nil] A Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event obj
          #
          #   @param merchant_prearbitration_received [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived, nil] A Card Dispute Merchant Pre-Arbitration Received Visa Network Event object. This
          #
          #   @param merchant_prearbitration_timed_out [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut, nil] A Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event object. Thi
          #
          #   @param represented [Increase::Models::CardDispute::Visa::NetworkEvent::Represented, nil] A Card Dispute Re-presented Visa Network Event object. This field will be presen
          #
          #   @param representment_timed_out [Increase::Models::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut, nil] A Card Dispute Re-presentment Timed Out Visa Network Event object. This field wi
          #
          #   @param user_prearbitration_accepted [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted, nil] A Card Dispute User Pre-Arbitration Accepted Visa Network Event object. This fie
          #
          #   @param user_prearbitration_declined [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined, nil] A Card Dispute User Pre-Arbitration Declined Visa Network Event object. This fie
          #
          #   @param user_prearbitration_submitted [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted, nil] A Card Dispute User Pre-Arbitration Submitted Visa Network Event object. This fi
          #
          #   @param user_prearbitration_timed_out [Increase::Models::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut, nil] A Card Dispute User Pre-Arbitration Timed Out Visa Network Event object. This fi
          #
          #   @param user_withdrawal_submitted [Increase::Models::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted, nil] A Card Dispute User Withdrawal Submitted Visa Network Event object. This field w

          class AttachmentFile < Increase::Internal::Type::BaseModel
            # @!attribute file_id
            #   The ID of the file attached to the Card Dispute.
            #
            #   @return [String]
            required :file_id, String

            # @!method initialize(file_id:)
            #   @param file_id [String] The ID of the file attached to the Card Dispute.
          end

          # The category of the user submission. We may add additional possible values for
          # this enum over time; your application should be able to handle such additions
          # gracefully.
          #
          # @see Increase::Models::CardDispute::Visa::NetworkEvent#category
          module Category
            extend Increase::Internal::Type::Enum

            # Card Dispute Chargeback Accepted Visa Network Event: details will be under the `chargeback_accepted` object.
            CHARGEBACK_ACCEPTED = :chargeback_accepted

            # Card Dispute Chargeback Submitted Visa Network Event: details will be under the `chargeback_submitted` object.
            CHARGEBACK_SUBMITTED = :chargeback_submitted

            # Card Dispute Chargeback Timed Out Visa Network Event: details will be under the `chargeback_timed_out` object.
            CHARGEBACK_TIMED_OUT = :chargeback_timed_out

            # Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event: details will be under the `merchant_prearbitration_decline_submitted` object.
            MERCHANT_PREARBITRATION_DECLINE_SUBMITTED = :merchant_prearbitration_decline_submitted

            # Card Dispute Merchant Pre-Arbitration Received Visa Network Event: details will be under the `merchant_prearbitration_received` object.
            MERCHANT_PREARBITRATION_RECEIVED = :merchant_prearbitration_received

            # Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event: details will be under the `merchant_prearbitration_timed_out` object.
            MERCHANT_PREARBITRATION_TIMED_OUT = :merchant_prearbitration_timed_out

            # Card Dispute Re-presented Visa Network Event: details will be under the `represented` object.
            REPRESENTED = :represented

            # Card Dispute Re-presentment Timed Out Visa Network Event: details will be under the `representment_timed_out` object.
            REPRESENTMENT_TIMED_OUT = :representment_timed_out

            # Card Dispute User Pre-Arbitration Accepted Visa Network Event: details will be under the `user_prearbitration_accepted` object.
            USER_PREARBITRATION_ACCEPTED = :user_prearbitration_accepted

            # Card Dispute User Pre-Arbitration Declined Visa Network Event: details will be under the `user_prearbitration_declined` object.
            USER_PREARBITRATION_DECLINED = :user_prearbitration_declined

            # Card Dispute User Pre-Arbitration Submitted Visa Network Event: details will be under the `user_prearbitration_submitted` object.
            USER_PREARBITRATION_SUBMITTED = :user_prearbitration_submitted

            # Card Dispute User Pre-Arbitration Timed Out Visa Network Event: details will be under the `user_prearbitration_timed_out` object.
            USER_PREARBITRATION_TIMED_OUT = :user_prearbitration_timed_out

            # Card Dispute User Withdrawal Submitted Visa Network Event: details will be under the `user_withdrawal_submitted` object.
            USER_WITHDRAWAL_SUBMITTED = :user_withdrawal_submitted

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#chargeback_accepted
          class ChargebackAccepted < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute Chargeback Accepted Visa Network Event object. This field will be
            #   present in the JSON response if and only if `category` is equal to
            #   `chargeback_accepted`. Contains the details specific to a chargeback accepted
            #   Visa Card Dispute Network Event, which represents that a chargeback has been
            #   accepted by the merchant.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#chargeback_submitted
          class ChargebackSubmitted < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute Chargeback Submitted Visa Network Event object. This field will
            #   be present in the JSON response if and only if `category` is equal to
            #   `chargeback_submitted`. Contains the details specific to a chargeback submitted
            #   Visa Card Dispute Network Event, which represents that a chargeback has been
            #   submitted to the network.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#chargeback_timed_out
          class ChargebackTimedOut < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute Chargeback Timed Out Visa Network Event object. This field will
            #   be present in the JSON response if and only if `category` is equal to
            #   `chargeback_timed_out`. Contains the details specific to a chargeback timed out
            #   Visa Card Dispute Network Event, which represents that the chargeback has timed
            #   out in the user's favor.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#merchant_prearbitration_decline_submitted
          class MerchantPrearbitrationDeclineSubmitted < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event
            #   object. This field will be present in the JSON response if and only if
            #   `category` is equal to `merchant_prearbitration_decline_submitted`. Contains the
            #   details specific to a merchant prearbitration decline submitted Visa Card
            #   Dispute Network Event, which represents that the user has declined the
            #   merchant's request for a prearbitration request decision in their favor.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#merchant_prearbitration_received
          class MerchantPrearbitrationReceived < Increase::Internal::Type::BaseModel
            # @!attribute cardholder_no_longer_disputes
            #   Cardholder no longer disputes details. Present if and only if `reason` is
            #   `cardholder_no_longer_disputes`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes, nil]
            required :cardholder_no_longer_disputes,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes
                     },
                     nil?: true

            # @!attribute compelling_evidence
            #   Compelling evidence details. Present if and only if `reason` is
            #   `compelling_evidence`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence, nil]
            required :compelling_evidence,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence
                     },
                     nil?: true

            # @!attribute credit_or_reversal_processed
            #   Credit or reversal processed details. Present if and only if `reason` is
            #   `credit_or_reversal_processed`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed, nil]
            required :credit_or_reversal_processed,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed
                     },
                     nil?: true

            # @!attribute delayed_charge_transaction
            #   Delayed charge transaction details. Present if and only if `reason` is
            #   `delayed_charge_transaction`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction, nil]
            required :delayed_charge_transaction,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction
                     },
                     nil?: true

            # @!attribute evidence_of_imprint
            #   Evidence of imprint details. Present if and only if `reason` is
            #   `evidence_of_imprint`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint, nil]
            required :evidence_of_imprint,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint
                     },
                     nil?: true

            # @!attribute invalid_dispute
            #   Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute, nil]
            required :invalid_dispute,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute
                     },
                     nil?: true

            # @!attribute non_fiat_currency_or_non_fungible_token_received
            #   Non-fiat currency or non-fungible token received details. Present if and only if
            #   `reason` is `non_fiat_currency_or_non_fungible_token_received`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived, nil]
            required :non_fiat_currency_or_non_fungible_token_received,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived
                     },
                     nil?: true

            # @!attribute prior_undisputed_non_fraud_transactions
            #   Prior undisputed non-fraud transactions details. Present if and only if `reason`
            #   is `prior_undisputed_non_fraud_transactions`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions, nil]
            required :prior_undisputed_non_fraud_transactions,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions
                     },
                     nil?: true

            # @!attribute reason
            #   The reason the merchant re-presented the dispute.
            #
            #   @return [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason]
            required :reason,
                     enum: -> { Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason }

            # @!method initialize(cardholder_no_longer_disputes:, compelling_evidence:, credit_or_reversal_processed:, delayed_charge_transaction:, evidence_of_imprint:, invalid_dispute:, non_fiat_currency_or_non_fungible_token_received:, prior_undisputed_non_fraud_transactions:, reason:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived}
            #   for more details.
            #
            #   A Card Dispute Merchant Pre-Arbitration Received Visa Network Event object. This
            #   field will be present in the JSON response if and only if `category` is equal to
            #   `merchant_prearbitration_received`. Contains the details specific to a merchant
            #   prearbitration received Visa Card Dispute Network Event, which represents that
            #   the merchant has issued a prearbitration request in the user's favor.
            #
            #   @param cardholder_no_longer_disputes [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes, nil] Cardholder no longer disputes details. Present if and only if `reason` is `cardh
            #
            #   @param compelling_evidence [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence, nil] Compelling evidence details. Present if and only if `reason` is `compelling_evid
            #
            #   @param credit_or_reversal_processed [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed, nil] Credit or reversal processed details. Present if and only if `reason` is `credit
            #
            #   @param delayed_charge_transaction [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction, nil] Delayed charge transaction details. Present if and only if `reason` is
            #   `delayed\_
            #
            #   @param evidence_of_imprint [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint, nil] Evidence of imprint details. Present if and only if `reason` is `evidence_of_imp
            #
            #   @param invalid_dispute [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute, nil] Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
            #
            #   @param non_fiat_currency_or_non_fungible_token_received [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived, nil] Non-fiat currency or non-fungible token received details. Present if and only if
            #
            #   @param prior_undisputed_non_fraud_transactions [Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions, nil] Prior undisputed non-fraud transactions details. Present if and only if `reason`
            #
            #   @param reason [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason] The reason the merchant re-presented the dispute.

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#cardholder_no_longer_disputes
            class CardholderNoLongerDisputes < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation for why the merchant believes the cardholder no longer disputes the
              #   transaction.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(explanation:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes}
              #   for more details.
              #
              #   Cardholder no longer disputes details. Present if and only if `reason` is
              #   `cardholder_no_longer_disputes`.
              #
              #   @param explanation [String, nil] Explanation for why the merchant believes the cardholder no longer disputes the
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#compelling_evidence
            class CompellingEvidence < Increase::Internal::Type::BaseModel
              # @!attribute category
              #   The category of compelling evidence provided by the merchant.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category]
              required :category,
                       enum: -> { Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category }

              # @!attribute explanation
              #   Explanation of the compelling evidence provided by the merchant.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(category:, explanation:)
              #   Compelling evidence details. Present if and only if `reason` is
              #   `compelling_evidence`.
              #
              #   @param category [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category] The category of compelling evidence provided by the merchant.
              #
              #   @param explanation [String, nil] Explanation of the compelling evidence provided by the merchant.

              # The category of compelling evidence provided by the merchant.
              #
              # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence#category
              module Category
                extend Increase::Internal::Type::Enum

                # Authorized signer known by the cardholder.
                AUTHORIZED_SIGNER = :authorized_signer

                # Proof of delivery.
                DELIVERY = :delivery

                # Proof of delivery to cardholder at place of employment.
                DELIVERY_AT_PLACE_OF_EMPLOYMENT = :delivery_at_place_of_employment

                # Proof of digital goods download.
                DIGITAL_GOODS_DOWNLOAD = :digital_goods_download

                # Dynamic Currency Conversion actively chosen by cardholder.
                DYNAMIC_CURRENCY_CONVERSION_ACTIVELY_CHOSEN = :dynamic_currency_conversion_actively_chosen

                # Flight manifest with corresponding purchase itinerary record.
                FLIGHT_MANIFEST_AND_PURCHASE_ITINERARY = :flight_manifest_and_purchase_itinerary

                # Signer is member of cardholder's household.
                HOUSEHOLD_MEMBER_SIGNER = :household_member_signer

                # Legitimate spend across multiple payment types for same merchandise.
                LEGITIMATE_SPEND_ACROSS_PAYMENT_TYPES_FOR_SAME_MERCHANDISE =
                  :legitimate_spend_across_payment_types_for_same_merchandise

                # Documentation to prove the cardholder is in possession of and/or using the merchandise.
                MERCHANDISE_USE = :merchandise_use

                # Passenger transport: proof ticket was received, scanned at gate or other transaction related to original (for example, frequent flyer miles.)
                PASSENGER_TRANSPORT_TICKET_USE = :passenger_transport_ticket_use

                # Recurring transaction with binding contract or previous undisputed recurring transactions and proof the cardholder is using the merchandise or service.
                RECURRING_TRANSACTION_WITH_BINDING_CONTRACT_OR_PREVIOUS_UNDISPUTED_TRANSACTION =
                  :recurring_transaction_with_binding_contract_or_previous_undisputed_transaction

                # Signed delivery form, or copy of/details of identification from cardholder as proof goods were picked up at merchant location.
                SIGNED_DELIVERY_OR_PICKUP_FORM = :signed_delivery_or_pickup_form

                # Signed Mail Order/Phone Order form.
                SIGNED_MAIL_ORDER_PHONE_ORDER_FORM = :signed_mail_order_phone_order_form

                # Travel & Expense: loyalty transactions related to purchase.
                TRAVEL_AND_EXPENSE_LOYALTY_TRANSACTION = :travel_and_expense_loyalty_transaction

                # Travel & Expense: subsequent purchases made throughout service period.
                TRAVEL_AND_EXPENSE_SUBSEQUENT_PURCHASE = :travel_and_expense_subsequent_purchase

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#credit_or_reversal_processed
            class CreditOrReversalProcessed < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount of the credit or reversal in the minor unit of its currency. For
              #   dollars, for example, this is cents.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or
              #   reversal's currency.
              #
              #   @return [String]
              required :currency, String

              # @!attribute explanation
              #   Explanation for why the merchant believes the credit or reversal was processed.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!attribute processed_at
              #   The date the credit or reversal was processed.
              #
              #   @return [Date]
              required :processed_at, Date

              # @!method initialize(amount:, currency:, explanation:, processed_at:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed}
              #   for more details.
              #
              #   Credit or reversal processed details. Present if and only if `reason` is
              #   `credit_or_reversal_processed`.
              #
              #   @param amount [Integer] The amount of the credit or reversal in the minor unit of its currency. For doll
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or re
              #
              #   @param explanation [String, nil] Explanation for why the merchant believes the credit or reversal was processed.
              #
              #   @param processed_at [Date] The date the credit or reversal was processed.
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#delayed_charge_transaction
            class DelayedChargeTransaction < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Additional details about the delayed charge transaction.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(explanation:)
              #   Delayed charge transaction details. Present if and only if `reason` is
              #   `delayed_charge_transaction`.
              #
              #   @param explanation [String, nil] Additional details about the delayed charge transaction.
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#evidence_of_imprint
            class EvidenceOfImprint < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation of the evidence of imprint.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(explanation:)
              #   Evidence of imprint details. Present if and only if `reason` is
              #   `evidence_of_imprint`.
              #
              #   @param explanation [String, nil] Explanation of the evidence of imprint.
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#invalid_dispute
            class InvalidDispute < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation for why the dispute is considered invalid by the merchant.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!attribute reason
              #   The reason a merchant considers the dispute invalid.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason]
              required :reason,
                       enum: -> { Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason }

              # @!method initialize(explanation:, reason:)
              #   Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
              #
              #   @param explanation [String, nil] Explanation for why the dispute is considered invalid by the merchant.
              #
              #   @param reason [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason] The reason a merchant considers the dispute invalid.

              # The reason a merchant considers the dispute invalid.
              #
              # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute#reason
              module Reason
                extend Increase::Internal::Type::Enum

                # Other.
                OTHER = :other

                # Special authorization procedures followed.
                SPECIAL_AUTHORIZATION_PROCEDURES_FOLLOWED = :special_authorization_procedures_followed

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#non_fiat_currency_or_non_fungible_token_received
            class NonFiatCurrencyOrNonFungibleTokenReceived < Increase::Internal::Type::BaseModel
              # @!attribute blockchain_transaction_hash
              #   Blockchain transaction hash.
              #
              #   @return [String]
              required :blockchain_transaction_hash, String

              # @!attribute destination_wallet_address
              #   Destination wallet address.
              #
              #   @return [String]
              required :destination_wallet_address, String

              # @!attribute prior_approved_transactions
              #   Prior approved transactions.
              #
              #   @return [String, nil]
              required :prior_approved_transactions, String, nil?: true

              # @!method initialize(blockchain_transaction_hash:, destination_wallet_address:, prior_approved_transactions:)
              #   Non-fiat currency or non-fungible token received details. Present if and only if
              #   `reason` is `non_fiat_currency_or_non_fungible_token_received`.
              #
              #   @param blockchain_transaction_hash [String] Blockchain transaction hash.
              #
              #   @param destination_wallet_address [String] Destination wallet address.
              #
              #   @param prior_approved_transactions [String, nil] Prior approved transactions.
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#prior_undisputed_non_fraud_transactions
            class PriorUndisputedNonFraudTransactions < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation of the prior undisputed non-fraud transactions provided by the
              #   merchant.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(explanation:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions}
              #   for more details.
              #
              #   Prior undisputed non-fraud transactions details. Present if and only if `reason`
              #   is `prior_undisputed_non_fraud_transactions`.
              #
              #   @param explanation [String, nil] Explanation of the prior undisputed non-fraud transactions provided by the merch
            end

            # The reason the merchant re-presented the dispute.
            #
            # @see Increase::Models::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived#reason
            module Reason
              extend Increase::Internal::Type::Enum

              # Cardholder no longer disputes the transaction.
              CARDHOLDER_NO_LONGER_DISPUTES = :cardholder_no_longer_disputes

              # Compelling evidence.
              COMPELLING_EVIDENCE = :compelling_evidence

              # Credit or reversal was processed.
              CREDIT_OR_REVERSAL_PROCESSED = :credit_or_reversal_processed

              # Delayed charge transaction.
              DELAYED_CHARGE_TRANSACTION = :delayed_charge_transaction

              # Evidence of imprint.
              EVIDENCE_OF_IMPRINT = :evidence_of_imprint

              # Invalid dispute.
              INVALID_DISPUTE = :invalid_dispute

              # Non-fiat currency or non-fungible token was received by the cardholder.
              NON_FIAT_CURRENCY_OR_NON_FUNGIBLE_TOKEN_RECEIVED = :non_fiat_currency_or_non_fungible_token_received

              # Prior undisputed non-fraud transactions.
              PRIOR_UNDISPUTED_NON_FRAUD_TRANSACTIONS = :prior_undisputed_non_fraud_transactions

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#merchant_prearbitration_timed_out
          class MerchantPrearbitrationTimedOut < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event object.
            #   This field will be present in the JSON response if and only if `category` is
            #   equal to `merchant_prearbitration_timed_out`. Contains the details specific to a
            #   merchant prearbitration timed out Visa Card Dispute Network Event, which
            #   represents that the user has timed out responding to the merchant's
            #   prearbitration request.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#represented
          class Represented < Increase::Internal::Type::BaseModel
            # @!attribute cardholder_no_longer_disputes
            #   Cardholder no longer disputes details. Present if and only if `reason` is
            #   `cardholder_no_longer_disputes`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes, nil]
            required :cardholder_no_longer_disputes,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes
                     },
                     nil?: true

            # @!attribute credit_or_reversal_processed
            #   Credit or reversal processed details. Present if and only if `reason` is
            #   `credit_or_reversal_processed`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed, nil]
            required :credit_or_reversal_processed,
                     -> { Increase::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed },
                     nil?: true

            # @!attribute invalid_dispute
            #   Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute, nil]
            required :invalid_dispute,
                     -> { Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute },
                     nil?: true

            # @!attribute non_fiat_currency_or_non_fungible_token_as_described
            #   Non-fiat currency or non-fungible token as described details. Present if and
            #   only if `reason` is `non_fiat_currency_or_non_fungible_token_as_described`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed, nil]
            required :non_fiat_currency_or_non_fungible_token_as_described,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed
                     },
                     nil?: true

            # @!attribute non_fiat_currency_or_non_fungible_token_received
            #   Non-fiat currency or non-fungible token received details. Present if and only if
            #   `reason` is `non_fiat_currency_or_non_fungible_token_received`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived, nil]
            required :non_fiat_currency_or_non_fungible_token_received,
                     -> {
                       Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived
                     },
                     nil?: true

            # @!attribute proof_of_cash_disbursement
            #   Proof of cash disbursement details. Present if and only if `reason` is
            #   `proof_of_cash_disbursement`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement, nil]
            required :proof_of_cash_disbursement,
                     -> { Increase::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement },
                     nil?: true

            # @!attribute reason
            #   The reason the merchant re-presented the dispute.
            #
            #   @return [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::Represented::Reason]
            required :reason, enum: -> { Increase::CardDispute::Visa::NetworkEvent::Represented::Reason }

            # @!attribute reversal_issued
            #   Reversal issued by merchant details. Present if and only if `reason` is
            #   `reversal_issued`.
            #
            #   @return [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued, nil]
            required :reversal_issued,
                     -> { Increase::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued },
                     nil?: true

            # @!method initialize(cardholder_no_longer_disputes:, credit_or_reversal_processed:, invalid_dispute:, non_fiat_currency_or_non_fungible_token_as_described:, non_fiat_currency_or_non_fungible_token_received:, proof_of_cash_disbursement:, reason:, reversal_issued:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDispute::Visa::NetworkEvent::Represented} for more
            #   details.
            #
            #   A Card Dispute Re-presented Visa Network Event object. This field will be
            #   present in the JSON response if and only if `category` is equal to
            #   `represented`. Contains the details specific to a re-presented Visa Card Dispute
            #   Network Event, which represents that the merchant has declined the user's
            #   chargeback and has re-presented the payment.
            #
            #   @param cardholder_no_longer_disputes [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes, nil] Cardholder no longer disputes details. Present if and only if `reason` is `cardh
            #
            #   @param credit_or_reversal_processed [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed, nil] Credit or reversal processed details. Present if and only if `reason` is `credit
            #
            #   @param invalid_dispute [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute, nil] Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
            #
            #   @param non_fiat_currency_or_non_fungible_token_as_described [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed, nil] Non-fiat currency or non-fungible token as described details. Present if and onl
            #
            #   @param non_fiat_currency_or_non_fungible_token_received [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived, nil] Non-fiat currency or non-fungible token received details. Present if and only if
            #
            #   @param proof_of_cash_disbursement [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement, nil] Proof of cash disbursement details. Present if and only if `reason` is `proof_of
            #
            #   @param reason [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::Represented::Reason] The reason the merchant re-presented the dispute.
            #
            #   @param reversal_issued [Increase::Models::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued, nil] Reversal issued by merchant details. Present if and only if `reason` is `reversa

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#cardholder_no_longer_disputes
            class CardholderNoLongerDisputes < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation for why the merchant believes the cardholder no longer disputes the
              #   transaction.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(explanation:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes}
              #   for more details.
              #
              #   Cardholder no longer disputes details. Present if and only if `reason` is
              #   `cardholder_no_longer_disputes`.
              #
              #   @param explanation [String, nil] Explanation for why the merchant believes the cardholder no longer disputes the
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#credit_or_reversal_processed
            class CreditOrReversalProcessed < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount of the credit or reversal in the minor unit of its currency. For
              #   dollars, for example, this is cents.
              #
              #   @return [Integer]
              required :amount, Integer

              # @!attribute currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or
              #   reversal's currency.
              #
              #   @return [String]
              required :currency, String

              # @!attribute explanation
              #   Explanation for why the merchant believes the credit or reversal was processed.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!attribute processed_at
              #   The date the credit or reversal was processed.
              #
              #   @return [Date]
              required :processed_at, Date

              # @!method initialize(amount:, currency:, explanation:, processed_at:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed}
              #   for more details.
              #
              #   Credit or reversal processed details. Present if and only if `reason` is
              #   `credit_or_reversal_processed`.
              #
              #   @param amount [Integer] The amount of the credit or reversal in the minor unit of its currency. For doll
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or re
              #
              #   @param explanation [String, nil] Explanation for why the merchant believes the credit or reversal was processed.
              #
              #   @param processed_at [Date] The date the credit or reversal was processed.
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#invalid_dispute
            class InvalidDispute < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation for why the dispute is considered invalid by the merchant.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!attribute reason
              #   The reason a merchant considers the dispute invalid.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason]
              required :reason,
                       enum: -> { Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason }

              # @!method initialize(explanation:, reason:)
              #   Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
              #
              #   @param explanation [String, nil] Explanation for why the dispute is considered invalid by the merchant.
              #
              #   @param reason [Symbol, Increase::Models::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason] The reason a merchant considers the dispute invalid.

              # The reason a merchant considers the dispute invalid.
              #
              # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute#reason
              module Reason
                extend Increase::Internal::Type::Enum

                # Automatic Teller Machine (ATM) transaction proof provided.
                AUTOMATIC_TELLER_MACHINE_TRANSACTION_PROOF_PROVIDED =
                  :automatic_teller_machine_transaction_proof_provided

                # Balance of partial prepayment not paid.
                BALANCE_OF_PARTIAL_PREPAYMENT_NOT_PAID = :balance_of_partial_prepayment_not_paid

                # Cardholder canceled before expected receipt date of the merchandise.
                CARDHOLDER_CANCELED_BEFORE_EXPECTED_MERCHANDISE_RECEIPT_DATE =
                  :cardholder_canceled_before_expected_merchandise_receipt_date

                # Cardholder canceled before expected receipt date of the services.
                CARDHOLDER_CANCELED_BEFORE_EXPECTED_SERVICES_RECEIPT_DATE =
                  :cardholder_canceled_before_expected_services_receipt_date

                # Cardholder canceled on a different date than claimed.
                CARDHOLDER_CANCELED_DIFFERENT_DATE = :cardholder_canceled_different_date

                # Cardholder received  did not cancel according to policy.
                CARDHOLDER_DID_NOT_CANCEL_ACCORDING_TO_POLICY = :cardholder_did_not_cancel_according_to_policy

                # Cardholder received the merchandise.
                CARDHOLDER_RECEIVED_MERCHANDISE = :cardholder_received_merchandise

                # Country code is correct.
                COUNTRY_CODE_CORRECT = :country_code_correct

                # Credit was processed correctly.
                CREDIT_PROCESSED_CORRECTLY = :credit_processed_correctly

                # Currency is correct.
                CURRENCY_CORRECT = :currency_correct

                # Dispute is for quality.
                DISPUTE_IS_FOR_QUALITY = :dispute_is_for_quality

                # Dispute is for Visa Cash Back transaction portion.
                DISPUTE_IS_FOR_VISA_CASH_BACK_TRANSACTION_PORTION = :dispute_is_for_visa_cash_back_transaction_portion

                # Disputed amount is Value Added Tax (VAT).
                DISPUTED_AMOUNT_IS_VALUE_ADDED_TAX = :disputed_amount_is_value_added_tax

                # Disputed amount is Value Added Tax (VAT) but no credit receipt was provided by the cardholder.
                DISPUTED_AMOUNT_IS_VALUE_ADDED_TAX_NO_CREDIT_RECEIPT_PROVIDED =
                  :disputed_amount_is_value_added_tax_no_credit_receipt_provided

                # Limited return or cancellation policy was properly disclosed.
                LIMITED_RETURN_OR_CANCELLATION_POLICY_PROPERLY_DISCLOSED =
                  :limited_return_or_cancellation_policy_properly_disclosed

                # Merchandise held at cardholder customs agency.
                MERCHANDISE_HELD_AT_CARDHOLDER_CUSTOMS_AGENCY = :merchandise_held_at_cardholder_customs_agency

                # Merchandise matches the merchant's description.
                MERCHANDISE_MATCHES_DESCRIPTION = :merchandise_matches_description

                # Merchandise is not counterfeit.
                MERCHANDISE_NOT_COUNTERFEIT = :merchandise_not_counterfeit

                # Merchandise is not damaged.
                MERCHANDISE_NOT_DAMAGED = :merchandise_not_damaged

                # Merchandise is not defective.
                MERCHANDISE_NOT_DEFECTIVE = :merchandise_not_defective

                # Merchandise was provided prior to the cancellation date.
                MERCHANDISE_PROVIDED_PRIOR_TO_CANCELLATION_DATE = :merchandise_provided_prior_to_cancellation_date

                # Merchandise quality matches the merchant's description.
                MERCHANDISE_QUALITY_MATCHES_DESCRIPTION = :merchandise_quality_matches_description

                # Merchandise was not attempted returned to the merchant.
                MERCHANDISE_RETURN_NOT_ATTEMPTED = :merchandise_return_not_attempted

                # Merchant was not notified of the closed account.
                MERCHANT_NOT_NOTIFIED_OF_CLOSED_ACCOUNT = :merchant_not_notified_of_closed_account

                # Name on manifest of departed flight matches name on purchased itinerary.
                NAME_ON_FLIGHT_MANIFEST_MATCHES_PURCHASE = :name_on_flight_manifest_matches_purchase

                # No credit receipt was provided by the cardholder.
                NO_CREDIT_RECEIPT_PROVIDED = :no_credit_receipt_provided

                # Other.
                OTHER = :other

                # The claimed processing error did not occur.
                PROCESSING_ERROR_INCORRECT = :processing_error_incorrect

                # Returned merchandise held at customs agency outside the merchant's country.
                RETURNED_MECHANDISE_HELD_AT_CUSTOMS_AGENCY_OUTSIDE_MERCHANT_COUNTRY =
                  :returned_mechandise_held_at_customs_agency_outside_merchant_country

                # Services match the merchant's description.
                SERVICES_MATCH_DESCRIPTION = :services_match_description

                # Services were provided prior to the cancellation date.
                SERVICES_PROVIDED_PRIOR_TO_CANCELLATION_DATE = :services_provided_prior_to_cancellation_date

                # Services were used after the cancellation date and prior to the dispute submission date.
                SERVICES_USED_AFTER_CANCELLATION_DATE = :services_used_after_cancellation_date

                # Terms of service were not misrepresented.
                TERMS_OF_SERVICE_NOT_MISREPRESENTED = :terms_of_service_not_misrepresented

                # Transaction code is correct.
                TRANSACTION_CODE_CORRECT = :transaction_code_correct

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#non_fiat_currency_or_non_fungible_token_as_described
            class NonFiatCurrencyOrNonFungibleTokenAsDescribed < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Non-fiat currency or non-fungible token as described details. Present if and
              #   only if `reason` is `non_fiat_currency_or_non_fungible_token_as_described`.
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#non_fiat_currency_or_non_fungible_token_received
            class NonFiatCurrencyOrNonFungibleTokenReceived < Increase::Internal::Type::BaseModel
              # @!attribute blockchain_transaction_hash
              #   Blockchain transaction hash.
              #
              #   @return [String]
              required :blockchain_transaction_hash, String

              # @!attribute destination_wallet_address
              #   Destination wallet address.
              #
              #   @return [String]
              required :destination_wallet_address, String

              # @!attribute prior_approved_transactions
              #   Prior approved transactions.
              #
              #   @return [String, nil]
              required :prior_approved_transactions, String, nil?: true

              # @!method initialize(blockchain_transaction_hash:, destination_wallet_address:, prior_approved_transactions:)
              #   Non-fiat currency or non-fungible token received details. Present if and only if
              #   `reason` is `non_fiat_currency_or_non_fungible_token_received`.
              #
              #   @param blockchain_transaction_hash [String] Blockchain transaction hash.
              #
              #   @param destination_wallet_address [String] Destination wallet address.
              #
              #   @param prior_approved_transactions [String, nil] Prior approved transactions.
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#proof_of_cash_disbursement
            class ProofOfCashDisbursement < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation for why the merchant believes the evidence provides proof of cash
              #   disbursement.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(explanation:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement}
              #   for more details.
              #
              #   Proof of cash disbursement details. Present if and only if `reason` is
              #   `proof_of_cash_disbursement`.
              #
              #   @param explanation [String, nil] Explanation for why the merchant believes the evidence provides proof of cash di
            end

            # The reason the merchant re-presented the dispute.
            #
            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#reason
            module Reason
              extend Increase::Internal::Type::Enum

              # Cardholder no longer disputes the transaction.
              CARDHOLDER_NO_LONGER_DISPUTES = :cardholder_no_longer_disputes

              # Credit or reversal was processed.
              CREDIT_OR_REVERSAL_PROCESSED = :credit_or_reversal_processed

              # Invalid dispute.
              INVALID_DISPUTE = :invalid_dispute

              # Non-fiat currency or non-fungible token is as described by the merchant.
              NON_FIAT_CURRENCY_OR_NON_FUNGIBLE_TOKEN_AS_DESCRIBED =
                :non_fiat_currency_or_non_fungible_token_as_described

              # Non-fiat currency or non-fungible token was received by the cardholder.
              NON_FIAT_CURRENCY_OR_NON_FUNGIBLE_TOKEN_RECEIVED = :non_fiat_currency_or_non_fungible_token_received

              # Proof of cash disbursement provided.
              PROOF_OF_CASH_DISBURSEMENT = :proof_of_cash_disbursement

              # Reversal issued by merchant.
              REVERSAL_ISSUED = :reversal_issued

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDispute::Visa::NetworkEvent::Represented#reversal_issued
            class ReversalIssued < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation of the reversal issued by the merchant.
              #
              #   @return [String, nil]
              required :explanation, String, nil?: true

              # @!method initialize(explanation:)
              #   Reversal issued by merchant details. Present if and only if `reason` is
              #   `reversal_issued`.
              #
              #   @param explanation [String, nil] Explanation of the reversal issued by the merchant.
            end
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#representment_timed_out
          class RepresentmentTimedOut < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute Re-presentment Timed Out Visa Network Event object. This field
            #   will be present in the JSON response if and only if `category` is equal to
            #   `representment_timed_out`. Contains the details specific to a re-presentment
            #   time-out Visa Card Dispute Network Event, which represents that the user did not
            #   respond to the re-presentment by the merchant within the time limit.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#user_prearbitration_accepted
          class UserPrearbitrationAccepted < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute User Pre-Arbitration Accepted Visa Network Event object. This
            #   field will be present in the JSON response if and only if `category` is equal to
            #   `user_prearbitration_accepted`. Contains the details specific to a user
            #   prearbitration accepted Visa Card Dispute Network Event, which represents that
            #   the merchant has accepted the user's prearbitration request in the user's favor.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#user_prearbitration_declined
          class UserPrearbitrationDeclined < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute User Pre-Arbitration Declined Visa Network Event object. This
            #   field will be present in the JSON response if and only if `category` is equal to
            #   `user_prearbitration_declined`. Contains the details specific to a user
            #   prearbitration declined Visa Card Dispute Network Event, which represents that
            #   the merchant has declined the user's prearbitration request.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#user_prearbitration_submitted
          class UserPrearbitrationSubmitted < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute User Pre-Arbitration Submitted Visa Network Event object. This
            #   field will be present in the JSON response if and only if `category` is equal to
            #   `user_prearbitration_submitted`. Contains the details specific to a user
            #   prearbitration submitted Visa Card Dispute Network Event, which represents that
            #   the user's request for prearbitration has been submitted to the network.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#user_prearbitration_timed_out
          class UserPrearbitrationTimedOut < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute User Pre-Arbitration Timed Out Visa Network Event object. This
            #   field will be present in the JSON response if and only if `category` is equal to
            #   `user_prearbitration_timed_out`. Contains the details specific to a user
            #   prearbitration timed out Visa Card Dispute Network Event, which represents that
            #   the merchant has timed out responding to the user's prearbitration request.
          end

          # @see Increase::Models::CardDispute::Visa::NetworkEvent#user_withdrawal_submitted
          class UserWithdrawalSubmitted < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   A Card Dispute User Withdrawal Submitted Visa Network Event object. This field
            #   will be present in the JSON response if and only if `category` is equal to
            #   `user_withdrawal_submitted`. Contains the details specific to a user withdrawal
            #   submitted Visa Card Dispute Network Event, which represents that the user's
            #   request to withdraw the dispute has been submitted to the network.
          end
        end

        # The category of the currently required user submission if the user wishes to
        # proceed with the dispute. Present if and only if status is
        # `user_submission_required`. Otherwise, this will be `nil`.
        #
        # @see Increase::Models::CardDispute::Visa#required_user_submission_category
        module RequiredUserSubmissionCategory
          extend Increase::Internal::Type::Enum

          # A Chargeback User Submission is required.
          CHARGEBACK = :chargeback

          # A Merchant Pre Arbitration Decline User Submission is required.
          MERCHANT_PREARBITRATION_DECLINE = :merchant_prearbitration_decline

          # A User Initiated Pre Arbitration User Submission is required.
          USER_PREARBITRATION = :user_prearbitration

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class UserSubmission < Increase::Internal::Type::BaseModel
          # @!attribute accepted_at
          #   The date and time at which the Visa Card Dispute User Submission was reviewed
          #   and accepted.
          #
          #   @return [Time, nil]
          required :accepted_at, Time, nil?: true

          # @!attribute amount
          #   The amount of the dispute if it is different from the amount of a prior user
          #   submission or the disputed transaction.
          #
          #   @return [Integer, nil]
          required :amount, Integer, nil?: true

          # @!attribute attachment_files
          #   The files attached to the Visa Card Dispute User Submission.
          #
          #   @return [Array<Increase::Models::CardDispute::Visa::UserSubmission::AttachmentFile>]
          required :attachment_files,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardDispute::Visa::UserSubmission::AttachmentFile] }

          # @!attribute category
          #   The category of the user submission. We may add additional possible values for
          #   this enum over time; your application should be able to handle such additions
          #   gracefully.
          #
          #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Category]
          required :category, enum: -> { Increase::CardDispute::Visa::UserSubmission::Category }

          # @!attribute created_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the Visa Card Dispute User Submission was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute explanation
          #   The free-form explanation provided to Increase to provide more context for the
          #   user submission. This field is not sent directly to the card networks.
          #
          #   @return [String, nil]
          required :explanation, String, nil?: true

          # @!attribute further_information_requested_at
          #   The date and time at which Increase requested further information from the user
          #   for the Visa Card Dispute.
          #
          #   @return [Time, nil]
          required :further_information_requested_at, Time, nil?: true

          # @!attribute further_information_requested_reason
          #   The reason for Increase requesting further information from the user for the
          #   Visa Card Dispute.
          #
          #   @return [String, nil]
          required :further_information_requested_reason, String, nil?: true

          # @!attribute status
          #   The status of the Visa Card Dispute User Submission.
          #
          #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Status]
          required :status, enum: -> { Increase::CardDispute::Visa::UserSubmission::Status }

          # @!attribute updated_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the Visa Card Dispute User Submission was updated.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute chargeback
          #   A Visa Card Dispute Chargeback User Submission Chargeback Details object. This
          #   field will be present in the JSON response if and only if `category` is equal to
          #   `chargeback`. Contains the details specific to a Visa chargeback User Submission
          #   for a Card Dispute.
          #
          #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback, nil]
          optional :chargeback, -> { Increase::CardDispute::Visa::UserSubmission::Chargeback }, nil?: true

          # @!attribute merchant_prearbitration_decline
          #   A Visa Card Dispute Merchant Pre-Arbitration Decline User Submission object.
          #   This field will be present in the JSON response if and only if `category` is
          #   equal to `merchant_prearbitration_decline`. Contains the details specific to a
          #   merchant prearbitration decline Visa Card Dispute User Submission.
          #
          #   @return [Increase::Models::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline, nil]
          optional :merchant_prearbitration_decline,
                   -> { Increase::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline },
                   nil?: true

          # @!attribute user_prearbitration
          #   A Visa Card Dispute User-Initiated Pre-Arbitration User Submission object. This
          #   field will be present in the JSON response if and only if `category` is equal to
          #   `user_prearbitration`. Contains the details specific to a user-initiated
          #   pre-arbitration Visa Card Dispute User Submission.
          #
          #   @return [Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration, nil]
          optional :user_prearbitration,
                   -> { Increase::CardDispute::Visa::UserSubmission::UserPrearbitration },
                   nil?: true

          # @!method initialize(accepted_at:, amount:, attachment_files:, category:, created_at:, explanation:, further_information_requested_at:, further_information_requested_reason:, status:, updated_at:, chargeback: nil, merchant_prearbitration_decline: nil, user_prearbitration: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDispute::Visa::UserSubmission} for more details.
          #
          #   @param accepted_at [Time, nil] The date and time at which the Visa Card Dispute User Submission was reviewed an
          #
          #   @param amount [Integer, nil] The amount of the dispute if it is different from the amount of a prior user sub
          #
          #   @param attachment_files [Array<Increase::Models::CardDispute::Visa::UserSubmission::AttachmentFile>] The files attached to the Visa Card Dispute User Submission.
          #
          #   @param category [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Category] The category of the user submission. We may add additional possible values for t
          #
          #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param explanation [String, nil] The free-form explanation provided to Increase to provide more context for the u
          #
          #   @param further_information_requested_at [Time, nil] The date and time at which Increase requested further information from the user
          #
          #   @param further_information_requested_reason [String, nil] The reason for Increase requesting further information from the user for the Vis
          #
          #   @param status [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Status] The status of the Visa Card Dispute User Submission.
          #
          #   @param updated_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param chargeback [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback, nil] A Visa Card Dispute Chargeback User Submission Chargeback Details object. This f
          #
          #   @param merchant_prearbitration_decline [Increase::Models::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline, nil] A Visa Card Dispute Merchant Pre-Arbitration Decline User Submission object. Thi
          #
          #   @param user_prearbitration [Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration, nil] A Visa Card Dispute User-Initiated Pre-Arbitration User Submission object. This

          class AttachmentFile < Increase::Internal::Type::BaseModel
            # @!attribute file_id
            #   The ID of the file attached to the Card Dispute.
            #
            #   @return [String]
            required :file_id, String

            # @!method initialize(file_id:)
            #   @param file_id [String] The ID of the file attached to the Card Dispute.
          end

          # The category of the user submission. We may add additional possible values for
          # this enum over time; your application should be able to handle such additions
          # gracefully.
          #
          # @see Increase::Models::CardDispute::Visa::UserSubmission#category
          module Category
            extend Increase::Internal::Type::Enum

            # Visa Card Dispute Chargeback User Submission Chargeback Details: details will be under the `chargeback` object.
            CHARGEBACK = :chargeback

            # Visa Card Dispute Merchant Pre-Arbitration Decline User Submission: details will be under the `merchant_prearbitration_decline` object.
            MERCHANT_PREARBITRATION_DECLINE = :merchant_prearbitration_decline

            # Visa Card Dispute User-Initiated Pre-Arbitration User Submission: details will be under the `user_prearbitration` object.
            USER_PREARBITRATION = :user_prearbitration

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The status of the Visa Card Dispute User Submission.
          #
          # @see Increase::Models::CardDispute::Visa::UserSubmission#status
          module Status
            extend Increase::Internal::Type::Enum

            # The User Submission was abandoned.
            ABANDONED = :abandoned

            # The User Submission was accepted.
            ACCEPTED = :accepted

            # Further information is requested, please resubmit with the requested information.
            FURTHER_INFORMATION_REQUESTED = :further_information_requested

            # The User Submission is pending review.
            PENDING_REVIEWING = :pending_reviewing

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDispute::Visa::UserSubmission#chargeback
          class Chargeback < Increase::Internal::Type::BaseModel
            # @!attribute authorization
            #   Authorization. Present if and only if `category` is `authorization`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Authorization, nil]
            required :authorization,
                     -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization },
                     nil?: true

            # @!attribute category
            #   Category.
            #
            #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Category]
            required :category, enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::Category }

            # @!attribute consumer_canceled_merchandise
            #   Canceled merchandise. Present if and only if `category` is
            #   `consumer_canceled_merchandise`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise, nil]
            required :consumer_canceled_merchandise,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise
                     },
                     nil?: true

            # @!attribute consumer_canceled_recurring_transaction
            #   Canceled recurring transaction. Present if and only if `category` is
            #   `consumer_canceled_recurring_transaction`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction, nil]
            required :consumer_canceled_recurring_transaction,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction
                     },
                     nil?: true

            # @!attribute consumer_canceled_services
            #   Canceled services. Present if and only if `category` is
            #   `consumer_canceled_services`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices, nil]
            required :consumer_canceled_services,
                     -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices },
                     nil?: true

            # @!attribute consumer_counterfeit_merchandise
            #   Counterfeit merchandise. Present if and only if `category` is
            #   `consumer_counterfeit_merchandise`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise, nil]
            required :consumer_counterfeit_merchandise,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise
                     },
                     nil?: true

            # @!attribute consumer_credit_not_processed
            #   Credit not processed. Present if and only if `category` is
            #   `consumer_credit_not_processed`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed, nil]
            required :consumer_credit_not_processed,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed
                     },
                     nil?: true

            # @!attribute consumer_damaged_or_defective_merchandise
            #   Damaged or defective merchandise. Present if and only if `category` is
            #   `consumer_damaged_or_defective_merchandise`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise, nil]
            required :consumer_damaged_or_defective_merchandise,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise
                     },
                     nil?: true

            # @!attribute consumer_merchandise_misrepresentation
            #   Merchandise misrepresentation. Present if and only if `category` is
            #   `consumer_merchandise_misrepresentation`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation, nil]
            required :consumer_merchandise_misrepresentation,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation
                     },
                     nil?: true

            # @!attribute consumer_merchandise_not_as_described
            #   Merchandise not as described. Present if and only if `category` is
            #   `consumer_merchandise_not_as_described`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed, nil]
            required :consumer_merchandise_not_as_described,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed
                     },
                     nil?: true

            # @!attribute consumer_merchandise_not_received
            #   Merchandise not received. Present if and only if `category` is
            #   `consumer_merchandise_not_received`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived, nil]
            required :consumer_merchandise_not_received,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived
                     },
                     nil?: true

            # @!attribute consumer_non_receipt_of_cash
            #   Non-receipt of cash. Present if and only if `category` is
            #   `consumer_non_receipt_of_cash`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash, nil]
            required :consumer_non_receipt_of_cash,
                     -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash },
                     nil?: true

            # @!attribute consumer_original_credit_transaction_not_accepted
            #   Original Credit Transaction (OCT) not accepted. Present if and only if
            #   `category` is `consumer_original_credit_transaction_not_accepted`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted, nil]
            required :consumer_original_credit_transaction_not_accepted,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted
                     },
                     nil?: true

            # @!attribute consumer_quality_merchandise
            #   Merchandise quality issue. Present if and only if `category` is
            #   `consumer_quality_merchandise`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise, nil]
            required :consumer_quality_merchandise,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise
                     },
                     nil?: true

            # @!attribute consumer_quality_services
            #   Services quality issue. Present if and only if `category` is
            #   `consumer_quality_services`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices, nil]
            required :consumer_quality_services,
                     -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices },
                     nil?: true

            # @!attribute consumer_services_misrepresentation
            #   Services misrepresentation. Present if and only if `category` is
            #   `consumer_services_misrepresentation`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation, nil]
            required :consumer_services_misrepresentation,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation
                     },
                     nil?: true

            # @!attribute consumer_services_not_as_described
            #   Services not as described. Present if and only if `category` is
            #   `consumer_services_not_as_described`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed, nil]
            required :consumer_services_not_as_described,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed
                     },
                     nil?: true

            # @!attribute consumer_services_not_received
            #   Services not received. Present if and only if `category` is
            #   `consumer_services_not_received`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived, nil]
            required :consumer_services_not_received,
                     -> {
                       Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived
                     },
                     nil?: true

            # @!attribute fraud
            #   Fraud. Present if and only if `category` is `fraud`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Fraud, nil]
            required :fraud, -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud }, nil?: true

            # @!attribute processing_error
            #   Processing error. Present if and only if `category` is `processing_error`.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError, nil]
            required :processing_error,
                     -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError },
                     nil?: true

            # @!method initialize(authorization:, category:, consumer_canceled_merchandise:, consumer_canceled_recurring_transaction:, consumer_canceled_services:, consumer_counterfeit_merchandise:, consumer_credit_not_processed:, consumer_damaged_or_defective_merchandise:, consumer_merchandise_misrepresentation:, consumer_merchandise_not_as_described:, consumer_merchandise_not_received:, consumer_non_receipt_of_cash:, consumer_original_credit_transaction_not_accepted:, consumer_quality_merchandise:, consumer_quality_services:, consumer_services_misrepresentation:, consumer_services_not_as_described:, consumer_services_not_received:, fraud:, processing_error:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback} for more
            #   details.
            #
            #   A Visa Card Dispute Chargeback User Submission Chargeback Details object. This
            #   field will be present in the JSON response if and only if `category` is equal to
            #   `chargeback`. Contains the details specific to a Visa chargeback User Submission
            #   for a Card Dispute.
            #
            #   @param authorization [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Authorization, nil] Authorization. Present if and only if `category` is `authorization`.
            #
            #   @param category [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Category] Category.
            #
            #   @param consumer_canceled_merchandise [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise, nil] Canceled merchandise. Present if and only if `category` is `consumer_canceled_me
            #
            #   @param consumer_canceled_recurring_transaction [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction, nil] Canceled recurring transaction. Present if and only if `category` is `consumer_c
            #
            #   @param consumer_canceled_services [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices, nil] Canceled services. Present if and only if `category` is `consumer_canceled_servi
            #
            #   @param consumer_counterfeit_merchandise [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise, nil] Counterfeit merchandise. Present if and only if `category` is `consumer_counterf
            #
            #   @param consumer_credit_not_processed [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed, nil] Credit not processed. Present if and only if `category` is `consumer*credit_not*
            #
            #   @param consumer_damaged_or_defective_merchandise [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise, nil] Damaged or defective merchandise. Present if and only if `category` is `consumer
            #
            #   @param consumer_merchandise_misrepresentation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation, nil] Merchandise misrepresentation. Present if and only if `category` is `consumer_me
            #
            #   @param consumer_merchandise_not_as_described [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed, nil] Merchandise not as described. Present if and only if `category` is `consumer_mer
            #
            #   @param consumer_merchandise_not_received [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived, nil] Merchandise not received. Present if and only if `category` is `consumer_merchan
            #
            #   @param consumer_non_receipt_of_cash [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash, nil] Non-receipt of cash. Present if and only if `category` is `consumer*non_receipt*
            #
            #   @param consumer_original_credit_transaction_not_accepted [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted, nil] Original Credit Transaction (OCT) not accepted. Present if and only if `category
            #
            #   @param consumer_quality_merchandise [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise, nil] Merchandise quality issue. Present if and only if `category` is `consumer_qualit
            #
            #   @param consumer_quality_services [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices, nil] Services quality issue. Present if and only if `category` is `consumer_quality_s
            #
            #   @param consumer_services_misrepresentation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation, nil] Services misrepresentation. Present if and only if `category` is `consumer_servi
            #
            #   @param consumer_services_not_as_described [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed, nil] Services not as described. Present if and only if `category` is `consumer_servic
            #
            #   @param consumer_services_not_received [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived, nil] Services not received. Present if and only if `category` is `consumer_services_n
            #
            #   @param fraud [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Fraud, nil] Fraud. Present if and only if `category` is `fraud`.
            #
            #   @param processing_error [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError, nil] Processing error. Present if and only if `category` is `processing_error`.

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#authorization
            class Authorization < Increase::Internal::Type::BaseModel
              # @!attribute account_status
              #   Account status.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus]
              required :account_status,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus }

              # @!method initialize(account_status:)
              #   Authorization. Present if and only if `category` is `authorization`.
              #
              #   @param account_status [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus] Account status.

              # Account status.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Authorization#account_status
              module AccountStatus
                extend Increase::Internal::Type::Enum

                # Account closed.
                ACCOUNT_CLOSED = :account_closed

                # Credit problem.
                CREDIT_PROBLEM = :credit_problem

                # Fraud.
                FRAUD = :fraud

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # Category.
            #
            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#category
            module Category
              extend Increase::Internal::Type::Enum

              # Authorization.
              AUTHORIZATION = :authorization

              # Consumer: canceled merchandise.
              CONSUMER_CANCELED_MERCHANDISE = :consumer_canceled_merchandise

              # Consumer: canceled recurring transaction.
              CONSUMER_CANCELED_RECURRING_TRANSACTION = :consumer_canceled_recurring_transaction

              # Consumer: canceled services.
              CONSUMER_CANCELED_SERVICES = :consumer_canceled_services

              # Consumer: counterfeit merchandise.
              CONSUMER_COUNTERFEIT_MERCHANDISE = :consumer_counterfeit_merchandise

              # Consumer: credit not processed.
              CONSUMER_CREDIT_NOT_PROCESSED = :consumer_credit_not_processed

              # Consumer: damaged or defective merchandise.
              CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE = :consumer_damaged_or_defective_merchandise

              # Consumer: merchandise misrepresentation.
              CONSUMER_MERCHANDISE_MISREPRESENTATION = :consumer_merchandise_misrepresentation

              # Consumer: merchandise not as described.
              CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED = :consumer_merchandise_not_as_described

              # Consumer: merchandise not received.
              CONSUMER_MERCHANDISE_NOT_RECEIVED = :consumer_merchandise_not_received

              # Consumer: non-receipt of cash.
              CONSUMER_NON_RECEIPT_OF_CASH = :consumer_non_receipt_of_cash

              # Consumer: Original Credit Transaction (OCT) not accepted.
              CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED = :consumer_original_credit_transaction_not_accepted

              # Consumer: merchandise quality issue.
              CONSUMER_QUALITY_MERCHANDISE = :consumer_quality_merchandise

              # Consumer: services quality issue.
              CONSUMER_QUALITY_SERVICES = :consumer_quality_services

              # Consumer: services misrepresentation.
              CONSUMER_SERVICES_MISREPRESENTATION = :consumer_services_misrepresentation

              # Consumer: services not as described.
              CONSUMER_SERVICES_NOT_AS_DESCRIBED = :consumer_services_not_as_described

              # Consumer: services not received.
              CONSUMER_SERVICES_NOT_RECEIVED = :consumer_services_not_received

              # Fraud.
              FRAUD = :fraud

              # Processing error.
              PROCESSING_ERROR = :processing_error

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_canceled_merchandise
            class ConsumerCanceledMerchandise < Increase::Internal::Type::BaseModel
              # @!attribute cardholder_cancellation
              #   Cardholder cancellation.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation, nil]
              required :cardholder_cancellation,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation
                       },
                       nil?: true

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted }

              # @!attribute not_returned
              #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned, nil]
              required :not_returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned
                       },
                       nil?: true

              # @!attribute purchase_explanation
              #   Purchase explanation.
              #
              #   @return [String]
              required :purchase_explanation, String

              # @!attribute received_or_expected_at
              #   Received or expected at.
              #
              #   @return [Date]
              required :received_or_expected_at, Date

              # @!attribute return_attempted
              #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted, nil]
              required :return_attempted,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted
                       },
                       nil?: true

              # @!attribute return_outcome
              #   Return outcome.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome]
              required :return_outcome,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome }

              # @!attribute returned
              #   Returned. Present if and only if `return_outcome` is `returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned, nil]
              required :returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned
                       },
                       nil?: true

              # @!method initialize(cardholder_cancellation:, merchant_resolution_attempted:, not_returned:, purchase_explanation:, received_or_expected_at:, return_attempted:, return_outcome:, returned:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise}
              #   for more details.
              #
              #   Canceled merchandise. Present if and only if `category` is
              #   `consumer_canceled_merchandise`.
              #
              #   @param cardholder_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation, nil] Cardholder cancellation.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param not_returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned, nil] Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @param purchase_explanation [String] Purchase explanation.
              #
              #   @param received_or_expected_at [Date] Received or expected at.
              #
              #   @param return_attempted [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted, nil] Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @param return_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome] Return outcome.
              #
              #   @param returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned, nil] Returned. Present if and only if `return_outcome` is `returned`.

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise#cardholder_cancellation
              class CardholderCancellation < Increase::Internal::Type::BaseModel
                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!attribute canceled_prior_to_ship_date
                #   Canceled prior to ship date.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate]
                required :canceled_prior_to_ship_date,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate }

                # @!attribute cancellation_policy_provided
                #   Cancellation policy provided.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided]
                required :cancellation_policy_provided,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided }

                # @!attribute reason
                #   Reason.
                #
                #   @return [String]
                required :reason, String

                # @!method initialize(canceled_at:, canceled_prior_to_ship_date:, cancellation_policy_provided:, reason:)
                #   Cardholder cancellation.
                #
                #   @param canceled_at [Date] Canceled at.
                #
                #   @param canceled_prior_to_ship_date [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate] Canceled prior to ship date.
                #
                #   @param cancellation_policy_provided [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided] Cancellation policy provided.
                #
                #   @param reason [String] Reason.

                # Canceled prior to ship date.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation#canceled_prior_to_ship_date
                module CanceledPriorToShipDate
                  extend Increase::Internal::Type::Enum

                  # Canceled prior to ship date.
                  CANCELED_PRIOR_TO_SHIP_DATE = :canceled_prior_to_ship_date

                  # Not canceled prior to ship date.
                  NOT_CANCELED_PRIOR_TO_SHIP_DATE = :not_canceled_prior_to_ship_date

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # Cancellation policy provided.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation#cancellation_policy_provided
                module CancellationPolicyProvided
                  extend Increase::Internal::Type::Enum

                  # Not provided.
                  NOT_PROVIDED = :not_provided

                  # Provided.
                  PROVIDED = :provided

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise#not_returned
              class NotReturned < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise#return_attempted
              class ReturnAttempted < Increase::Internal::Type::BaseModel
                # @!attribute attempt_explanation
                #   Attempt explanation.
                #
                #   @return [String]
                required :attempt_explanation, String

                # @!attribute attempt_reason
                #   Attempt reason.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason]
                required :attempt_reason,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason }

                # @!attribute attempted_at
                #   Attempted at.
                #
                #   @return [Date]
                required :attempted_at, Date

                # @!attribute merchandise_disposition
                #   Merchandise disposition.
                #
                #   @return [String]
                required :merchandise_disposition, String

                # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
                #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                #
                #   @param attempt_explanation [String] Attempt explanation.
                #
                #   @param attempt_reason [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
                #
                #   @param attempted_at [Date] Attempted at.
                #
                #   @param merchandise_disposition [String] Merchandise disposition.

                # Attempt reason.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted#attempt_reason
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING = :merchant_not_responding

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS = :no_return_instructions

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED = :return_not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Return outcome.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise#return_outcome
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                # Not returned.
                NOT_RETURNED = :not_returned

                # Returned.
                RETURNED = :returned

                # Return attempted.
                RETURN_ATTEMPTED = :return_attempted

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise#returned
              class Returned < Increase::Internal::Type::BaseModel
                # @!attribute merchant_received_return_at
                #   Merchant received return at.
                #
                #   @return [Date, nil]
                required :merchant_received_return_at, Date, nil?: true

                # @!attribute other_explanation
                #   Other explanation. Required if and only if the return method is `other`.
                #
                #   @return [String, nil]
                required :other_explanation, String, nil?: true

                # @!attribute return_method
                #   Return method.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod]
                required :return_method,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod }

                # @!attribute returned_at
                #   Returned at.
                #
                #   @return [Date]
                required :returned_at, Date

                # @!attribute tracking_number
                #   Tracking number.
                #
                #   @return [String, nil]
                required :tracking_number, String, nil?: true

                # @!method initialize(merchant_received_return_at:, other_explanation:, return_method:, returned_at:, tracking_number:)
                #   Returned. Present if and only if `return_outcome` is `returned`.
                #
                #   @param merchant_received_return_at [Date, nil] Merchant received return at.
                #
                #   @param other_explanation [String, nil] Other explanation. Required if and only if the return method is `other`.
                #
                #   @param return_method [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod] Return method.
                #
                #   @param returned_at [Date] Returned at.
                #
                #   @param tracking_number [String, nil] Tracking number.

                # Return method.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned#return_method
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  # DHL.
                  DHL = :dhl

                  # Face-to-face.
                  FACE_TO_FACE = :face_to_face

                  # FedEx.
                  FEDEX = :fedex

                  # Other.
                  OTHER = :other

                  # Postal service.
                  POSTAL_SERVICE = :postal_service

                  # UPS.
                  UPS = :ups

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_canceled_recurring_transaction
            class ConsumerCanceledRecurringTransaction < Increase::Internal::Type::BaseModel
              # @!attribute cancellation_target
              #   Cancellation target.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget]
              required :cancellation_target,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget }

              # @!attribute merchant_contact_methods
              #   Merchant contact methods.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods]
              required :merchant_contact_methods,
                       -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods }

              # @!attribute other_form_of_payment_explanation
              #   Other form of payment explanation.
              #
              #   @return [String, nil]
              required :other_form_of_payment_explanation, String, nil?: true

              # @!attribute transaction_or_account_canceled_at
              #   Transaction or account canceled at.
              #
              #   @return [Date]
              required :transaction_or_account_canceled_at, Date

              # @!method initialize(cancellation_target:, merchant_contact_methods:, other_form_of_payment_explanation:, transaction_or_account_canceled_at:)
              #   Canceled recurring transaction. Present if and only if `category` is
              #   `consumer_canceled_recurring_transaction`.
              #
              #   @param cancellation_target [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget] Cancellation target.
              #
              #   @param merchant_contact_methods [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods] Merchant contact methods.
              #
              #   @param other_form_of_payment_explanation [String, nil] Other form of payment explanation.
              #
              #   @param transaction_or_account_canceled_at [Date] Transaction or account canceled at.

              # Cancellation target.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction#cancellation_target
              module CancellationTarget
                extend Increase::Internal::Type::Enum

                # Account.
                ACCOUNT = :account

                # Transaction.
                TRANSACTION = :transaction

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction#merchant_contact_methods
              class MerchantContactMethods < Increase::Internal::Type::BaseModel
                # @!attribute application_name
                #   Application name.
                #
                #   @return [String, nil]
                required :application_name, String, nil?: true

                # @!attribute call_center_phone_number
                #   Call center phone number.
                #
                #   @return [String, nil]
                required :call_center_phone_number, String, nil?: true

                # @!attribute email_address
                #   Email address.
                #
                #   @return [String, nil]
                required :email_address, String, nil?: true

                # @!attribute in_person_address
                #   In person address.
                #
                #   @return [String, nil]
                required :in_person_address, String, nil?: true

                # @!attribute mailing_address
                #   Mailing address.
                #
                #   @return [String, nil]
                required :mailing_address, String, nil?: true

                # @!attribute text_phone_number
                #   Text phone number.
                #
                #   @return [String, nil]
                required :text_phone_number, String, nil?: true

                # @!method initialize(application_name:, call_center_phone_number:, email_address:, in_person_address:, mailing_address:, text_phone_number:)
                #   Merchant contact methods.
                #
                #   @param application_name [String, nil] Application name.
                #
                #   @param call_center_phone_number [String, nil] Call center phone number.
                #
                #   @param email_address [String, nil] Email address.
                #
                #   @param in_person_address [String, nil] In person address.
                #
                #   @param mailing_address [String, nil] Mailing address.
                #
                #   @param text_phone_number [String, nil] Text phone number.
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_canceled_services
            class ConsumerCanceledServices < Increase::Internal::Type::BaseModel
              # @!attribute cardholder_cancellation
              #   Cardholder cancellation.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation]
              required :cardholder_cancellation,
                       -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation }

              # @!attribute contracted_at
              #   Contracted at.
              #
              #   @return [Date]
              required :contracted_at, Date

              # @!attribute guaranteed_reservation
              #   Guaranteed reservation explanation. Present if and only if `service_type` is
              #   `guaranteed_reservation`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation, nil]
              required :guaranteed_reservation,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation
                       },
                       nil?: true

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted }

              # @!attribute other
              #   Other service type explanation. Present if and only if `service_type` is
              #   `other`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other, nil]
              required :other,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other
                       },
                       nil?: true

              # @!attribute purchase_explanation
              #   Purchase explanation.
              #
              #   @return [String]
              required :purchase_explanation, String

              # @!attribute service_type
              #   Service type.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType]
              required :service_type,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType }

              # @!attribute timeshare
              #   Timeshare explanation. Present if and only if `service_type` is `timeshare`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare, nil]
              required :timeshare,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare
                       },
                       nil?: true

              # @!method initialize(cardholder_cancellation:, contracted_at:, guaranteed_reservation:, merchant_resolution_attempted:, other:, purchase_explanation:, service_type:, timeshare:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices}
              #   for more details.
              #
              #   Canceled services. Present if and only if `category` is
              #   `consumer_canceled_services`.
              #
              #   @param cardholder_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation] Cardholder cancellation.
              #
              #   @param contracted_at [Date] Contracted at.
              #
              #   @param guaranteed_reservation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation, nil] Guaranteed reservation explanation. Present if and only if `service_type` is `gu
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param other [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other, nil] Other service type explanation. Present if and only if `service_type` is `other`
              #
              #   @param purchase_explanation [String] Purchase explanation.
              #
              #   @param service_type [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType] Service type.
              #
              #   @param timeshare [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare, nil] Timeshare explanation. Present if and only if `service_type` is `timeshare`.

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices#cardholder_cancellation
              class CardholderCancellation < Increase::Internal::Type::BaseModel
                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!attribute cancellation_policy_provided
                #   Cancellation policy provided.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided]
                required :cancellation_policy_provided,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided }

                # @!attribute reason
                #   Reason.
                #
                #   @return [String]
                required :reason, String

                # @!method initialize(canceled_at:, cancellation_policy_provided:, reason:)
                #   Cardholder cancellation.
                #
                #   @param canceled_at [Date] Canceled at.
                #
                #   @param cancellation_policy_provided [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided] Cancellation policy provided.
                #
                #   @param reason [String] Reason.

                # Cancellation policy provided.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation#cancellation_policy_provided
                module CancellationPolicyProvided
                  extend Increase::Internal::Type::Enum

                  # Not provided.
                  NOT_PROVIDED = :not_provided

                  # Provided.
                  PROVIDED = :provided

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices#guaranteed_reservation
              class GuaranteedReservation < Increase::Internal::Type::BaseModel
                # @!attribute explanation
                #   Explanation.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation]
                required :explanation,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation }

                # @!method initialize(explanation:)
                #   Guaranteed reservation explanation. Present if and only if `service_type` is
                #   `guaranteed_reservation`.
                #
                #   @param explanation [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation] Explanation.

                # Explanation.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation#explanation
                module Explanation
                  extend Increase::Internal::Type::Enum

                  # Cardholder canceled prior to service.
                  CARDHOLDER_CANCELED_PRIOR_TO_SERVICE = :cardholder_canceled_prior_to_service

                  # Cardholder cancellation attempt within 24 hours of confirmation.
                  CARDHOLDER_CANCELLATION_ATTEMPT_WITHIN_24_HOURS_OF_CONFIRMATION =
                    :cardholder_cancellation_attempt_within_24_hours_of_confirmation

                  # Merchant billed for no-show.
                  MERCHANT_BILLED_NO_SHOW = :merchant_billed_no_show

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices#other
              class Other < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   Other service type explanation. Present if and only if `service_type` is
                #   `other`.
              end

              # Service type.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices#service_type
              module ServiceType
                extend Increase::Internal::Type::Enum

                # Guaranteed reservation.
                GUARANTEED_RESERVATION = :guaranteed_reservation

                # Other.
                OTHER = :other

                # Timeshare.
                TIMESHARE = :timeshare

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices#timeshare
              class Timeshare < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   Timeshare explanation. Present if and only if `service_type` is `timeshare`.
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_counterfeit_merchandise
            class ConsumerCounterfeitMerchandise < Increase::Internal::Type::BaseModel
              # @!attribute counterfeit_explanation
              #   Counterfeit explanation.
              #
              #   @return [String]
              required :counterfeit_explanation, String

              # @!attribute disposition_explanation
              #   Disposition explanation.
              #
              #   @return [String]
              required :disposition_explanation, String

              # @!attribute order_explanation
              #   Order explanation.
              #
              #   @return [String]
              required :order_explanation, String

              # @!attribute received_at
              #   Received at.
              #
              #   @return [Date]
              required :received_at, Date

              # @!method initialize(counterfeit_explanation:, disposition_explanation:, order_explanation:, received_at:)
              #   Counterfeit merchandise. Present if and only if `category` is
              #   `consumer_counterfeit_merchandise`.
              #
              #   @param counterfeit_explanation [String] Counterfeit explanation.
              #
              #   @param disposition_explanation [String] Disposition explanation.
              #
              #   @param order_explanation [String] Order explanation.
              #
              #   @param received_at [Date] Received at.
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_credit_not_processed
            class ConsumerCreditNotProcessed < Increase::Internal::Type::BaseModel
              # @!attribute canceled_or_returned_at
              #   Canceled or returned at.
              #
              #   @return [Date, nil]
              required :canceled_or_returned_at, Date, nil?: true

              # @!attribute credit_expected_at
              #   Credit expected at.
              #
              #   @return [Date, nil]
              required :credit_expected_at, Date, nil?: true

              # @!method initialize(canceled_or_returned_at:, credit_expected_at:)
              #   Credit not processed. Present if and only if `category` is
              #   `consumer_credit_not_processed`.
              #
              #   @param canceled_or_returned_at [Date, nil] Canceled or returned at.
              #
              #   @param credit_expected_at [Date, nil] Credit expected at.
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_damaged_or_defective_merchandise
            class ConsumerDamagedOrDefectiveMerchandise < Increase::Internal::Type::BaseModel
              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted }

              # @!attribute not_returned
              #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned, nil]
              required :not_returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned
                       },
                       nil?: true

              # @!attribute order_and_issue_explanation
              #   Order and issue explanation.
              #
              #   @return [String]
              required :order_and_issue_explanation, String

              # @!attribute received_at
              #   Received at.
              #
              #   @return [Date]
              required :received_at, Date

              # @!attribute return_attempted
              #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted, nil]
              required :return_attempted,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted
                       },
                       nil?: true

              # @!attribute return_outcome
              #   Return outcome.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome]
              required :return_outcome,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome }

              # @!attribute returned
              #   Returned. Present if and only if `return_outcome` is `returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned, nil]
              required :returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned
                       },
                       nil?: true

              # @!method initialize(merchant_resolution_attempted:, not_returned:, order_and_issue_explanation:, received_at:, return_attempted:, return_outcome:, returned:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise}
              #   for more details.
              #
              #   Damaged or defective merchandise. Present if and only if `category` is
              #   `consumer_damaged_or_defective_merchandise`.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param not_returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned, nil] Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @param order_and_issue_explanation [String] Order and issue explanation.
              #
              #   @param received_at [Date] Received at.
              #
              #   @param return_attempted [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted, nil] Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @param return_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome] Return outcome.
              #
              #   @param returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned, nil] Returned. Present if and only if `return_outcome` is `returned`.

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise#not_returned
              class NotReturned < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise#return_attempted
              class ReturnAttempted < Increase::Internal::Type::BaseModel
                # @!attribute attempt_explanation
                #   Attempt explanation.
                #
                #   @return [String]
                required :attempt_explanation, String

                # @!attribute attempt_reason
                #   Attempt reason.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason]
                required :attempt_reason,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason }

                # @!attribute attempted_at
                #   Attempted at.
                #
                #   @return [Date]
                required :attempted_at, Date

                # @!attribute merchandise_disposition
                #   Merchandise disposition.
                #
                #   @return [String]
                required :merchandise_disposition, String

                # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
                #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                #
                #   @param attempt_explanation [String] Attempt explanation.
                #
                #   @param attempt_reason [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
                #
                #   @param attempted_at [Date] Attempted at.
                #
                #   @param merchandise_disposition [String] Merchandise disposition.

                # Attempt reason.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted#attempt_reason
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING = :merchant_not_responding

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS = :no_return_instructions

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED = :return_not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Return outcome.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise#return_outcome
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                # Not returned.
                NOT_RETURNED = :not_returned

                # Returned.
                RETURNED = :returned

                # Return attempted.
                RETURN_ATTEMPTED = :return_attempted

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise#returned
              class Returned < Increase::Internal::Type::BaseModel
                # @!attribute merchant_received_return_at
                #   Merchant received return at.
                #
                #   @return [Date, nil]
                required :merchant_received_return_at, Date, nil?: true

                # @!attribute other_explanation
                #   Other explanation. Required if and only if the return method is `other`.
                #
                #   @return [String, nil]
                required :other_explanation, String, nil?: true

                # @!attribute return_method
                #   Return method.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod]
                required :return_method,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod }

                # @!attribute returned_at
                #   Returned at.
                #
                #   @return [Date]
                required :returned_at, Date

                # @!attribute tracking_number
                #   Tracking number.
                #
                #   @return [String, nil]
                required :tracking_number, String, nil?: true

                # @!method initialize(merchant_received_return_at:, other_explanation:, return_method:, returned_at:, tracking_number:)
                #   Returned. Present if and only if `return_outcome` is `returned`.
                #
                #   @param merchant_received_return_at [Date, nil] Merchant received return at.
                #
                #   @param other_explanation [String, nil] Other explanation. Required if and only if the return method is `other`.
                #
                #   @param return_method [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod] Return method.
                #
                #   @param returned_at [Date] Returned at.
                #
                #   @param tracking_number [String, nil] Tracking number.

                # Return method.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned#return_method
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  # DHL.
                  DHL = :dhl

                  # Face-to-face.
                  FACE_TO_FACE = :face_to_face

                  # FedEx.
                  FEDEX = :fedex

                  # Other.
                  OTHER = :other

                  # Postal service.
                  POSTAL_SERVICE = :postal_service

                  # UPS.
                  UPS = :ups

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_merchandise_misrepresentation
            class ConsumerMerchandiseMisrepresentation < Increase::Internal::Type::BaseModel
              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted }

              # @!attribute misrepresentation_explanation
              #   Misrepresentation explanation.
              #
              #   @return [String]
              required :misrepresentation_explanation, String

              # @!attribute not_returned
              #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned, nil]
              required :not_returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned
                       },
                       nil?: true

              # @!attribute purchase_explanation
              #   Purchase explanation.
              #
              #   @return [String]
              required :purchase_explanation, String

              # @!attribute received_at
              #   Received at.
              #
              #   @return [Date]
              required :received_at, Date

              # @!attribute return_attempted
              #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted, nil]
              required :return_attempted,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted
                       },
                       nil?: true

              # @!attribute return_outcome
              #   Return outcome.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome]
              required :return_outcome,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome }

              # @!attribute returned
              #   Returned. Present if and only if `return_outcome` is `returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned, nil]
              required :returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned
                       },
                       nil?: true

              # @!method initialize(merchant_resolution_attempted:, misrepresentation_explanation:, not_returned:, purchase_explanation:, received_at:, return_attempted:, return_outcome:, returned:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation}
              #   for more details.
              #
              #   Merchandise misrepresentation. Present if and only if `category` is
              #   `consumer_merchandise_misrepresentation`.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param misrepresentation_explanation [String] Misrepresentation explanation.
              #
              #   @param not_returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned, nil] Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @param purchase_explanation [String] Purchase explanation.
              #
              #   @param received_at [Date] Received at.
              #
              #   @param return_attempted [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted, nil] Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @param return_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome] Return outcome.
              #
              #   @param returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned, nil] Returned. Present if and only if `return_outcome` is `returned`.

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation#not_returned
              class NotReturned < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation#return_attempted
              class ReturnAttempted < Increase::Internal::Type::BaseModel
                # @!attribute attempt_explanation
                #   Attempt explanation.
                #
                #   @return [String]
                required :attempt_explanation, String

                # @!attribute attempt_reason
                #   Attempt reason.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason]
                required :attempt_reason,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason }

                # @!attribute attempted_at
                #   Attempted at.
                #
                #   @return [Date]
                required :attempted_at, Date

                # @!attribute merchandise_disposition
                #   Merchandise disposition.
                #
                #   @return [String]
                required :merchandise_disposition, String

                # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
                #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                #
                #   @param attempt_explanation [String] Attempt explanation.
                #
                #   @param attempt_reason [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason] Attempt reason.
                #
                #   @param attempted_at [Date] Attempted at.
                #
                #   @param merchandise_disposition [String] Merchandise disposition.

                # Attempt reason.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted#attempt_reason
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING = :merchant_not_responding

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS = :no_return_instructions

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED = :return_not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Return outcome.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation#return_outcome
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                # Not returned.
                NOT_RETURNED = :not_returned

                # Returned.
                RETURNED = :returned

                # Return attempted.
                RETURN_ATTEMPTED = :return_attempted

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation#returned
              class Returned < Increase::Internal::Type::BaseModel
                # @!attribute merchant_received_return_at
                #   Merchant received return at.
                #
                #   @return [Date, nil]
                required :merchant_received_return_at, Date, nil?: true

                # @!attribute other_explanation
                #   Other explanation. Required if and only if the return method is `other`.
                #
                #   @return [String, nil]
                required :other_explanation, String, nil?: true

                # @!attribute return_method
                #   Return method.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod]
                required :return_method,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod }

                # @!attribute returned_at
                #   Returned at.
                #
                #   @return [Date]
                required :returned_at, Date

                # @!attribute tracking_number
                #   Tracking number.
                #
                #   @return [String, nil]
                required :tracking_number, String, nil?: true

                # @!method initialize(merchant_received_return_at:, other_explanation:, return_method:, returned_at:, tracking_number:)
                #   Returned. Present if and only if `return_outcome` is `returned`.
                #
                #   @param merchant_received_return_at [Date, nil] Merchant received return at.
                #
                #   @param other_explanation [String, nil] Other explanation. Required if and only if the return method is `other`.
                #
                #   @param return_method [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod] Return method.
                #
                #   @param returned_at [Date] Returned at.
                #
                #   @param tracking_number [String, nil] Tracking number.

                # Return method.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned#return_method
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  # DHL.
                  DHL = :dhl

                  # Face-to-face.
                  FACE_TO_FACE = :face_to_face

                  # FedEx.
                  FEDEX = :fedex

                  # Other.
                  OTHER = :other

                  # Postal service.
                  POSTAL_SERVICE = :postal_service

                  # UPS.
                  UPS = :ups

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_merchandise_not_as_described
            class ConsumerMerchandiseNotAsDescribed < Increase::Internal::Type::BaseModel
              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted }

              # @!attribute received_at
              #   Received at.
              #
              #   @return [Date]
              required :received_at, Date

              # @!attribute return_attempted
              #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted, nil]
              required :return_attempted,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted
                       },
                       nil?: true

              # @!attribute return_outcome
              #   Return outcome.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome]
              required :return_outcome,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome }

              # @!attribute returned
              #   Returned. Present if and only if `return_outcome` is `returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned, nil]
              required :returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned
                       },
                       nil?: true

              # @!method initialize(merchant_resolution_attempted:, received_at:, return_attempted:, return_outcome:, returned:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed}
              #   for more details.
              #
              #   Merchandise not as described. Present if and only if `category` is
              #   `consumer_merchandise_not_as_described`.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param received_at [Date] Received at.
              #
              #   @param return_attempted [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted, nil] Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @param return_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome] Return outcome.
              #
              #   @param returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned, nil] Returned. Present if and only if `return_outcome` is `returned`.

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed#return_attempted
              class ReturnAttempted < Increase::Internal::Type::BaseModel
                # @!attribute attempt_explanation
                #   Attempt explanation.
                #
                #   @return [String]
                required :attempt_explanation, String

                # @!attribute attempt_reason
                #   Attempt reason.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason]
                required :attempt_reason,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason }

                # @!attribute attempted_at
                #   Attempted at.
                #
                #   @return [Date]
                required :attempted_at, Date

                # @!attribute merchandise_disposition
                #   Merchandise disposition.
                #
                #   @return [String]
                required :merchandise_disposition, String

                # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
                #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                #
                #   @param attempt_explanation [String] Attempt explanation.
                #
                #   @param attempt_reason [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason] Attempt reason.
                #
                #   @param attempted_at [Date] Attempted at.
                #
                #   @param merchandise_disposition [String] Merchandise disposition.

                # Attempt reason.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted#attempt_reason
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING = :merchant_not_responding

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS = :no_return_instructions

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED = :return_not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Return outcome.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed#return_outcome
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                # Returned.
                RETURNED = :returned

                # Return attempted.
                RETURN_ATTEMPTED = :return_attempted

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed#returned
              class Returned < Increase::Internal::Type::BaseModel
                # @!attribute merchant_received_return_at
                #   Merchant received return at.
                #
                #   @return [Date, nil]
                required :merchant_received_return_at, Date, nil?: true

                # @!attribute other_explanation
                #   Other explanation. Required if and only if the return method is `other`.
                #
                #   @return [String, nil]
                required :other_explanation, String, nil?: true

                # @!attribute return_method
                #   Return method.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod]
                required :return_method,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod }

                # @!attribute returned_at
                #   Returned at.
                #
                #   @return [Date]
                required :returned_at, Date

                # @!attribute tracking_number
                #   Tracking number.
                #
                #   @return [String, nil]
                required :tracking_number, String, nil?: true

                # @!method initialize(merchant_received_return_at:, other_explanation:, return_method:, returned_at:, tracking_number:)
                #   Returned. Present if and only if `return_outcome` is `returned`.
                #
                #   @param merchant_received_return_at [Date, nil] Merchant received return at.
                #
                #   @param other_explanation [String, nil] Other explanation. Required if and only if the return method is `other`.
                #
                #   @param return_method [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod] Return method.
                #
                #   @param returned_at [Date] Returned at.
                #
                #   @param tracking_number [String, nil] Tracking number.

                # Return method.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned#return_method
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  # DHL.
                  DHL = :dhl

                  # Face-to-face.
                  FACE_TO_FACE = :face_to_face

                  # FedEx.
                  FEDEX = :fedex

                  # Other.
                  OTHER = :other

                  # Postal service.
                  POSTAL_SERVICE = :postal_service

                  # UPS.
                  UPS = :ups

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_merchandise_not_received
            class ConsumerMerchandiseNotReceived < Increase::Internal::Type::BaseModel
              # @!attribute cancellation_outcome
              #   Cancellation outcome.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome]
              required :cancellation_outcome,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome }

              # @!attribute cardholder_cancellation_prior_to_expected_receipt
              #   Cardholder cancellation prior to expected receipt. Present if and only if
              #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt, nil]
              required :cardholder_cancellation_prior_to_expected_receipt,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt
                       },
                       nil?: true

              # @!attribute delayed
              #   Delayed. Present if and only if `delivery_issue` is `delayed`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed, nil]
              required :delayed,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed
                       },
                       nil?: true

              # @!attribute delivered_to_wrong_location
              #   Delivered to wrong location. Present if and only if `delivery_issue` is
              #   `delivered_to_wrong_location`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation, nil]
              required :delivered_to_wrong_location,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation
                       },
                       nil?: true

              # @!attribute delivery_issue
              #   Delivery issue.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue]
              required :delivery_issue,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue }

              # @!attribute last_expected_receipt_at
              #   Last expected receipt at.
              #
              #   @return [Date]
              required :last_expected_receipt_at, Date

              # @!attribute merchant_cancellation
              #   Merchant cancellation. Present if and only if `cancellation_outcome` is
              #   `merchant_cancellation`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation, nil]
              required :merchant_cancellation,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation
                       },
                       nil?: true

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted }

              # @!attribute no_cancellation
              #   No cancellation. Present if and only if `cancellation_outcome` is
              #   `no_cancellation`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation, nil]
              required :no_cancellation,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation
                       },
                       nil?: true

              # @!attribute purchase_info_and_explanation
              #   Purchase information and explanation.
              #
              #   @return [String]
              required :purchase_info_and_explanation, String

              # @!method initialize(cancellation_outcome:, cardholder_cancellation_prior_to_expected_receipt:, delayed:, delivered_to_wrong_location:, delivery_issue:, last_expected_receipt_at:, merchant_cancellation:, merchant_resolution_attempted:, no_cancellation:, purchase_info_and_explanation:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived}
              #   for more details.
              #
              #   Merchandise not received. Present if and only if `category` is
              #   `consumer_merchandise_not_received`.
              #
              #   @param cancellation_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome] Cancellation outcome.
              #
              #   @param cardholder_cancellation_prior_to_expected_receipt [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt, nil] Cardholder cancellation prior to expected receipt. Present if and only if `cance
              #
              #   @param delayed [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed, nil] Delayed. Present if and only if `delivery_issue` is `delayed`.
              #
              #   @param delivered_to_wrong_location [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation, nil] Delivered to wrong location. Present if and only if `delivery_issue` is `deliver
              #
              #   @param delivery_issue [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue] Delivery issue.
              #
              #   @param last_expected_receipt_at [Date] Last expected receipt at.
              #
              #   @param merchant_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation, nil] Merchant cancellation. Present if and only if `cancellation_outcome` is `merchan
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param no_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation, nil] No cancellation. Present if and only if `cancellation_outcome` is `no_cancellati
              #
              #   @param purchase_info_and_explanation [String] Purchase information and explanation.

              # Cancellation outcome.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#cancellation_outcome
              module CancellationOutcome
                extend Increase::Internal::Type::Enum

                # Cardholder cancellation prior to expected receipt.
                CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT = :cardholder_cancellation_prior_to_expected_receipt

                # Merchant cancellation.
                MERCHANT_CANCELLATION = :merchant_cancellation

                # No cancellation.
                NO_CANCELLATION = :no_cancellation

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#cardholder_cancellation_prior_to_expected_receipt
              class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!attribute reason
                #   Reason.
                #
                #   @return [String, nil]
                required :reason, String, nil?: true

                # @!method initialize(canceled_at:, reason:)
                #   Cardholder cancellation prior to expected receipt. Present if and only if
                #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
                #
                #   @param canceled_at [Date] Canceled at.
                #
                #   @param reason [String, nil] Reason.
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#delayed
              class Delayed < Increase::Internal::Type::BaseModel
                # @!attribute explanation
                #   Explanation.
                #
                #   @return [String]
                required :explanation, String

                # @!attribute not_returned
                #   Not returned. Present if and only if `return_outcome` is `not_returned`.
                #
                #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned, nil]
                required :not_returned,
                         -> {
                           Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned
                         },
                         nil?: true

                # @!attribute return_attempted
                #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                #
                #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted, nil]
                required :return_attempted,
                         -> {
                           Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted
                         },
                         nil?: true

                # @!attribute return_outcome
                #   Return outcome.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome]
                required :return_outcome,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome }

                # @!attribute returned
                #   Returned. Present if and only if `return_outcome` is `returned`.
                #
                #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned, nil]
                required :returned,
                         -> {
                           Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned
                         },
                         nil?: true

                # @!method initialize(explanation:, not_returned:, return_attempted:, return_outcome:, returned:)
                #   Some parameter documentations has been truncated, see
                #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed}
                #   for more details.
                #
                #   Delayed. Present if and only if `delivery_issue` is `delayed`.
                #
                #   @param explanation [String] Explanation.
                #
                #   @param not_returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned, nil] Not returned. Present if and only if `return_outcome` is `not_returned`.
                #
                #   @param return_attempted [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted, nil] Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                #
                #   @param return_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome] Return outcome.
                #
                #   @param returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned, nil] Returned. Present if and only if `return_outcome` is `returned`.

                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed#not_returned
                class NotReturned < Increase::Internal::Type::BaseModel
                  # @!method initialize
                  #   Not returned. Present if and only if `return_outcome` is `not_returned`.
                end

                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed#return_attempted
                class ReturnAttempted < Increase::Internal::Type::BaseModel
                  # @!attribute attempted_at
                  #   Attempted at.
                  #
                  #   @return [Date]
                  required :attempted_at, Date

                  # @!method initialize(attempted_at:)
                  #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                  #
                  #   @param attempted_at [Date] Attempted at.
                end

                # Return outcome.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed#return_outcome
                module ReturnOutcome
                  extend Increase::Internal::Type::Enum

                  # Not returned.
                  NOT_RETURNED = :not_returned

                  # Returned.
                  RETURNED = :returned

                  # Return attempted.
                  RETURN_ATTEMPTED = :return_attempted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed#returned
                class Returned < Increase::Internal::Type::BaseModel
                  # @!attribute merchant_received_return_at
                  #   Merchant received return at.
                  #
                  #   @return [Date]
                  required :merchant_received_return_at, Date

                  # @!attribute returned_at
                  #   Returned at.
                  #
                  #   @return [Date]
                  required :returned_at, Date

                  # @!method initialize(merchant_received_return_at:, returned_at:)
                  #   Returned. Present if and only if `return_outcome` is `returned`.
                  #
                  #   @param merchant_received_return_at [Date] Merchant received return at.
                  #
                  #   @param returned_at [Date] Returned at.
                end
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#delivered_to_wrong_location
              class DeliveredToWrongLocation < Increase::Internal::Type::BaseModel
                # @!attribute agreed_location
                #   Agreed location.
                #
                #   @return [String]
                required :agreed_location, String

                # @!method initialize(agreed_location:)
                #   Delivered to wrong location. Present if and only if `delivery_issue` is
                #   `delivered_to_wrong_location`.
                #
                #   @param agreed_location [String] Agreed location.
              end

              # Delivery issue.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#delivery_issue
              module DeliveryIssue
                extend Increase::Internal::Type::Enum

                # Delayed.
                DELAYED = :delayed

                # Delivered to wrong location.
                DELIVERED_TO_WRONG_LOCATION = :delivered_to_wrong_location

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#merchant_cancellation
              class MerchantCancellation < Increase::Internal::Type::BaseModel
                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!method initialize(canceled_at:)
                #   Merchant cancellation. Present if and only if `cancellation_outcome` is
                #   `merchant_cancellation`.
                #
                #   @param canceled_at [Date] Canceled at.
              end

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived#no_cancellation
              class NoCancellation < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   No cancellation. Present if and only if `cancellation_outcome` is
                #   `no_cancellation`.
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_non_receipt_of_cash
            class ConsumerNonReceiptOfCash < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Non-receipt of cash. Present if and only if `category` is
              #   `consumer_non_receipt_of_cash`.
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_original_credit_transaction_not_accepted
            class ConsumerOriginalCreditTransactionNotAccepted < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation.
              #
              #   @return [String]
              required :explanation, String

              # @!attribute reason
              #   Reason.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason]
              required :reason,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason }

              # @!method initialize(explanation:, reason:)
              #   Original Credit Transaction (OCT) not accepted. Present if and only if
              #   `category` is `consumer_original_credit_transaction_not_accepted`.
              #
              #   @param explanation [String] Explanation.
              #
              #   @param reason [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason] Reason.

              # Reason.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted#reason
              module Reason
                extend Increase::Internal::Type::Enum

                # Prohibited by local laws or regulation.
                PROHIBITED_BY_LOCAL_LAWS_OR_REGULATION = :prohibited_by_local_laws_or_regulation

                # Recipient refused.
                RECIPIENT_REFUSED = :recipient_refused

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_quality_merchandise
            class ConsumerQualityMerchandise < Increase::Internal::Type::BaseModel
              # @!attribute expected_at
              #   Expected at.
              #
              #   @return [Date]
              required :expected_at, Date

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted }

              # @!attribute not_returned
              #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned, nil]
              required :not_returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned
                       },
                       nil?: true

              # @!attribute ongoing_negotiations
              #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations, nil]
              required :ongoing_negotiations,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations
                       },
                       nil?: true

              # @!attribute purchase_info_and_quality_issue
              #   Purchase information and quality issue.
              #
              #   @return [String]
              required :purchase_info_and_quality_issue, String

              # @!attribute received_at
              #   Received at.
              #
              #   @return [Date]
              required :received_at, Date

              # @!attribute return_attempted
              #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted, nil]
              required :return_attempted,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted
                       },
                       nil?: true

              # @!attribute return_outcome
              #   Return outcome.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome]
              required :return_outcome,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome }

              # @!attribute returned
              #   Returned. Present if and only if `return_outcome` is `returned`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned, nil]
              required :returned,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned
                       },
                       nil?: true

              # @!method initialize(expected_at:, merchant_resolution_attempted:, not_returned:, ongoing_negotiations:, purchase_info_and_quality_issue:, received_at:, return_attempted:, return_outcome:, returned:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise}
              #   for more details.
              #
              #   Merchandise quality issue. Present if and only if `category` is
              #   `consumer_quality_merchandise`.
              #
              #   @param expected_at [Date] Expected at.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param not_returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned, nil] Not returned. Present if and only if `return_outcome` is `not_returned`.
              #
              #   @param ongoing_negotiations [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations, nil] Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              #
              #   @param purchase_info_and_quality_issue [String] Purchase information and quality issue.
              #
              #   @param received_at [Date] Received at.
              #
              #   @param return_attempted [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted, nil] Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              #
              #   @param return_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome] Return outcome.
              #
              #   @param returned [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned, nil] Returned. Present if and only if `return_outcome` is `returned`.

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise#not_returned
              class NotReturned < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   Not returned. Present if and only if `return_outcome` is `not_returned`.
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise#ongoing_negotiations
              class OngoingNegotiations < Increase::Internal::Type::BaseModel
                # @!attribute explanation
                #   Explanation of the previous ongoing negotiations between the cardholder and
                #   merchant.
                #
                #   @return [String]
                required :explanation, String

                # @!attribute issuer_first_notified_at
                #   Date the cardholder first notified the issuer of the dispute.
                #
                #   @return [Date]
                required :issuer_first_notified_at, Date

                # @!attribute started_at
                #   Started at.
                #
                #   @return [Date]
                required :started_at, Date

                # @!method initialize(explanation:, issuer_first_notified_at:, started_at:)
                #   Some parameter documentations has been truncated, see
                #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations}
                #   for more details.
                #
                #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
                #
                #   @param explanation [String] Explanation of the previous ongoing negotiations between the cardholder and merc
                #
                #   @param issuer_first_notified_at [Date] Date the cardholder first notified the issuer of the dispute.
                #
                #   @param started_at [Date] Started at.
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise#return_attempted
              class ReturnAttempted < Increase::Internal::Type::BaseModel
                # @!attribute attempt_explanation
                #   Attempt explanation.
                #
                #   @return [String]
                required :attempt_explanation, String

                # @!attribute attempt_reason
                #   Attempt reason.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason]
                required :attempt_reason,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason }

                # @!attribute attempted_at
                #   Attempted at.
                #
                #   @return [Date]
                required :attempted_at, Date

                # @!attribute merchandise_disposition
                #   Merchandise disposition.
                #
                #   @return [String]
                required :merchandise_disposition, String

                # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
                #   Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                #
                #   @param attempt_explanation [String] Attempt explanation.
                #
                #   @param attempt_reason [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
                #
                #   @param attempted_at [Date] Attempted at.
                #
                #   @param merchandise_disposition [String] Merchandise disposition.

                # Attempt reason.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted#attempt_reason
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING = :merchant_not_responding

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS = :no_return_instructions

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED = :return_not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Return outcome.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise#return_outcome
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                # Not returned.
                NOT_RETURNED = :not_returned

                # Returned.
                RETURNED = :returned

                # Return attempted.
                RETURN_ATTEMPTED = :return_attempted

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise#returned
              class Returned < Increase::Internal::Type::BaseModel
                # @!attribute merchant_received_return_at
                #   Merchant received return at.
                #
                #   @return [Date, nil]
                required :merchant_received_return_at, Date, nil?: true

                # @!attribute other_explanation
                #   Other explanation. Required if and only if the return method is `other`.
                #
                #   @return [String, nil]
                required :other_explanation, String, nil?: true

                # @!attribute return_method
                #   Return method.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod]
                required :return_method,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod }

                # @!attribute returned_at
                #   Returned at.
                #
                #   @return [Date]
                required :returned_at, Date

                # @!attribute tracking_number
                #   Tracking number.
                #
                #   @return [String, nil]
                required :tracking_number, String, nil?: true

                # @!method initialize(merchant_received_return_at:, other_explanation:, return_method:, returned_at:, tracking_number:)
                #   Returned. Present if and only if `return_outcome` is `returned`.
                #
                #   @param merchant_received_return_at [Date, nil] Merchant received return at.
                #
                #   @param other_explanation [String, nil] Other explanation. Required if and only if the return method is `other`.
                #
                #   @param return_method [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod] Return method.
                #
                #   @param returned_at [Date] Returned at.
                #
                #   @param tracking_number [String, nil] Tracking number.

                # Return method.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned#return_method
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  # DHL.
                  DHL = :dhl

                  # Face-to-face.
                  FACE_TO_FACE = :face_to_face

                  # FedEx.
                  FEDEX = :fedex

                  # Other.
                  OTHER = :other

                  # Postal service.
                  POSTAL_SERVICE = :postal_service

                  # UPS.
                  UPS = :ups

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_quality_services
            class ConsumerQualityServices < Increase::Internal::Type::BaseModel
              # @!attribute cardholder_cancellation
              #   Cardholder cancellation.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation]
              required :cardholder_cancellation,
                       -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation }

              # @!attribute cardholder_paid_to_have_work_redone
              #   Cardholder paid to have work redone.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone, nil]
              required :cardholder_paid_to_have_work_redone,
                       enum: -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone
                       },
                       nil?: true

              # @!attribute non_fiat_currency_or_non_fungible_token_related_and_not_matching_description
              #   Non-fiat currency or non-fungible token related and not matching description.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription]
              required :non_fiat_currency_or_non_fungible_token_related_and_not_matching_description,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription }

              # @!attribute ongoing_negotiations
              #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations, nil]
              required :ongoing_negotiations,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations
                       },
                       nil?: true

              # @!attribute purchase_info_and_quality_issue
              #   Purchase information and quality issue.
              #
              #   @return [String]
              required :purchase_info_and_quality_issue, String

              # @!attribute restaurant_food_related
              #   Whether the dispute is related to the quality of food from an eating place or
              #   restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
              #   or 5814.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated, nil]
              required :restaurant_food_related,
                       enum: -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated
                       },
                       nil?: true

              # @!attribute services_received_at
              #   Services received at.
              #
              #   @return [Date]
              required :services_received_at, Date

              # @!method initialize(cardholder_cancellation:, cardholder_paid_to_have_work_redone:, non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:, ongoing_negotiations:, purchase_info_and_quality_issue:, restaurant_food_related:, services_received_at:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices}
              #   for more details.
              #
              #   Services quality issue. Present if and only if `category` is
              #   `consumer_quality_services`.
              #
              #   @param cardholder_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation] Cardholder cancellation.
              #
              #   @param cardholder_paid_to_have_work_redone [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone, nil] Cardholder paid to have work redone.
              #
              #   @param non_fiat_currency_or_non_fungible_token_related_and_not_matching_description [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription] Non-fiat currency or non-fungible token related and not matching description.
              #
              #   @param ongoing_negotiations [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations, nil] Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              #
              #   @param purchase_info_and_quality_issue [String] Purchase information and quality issue.
              #
              #   @param restaurant_food_related [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated, nil] Whether the dispute is related to the quality of food from an eating place or re
              #
              #   @param services_received_at [Date] Services received at.

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices#cardholder_cancellation
              class CardholderCancellation < Increase::Internal::Type::BaseModel
                # @!attribute accepted_by_merchant
                #   Accepted by merchant.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant]
                required :accepted_by_merchant,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant }

                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!attribute reason
                #   Reason.
                #
                #   @return [String]
                required :reason, String

                # @!method initialize(accepted_by_merchant:, canceled_at:, reason:)
                #   Cardholder cancellation.
                #
                #   @param accepted_by_merchant [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
                #
                #   @param canceled_at [Date] Canceled at.
                #
                #   @param reason [String] Reason.

                # Accepted by merchant.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation#accepted_by_merchant
                module AcceptedByMerchant
                  extend Increase::Internal::Type::Enum

                  # Accepted.
                  ACCEPTED = :accepted

                  # Not accepted.
                  NOT_ACCEPTED = :not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Cardholder paid to have work redone.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices#cardholder_paid_to_have_work_redone
              module CardholderPaidToHaveWorkRedone
                extend Increase::Internal::Type::Enum

                # Cardholder did not pay to have work redone.
                DID_NOT_PAY_TO_HAVE_WORK_REDONE = :did_not_pay_to_have_work_redone

                # Cardholder paid to have work redone.
                PAID_TO_HAVE_WORK_REDONE = :paid_to_have_work_redone

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Non-fiat currency or non-fungible token related and not matching description.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices#non_fiat_currency_or_non_fungible_token_related_and_not_matching_description
              module NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription
                extend Increase::Internal::Type::Enum

                # Not related.
                NOT_RELATED = :not_related

                # Related.
                RELATED = :related

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices#ongoing_negotiations
              class OngoingNegotiations < Increase::Internal::Type::BaseModel
                # @!attribute explanation
                #   Explanation of the previous ongoing negotiations between the cardholder and
                #   merchant.
                #
                #   @return [String]
                required :explanation, String

                # @!attribute issuer_first_notified_at
                #   Date the cardholder first notified the issuer of the dispute.
                #
                #   @return [Date]
                required :issuer_first_notified_at, Date

                # @!attribute started_at
                #   Started at.
                #
                #   @return [Date]
                required :started_at, Date

                # @!method initialize(explanation:, issuer_first_notified_at:, started_at:)
                #   Some parameter documentations has been truncated, see
                #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations}
                #   for more details.
                #
                #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
                #
                #   @param explanation [String] Explanation of the previous ongoing negotiations between the cardholder and merc
                #
                #   @param issuer_first_notified_at [Date] Date the cardholder first notified the issuer of the dispute.
                #
                #   @param started_at [Date] Started at.
              end

              # Whether the dispute is related to the quality of food from an eating place or
              # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
              # or 5814.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices#restaurant_food_related
              module RestaurantFoodRelated
                extend Increase::Internal::Type::Enum

                # Not related.
                NOT_RELATED = :not_related

                # Related.
                RELATED = :related

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_services_misrepresentation
            class ConsumerServicesMisrepresentation < Increase::Internal::Type::BaseModel
              # @!attribute cardholder_cancellation
              #   Cardholder cancellation.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation]
              required :cardholder_cancellation,
                       -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation }

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted }

              # @!attribute misrepresentation_explanation
              #   Misrepresentation explanation.
              #
              #   @return [String]
              required :misrepresentation_explanation, String

              # @!attribute purchase_explanation
              #   Purchase explanation.
              #
              #   @return [String]
              required :purchase_explanation, String

              # @!attribute received_at
              #   Received at.
              #
              #   @return [Date]
              required :received_at, Date

              # @!method initialize(cardholder_cancellation:, merchant_resolution_attempted:, misrepresentation_explanation:, purchase_explanation:, received_at:)
              #   Services misrepresentation. Present if and only if `category` is
              #   `consumer_services_misrepresentation`.
              #
              #   @param cardholder_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation] Cardholder cancellation.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param misrepresentation_explanation [String] Misrepresentation explanation.
              #
              #   @param purchase_explanation [String] Purchase explanation.
              #
              #   @param received_at [Date] Received at.

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation#cardholder_cancellation
              class CardholderCancellation < Increase::Internal::Type::BaseModel
                # @!attribute accepted_by_merchant
                #   Accepted by merchant.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant]
                required :accepted_by_merchant,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant }

                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!attribute reason
                #   Reason.
                #
                #   @return [String]
                required :reason, String

                # @!method initialize(accepted_by_merchant:, canceled_at:, reason:)
                #   Cardholder cancellation.
                #
                #   @param accepted_by_merchant [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
                #
                #   @param canceled_at [Date] Canceled at.
                #
                #   @param reason [String] Reason.

                # Accepted by merchant.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation#accepted_by_merchant
                module AcceptedByMerchant
                  extend Increase::Internal::Type::Enum

                  # Accepted.
                  ACCEPTED = :accepted

                  # Not accepted.
                  NOT_ACCEPTED = :not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_services_not_as_described
            class ConsumerServicesNotAsDescribed < Increase::Internal::Type::BaseModel
              # @!attribute cardholder_cancellation
              #   Cardholder cancellation.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation]
              required :cardholder_cancellation,
                       -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation }

              # @!attribute explanation
              #   Explanation of what was ordered and was not as described.
              #
              #   @return [String]
              required :explanation, String

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted }

              # @!attribute received_at
              #   Received at.
              #
              #   @return [Date]
              required :received_at, Date

              # @!method initialize(cardholder_cancellation:, explanation:, merchant_resolution_attempted:, received_at:)
              #   Services not as described. Present if and only if `category` is
              #   `consumer_services_not_as_described`.
              #
              #   @param cardholder_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation] Cardholder cancellation.
              #
              #   @param explanation [String] Explanation of what was ordered and was not as described.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param received_at [Date] Received at.

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed#cardholder_cancellation
              class CardholderCancellation < Increase::Internal::Type::BaseModel
                # @!attribute accepted_by_merchant
                #   Accepted by merchant.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant]
                required :accepted_by_merchant,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant }

                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!attribute reason
                #   Reason.
                #
                #   @return [String]
                required :reason, String

                # @!method initialize(accepted_by_merchant:, canceled_at:, reason:)
                #   Cardholder cancellation.
                #
                #   @param accepted_by_merchant [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
                #
                #   @param canceled_at [Date] Canceled at.
                #
                #   @param reason [String] Reason.

                # Accepted by merchant.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation#accepted_by_merchant
                module AcceptedByMerchant
                  extend Increase::Internal::Type::Enum

                  # Accepted.
                  ACCEPTED = :accepted

                  # Not accepted.
                  NOT_ACCEPTED = :not_accepted

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#consumer_services_not_received
            class ConsumerServicesNotReceived < Increase::Internal::Type::BaseModel
              # @!attribute cancellation_outcome
              #   Cancellation outcome.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome]
              required :cancellation_outcome,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome }

              # @!attribute cardholder_cancellation_prior_to_expected_receipt
              #   Cardholder cancellation prior to expected receipt. Present if and only if
              #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt, nil]
              required :cardholder_cancellation_prior_to_expected_receipt,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt
                       },
                       nil?: true

              # @!attribute last_expected_receipt_at
              #   Last expected receipt at.
              #
              #   @return [Date]
              required :last_expected_receipt_at, Date

              # @!attribute merchant_cancellation
              #   Merchant cancellation. Present if and only if `cancellation_outcome` is
              #   `merchant_cancellation`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation, nil]
              required :merchant_cancellation,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation
                       },
                       nil?: true

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted }

              # @!attribute no_cancellation
              #   No cancellation. Present if and only if `cancellation_outcome` is
              #   `no_cancellation`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation, nil]
              required :no_cancellation,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation
                       },
                       nil?: true

              # @!attribute purchase_info_and_explanation
              #   Purchase information and explanation.
              #
              #   @return [String]
              required :purchase_info_and_explanation, String

              # @!method initialize(cancellation_outcome:, cardholder_cancellation_prior_to_expected_receipt:, last_expected_receipt_at:, merchant_cancellation:, merchant_resolution_attempted:, no_cancellation:, purchase_info_and_explanation:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived}
              #   for more details.
              #
              #   Services not received. Present if and only if `category` is
              #   `consumer_services_not_received`.
              #
              #   @param cancellation_outcome [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome] Cancellation outcome.
              #
              #   @param cardholder_cancellation_prior_to_expected_receipt [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt, nil] Cardholder cancellation prior to expected receipt. Present if and only if `cance
              #
              #   @param last_expected_receipt_at [Date] Last expected receipt at.
              #
              #   @param merchant_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation, nil] Merchant cancellation. Present if and only if `cancellation_outcome` is `merchan
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param no_cancellation [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation, nil] No cancellation. Present if and only if `cancellation_outcome` is `no_cancellati
              #
              #   @param purchase_info_and_explanation [String] Purchase information and explanation.

              # Cancellation outcome.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived#cancellation_outcome
              module CancellationOutcome
                extend Increase::Internal::Type::Enum

                # Cardholder cancellation prior to expected receipt.
                CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT = :cardholder_cancellation_prior_to_expected_receipt

                # Merchant cancellation.
                MERCHANT_CANCELLATION = :merchant_cancellation

                # No cancellation.
                NO_CANCELLATION = :no_cancellation

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived#cardholder_cancellation_prior_to_expected_receipt
              class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!attribute reason
                #   Reason.
                #
                #   @return [String, nil]
                required :reason, String, nil?: true

                # @!method initialize(canceled_at:, reason:)
                #   Cardholder cancellation prior to expected receipt. Present if and only if
                #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
                #
                #   @param canceled_at [Date] Canceled at.
                #
                #   @param reason [String, nil] Reason.
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived#merchant_cancellation
              class MerchantCancellation < Increase::Internal::Type::BaseModel
                # @!attribute canceled_at
                #   Canceled at.
                #
                #   @return [Date]
                required :canceled_at, Date

                # @!method initialize(canceled_at:)
                #   Merchant cancellation. Present if and only if `cancellation_outcome` is
                #   `merchant_cancellation`.
                #
                #   @param canceled_at [Date] Canceled at.
              end

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived#no_cancellation
              class NoCancellation < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   No cancellation. Present if and only if `cancellation_outcome` is
                #   `no_cancellation`.
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#fraud
            class Fraud < Increase::Internal::Type::BaseModel
              # @!attribute fraud_type
              #   Fraud type.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType]
              required :fraud_type,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType }

              # @!method initialize(fraud_type:)
              #   Fraud. Present if and only if `category` is `fraud`.
              #
              #   @param fraud_type [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType] Fraud type.

              # Fraud type.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::Fraud#fraud_type
              module FraudType
                extend Increase::Internal::Type::Enum

                # Account or credentials takeover.
                ACCOUNT_OR_CREDENTIALS_TAKEOVER = :account_or_credentials_takeover

                # Card not received as issued.
                CARD_NOT_RECEIVED_AS_ISSUED = :card_not_received_as_issued

                # Fraudulent application.
                FRAUDULENT_APPLICATION = :fraudulent_application

                # Fraudulent use of account number.
                FRAUDULENT_USE_OF_ACCOUNT_NUMBER = :fraudulent_use_of_account_number

                # Incorrect processing.
                INCORRECT_PROCESSING = :incorrect_processing

                # Issuer reported counterfeit.
                ISSUER_REPORTED_COUNTERFEIT = :issuer_reported_counterfeit

                # Lost.
                LOST = :lost

                # Manipulation of account holder.
                MANIPULATION_OF_ACCOUNT_HOLDER = :manipulation_of_account_holder

                # Merchant misrepresentation.
                MERCHANT_MISREPRESENTATION = :merchant_misrepresentation

                # Miscellaneous.
                MISCELLANEOUS = :miscellaneous

                # Stolen.
                STOLEN = :stolen

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback#processing_error
            class ProcessingError < Increase::Internal::Type::BaseModel
              # @!attribute duplicate_transaction
              #   Duplicate transaction. Present if and only if `error_reason` is
              #   `duplicate_transaction`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction, nil]
              required :duplicate_transaction,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction
                       },
                       nil?: true

              # @!attribute error_reason
              #   Error reason.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason]
              required :error_reason,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason }

              # @!attribute incorrect_amount
              #   Incorrect amount. Present if and only if `error_reason` is `incorrect_amount`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount, nil]
              required :incorrect_amount,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount
                       },
                       nil?: true

              # @!attribute merchant_resolution_attempted
              #   Merchant resolution attempted.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted]
              required :merchant_resolution_attempted,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted }

              # @!attribute paid_by_other_means
              #   Paid by other means. Present if and only if `error_reason` is
              #   `paid_by_other_means`.
              #
              #   @return [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans, nil]
              required :paid_by_other_means,
                       -> {
                         Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans
                       },
                       nil?: true

              # @!method initialize(duplicate_transaction:, error_reason:, incorrect_amount:, merchant_resolution_attempted:, paid_by_other_means:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError}
              #   for more details.
              #
              #   Processing error. Present if and only if `category` is `processing_error`.
              #
              #   @param duplicate_transaction [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction, nil] Duplicate transaction. Present if and only if `error_reason` is `duplicate_trans
              #
              #   @param error_reason [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason] Error reason.
              #
              #   @param incorrect_amount [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount, nil] Incorrect amount. Present if and only if `error_reason` is `incorrect_amount`.
              #
              #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted] Merchant resolution attempted.
              #
              #   @param paid_by_other_means [Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans, nil] Paid by other means. Present if and only if `error_reason` is `paid_by_other_mea

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError#duplicate_transaction
              class DuplicateTransaction < Increase::Internal::Type::BaseModel
                # @!attribute other_transaction_id
                #   Other transaction ID.
                #
                #   @return [String]
                required :other_transaction_id, String

                # @!method initialize(other_transaction_id:)
                #   Duplicate transaction. Present if and only if `error_reason` is
                #   `duplicate_transaction`.
                #
                #   @param other_transaction_id [String] Other transaction ID.
              end

              # Error reason.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError#error_reason
              module ErrorReason
                extend Increase::Internal::Type::Enum

                # Duplicate transaction.
                DUPLICATE_TRANSACTION = :duplicate_transaction

                # Incorrect amount.
                INCORRECT_AMOUNT = :incorrect_amount

                # Paid by other means.
                PAID_BY_OTHER_MEANS = :paid_by_other_means

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError#incorrect_amount
              class IncorrectAmount < Increase::Internal::Type::BaseModel
                # @!attribute expected_amount
                #   Expected amount.
                #
                #   @return [Integer]
                required :expected_amount, Integer

                # @!method initialize(expected_amount:)
                #   Incorrect amount. Present if and only if `error_reason` is `incorrect_amount`.
                #
                #   @param expected_amount [Integer] Expected amount.
              end

              # Merchant resolution attempted.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError#merchant_resolution_attempted
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                # Attempted.
                ATTEMPTED = :attempted

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError#paid_by_other_means
              class PaidByOtherMeans < Increase::Internal::Type::BaseModel
                # @!attribute other_form_of_payment_evidence
                #   Other form of payment evidence.
                #
                #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence]
                required :other_form_of_payment_evidence,
                         enum: -> { Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence }

                # @!attribute other_transaction_id
                #   Other transaction ID.
                #
                #   @return [String, nil]
                required :other_transaction_id, String, nil?: true

                # @!method initialize(other_form_of_payment_evidence:, other_transaction_id:)
                #   Paid by other means. Present if and only if `error_reason` is
                #   `paid_by_other_means`.
                #
                #   @param other_form_of_payment_evidence [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence] Other form of payment evidence.
                #
                #   @param other_transaction_id [String, nil] Other transaction ID.

                # Other form of payment evidence.
                #
                # @see Increase::Models::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans#other_form_of_payment_evidence
                module OtherFormOfPaymentEvidence
                  extend Increase::Internal::Type::Enum

                  # Canceled check.
                  CANCELED_CHECK = :canceled_check

                  # Card transaction.
                  CARD_TRANSACTION = :card_transaction

                  # Cash receipt.
                  CASH_RECEIPT = :cash_receipt

                  # Other.
                  OTHER = :other

                  # Statement.
                  STATEMENT = :statement

                  # Voucher.
                  VOUCHER = :voucher

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end
          end

          # @see Increase::Models::CardDispute::Visa::UserSubmission#merchant_prearbitration_decline
          class MerchantPrearbitrationDecline < Increase::Internal::Type::BaseModel
            # @!attribute reason
            #   The reason the user declined the merchant's request for pre-arbitration in their
            #   favor.
            #
            #   @return [String]
            required :reason, String

            # @!method initialize(reason:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline}
            #   for more details.
            #
            #   A Visa Card Dispute Merchant Pre-Arbitration Decline User Submission object.
            #   This field will be present in the JSON response if and only if `category` is
            #   equal to `merchant_prearbitration_decline`. Contains the details specific to a
            #   merchant prearbitration decline Visa Card Dispute User Submission.
            #
            #   @param reason [String] The reason the user declined the merchant's request for pre-arbitration in their
          end

          # @see Increase::Models::CardDispute::Visa::UserSubmission#user_prearbitration
          class UserPrearbitration < Increase::Internal::Type::BaseModel
            # @!attribute category_change
            #   Category change details for the pre-arbitration request, if requested.
            #
            #   @return [Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange, nil]
            required :category_change,
                     -> { Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange },
                     nil?: true

            # @!attribute reason
            #   The reason for the pre-arbitration request.
            #
            #   @return [String]
            required :reason, String

            # @!method initialize(category_change:, reason:)
            #   A Visa Card Dispute User-Initiated Pre-Arbitration User Submission object. This
            #   field will be present in the JSON response if and only if `category` is equal to
            #   `user_prearbitration`. Contains the details specific to a user-initiated
            #   pre-arbitration Visa Card Dispute User Submission.
            #
            #   @param category_change [Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange, nil] Category change details for the pre-arbitration request, if requested.
            #
            #   @param reason [String] The reason for the pre-arbitration request.

            # @see Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration#category_change
            class CategoryChange < Increase::Internal::Type::BaseModel
              # @!attribute category
              #   The category the dispute is being changed to.
              #
              #   @return [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category]
              required :category,
                       enum: -> { Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category }

              # @!attribute reason
              #   The reason for the pre-arbitration request.
              #
              #   @return [String]
              required :reason, String

              # @!method initialize(category:, reason:)
              #   Category change details for the pre-arbitration request, if requested.
              #
              #   @param category [Symbol, Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category] The category the dispute is being changed to.
              #
              #   @param reason [String] The reason for the pre-arbitration request.

              # The category the dispute is being changed to.
              #
              # @see Increase::Models::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange#category
              module Category
                extend Increase::Internal::Type::Enum

                # Authorization.
                AUTHORIZATION = :authorization

                # Consumer: canceled merchandise.
                CONSUMER_CANCELED_MERCHANDISE = :consumer_canceled_merchandise

                # Consumer: canceled recurring transaction.
                CONSUMER_CANCELED_RECURRING_TRANSACTION = :consumer_canceled_recurring_transaction

                # Consumer: canceled services.
                CONSUMER_CANCELED_SERVICES = :consumer_canceled_services

                # Consumer: counterfeit merchandise.
                CONSUMER_COUNTERFEIT_MERCHANDISE = :consumer_counterfeit_merchandise

                # Consumer: credit not processed.
                CONSUMER_CREDIT_NOT_PROCESSED = :consumer_credit_not_processed

                # Consumer: damaged or defective merchandise.
                CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE = :consumer_damaged_or_defective_merchandise

                # Consumer: merchandise misrepresentation.
                CONSUMER_MERCHANDISE_MISREPRESENTATION = :consumer_merchandise_misrepresentation

                # Consumer: merchandise not as described.
                CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED = :consumer_merchandise_not_as_described

                # Consumer: merchandise not received.
                CONSUMER_MERCHANDISE_NOT_RECEIVED = :consumer_merchandise_not_received

                # Consumer: non-receipt of cash.
                CONSUMER_NON_RECEIPT_OF_CASH = :consumer_non_receipt_of_cash

                # Consumer: Original Credit Transaction (OCT) not accepted.
                CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED = :consumer_original_credit_transaction_not_accepted

                # Consumer: merchandise quality issue.
                CONSUMER_QUALITY_MERCHANDISE = :consumer_quality_merchandise

                # Consumer: services quality issue.
                CONSUMER_QUALITY_SERVICES = :consumer_quality_services

                # Consumer: services misrepresentation.
                CONSUMER_SERVICES_MISREPRESENTATION = :consumer_services_misrepresentation

                # Consumer: services not as described.
                CONSUMER_SERVICES_NOT_AS_DESCRIBED = :consumer_services_not_as_described

                # Consumer: services not received.
                CONSUMER_SERVICES_NOT_RECEIVED = :consumer_services_not_received

                # Fraud.
                FRAUD = :fraud

                # Processing error.
                PROCESSING_ERROR = :processing_error

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end
        end
      end

      # @see Increase::Models::CardDispute#win
      class Win < Increase::Internal::Type::BaseModel
        # @!attribute won_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Card Dispute was won.
        #
        #   @return [Time]
        required :won_at, Time

        # @!method initialize(won_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDispute::Win} for more details.
        #
        #   If the Card Dispute's status is `won`, this will contain details of the won
        #   dispute.
        #
        #   @param won_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      end

      # @see Increase::Models::CardDispute#withdrawal
      class Withdrawal < Increase::Internal::Type::BaseModel
        # @!attribute explanation
        #   The explanation for the withdrawal of the Card Dispute.
        #
        #   @return [String, nil]
        required :explanation, String, nil?: true

        # @!method initialize(explanation:)
        #   If the Card Dispute has been withdrawn, this will contain details of the
        #   withdrawal.
        #
        #   @param explanation [String, nil] The explanation for the withdrawal of the Card Dispute.
      end
    end
  end
end
