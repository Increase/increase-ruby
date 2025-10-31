# typed: strong

module Increase
  module Models
    class CardDispute < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardDispute, Increase::Internal::AnyHash)
        end

      # The Card Dispute identifier.
      sig { returns(String) }
      attr_accessor :id

      # The amount of the dispute.
      sig { returns(Integer) }
      attr_accessor :amount

      # The Card that the Card Dispute is associated with.
      sig { returns(String) }
      attr_accessor :card_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Card Dispute was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The identifier of the Transaction that was disputed.
      sig { returns(String) }
      attr_accessor :disputed_transaction_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # If the Card Dispute's status is `lost`, this will contain details of the lost
      # dispute.
      sig { returns(T.nilable(Increase::CardDispute::Loss)) }
      attr_reader :loss

      sig { params(loss: T.nilable(Increase::CardDispute::Loss::OrHash)).void }
      attr_writer :loss

      # The network that the Card Dispute is associated with.
      sig { returns(Increase::CardDispute::Network::TaggedSymbol) }
      attr_accessor :network

      # The status of the Card Dispute.
      sig { returns(Increase::CardDispute::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `card_dispute`.
      sig { returns(Increase::CardDispute::Type::TaggedSymbol) }
      attr_accessor :type

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the user submission is required by. Present only if status is
      # `user_submission_required` and a user submission is required by a certain time.
      # Otherwise, this will be `nil`.
      sig { returns(T.nilable(Time)) }
      attr_accessor :user_submission_required_by

      # Card Dispute information for card payments processed over Visa's network. This
      # field will be present in the JSON response if and only if `network` is equal to
      # `visa`.
      sig { returns(T.nilable(Increase::CardDispute::Visa)) }
      attr_reader :visa

      sig { params(visa: T.nilable(Increase::CardDispute::Visa::OrHash)).void }
      attr_writer :visa

      # If the Card Dispute's status is `won`, this will contain details of the won
      # dispute.
      sig { returns(T.nilable(Increase::CardDispute::Win)) }
      attr_reader :win

      sig { params(win: T.nilable(Increase::CardDispute::Win::OrHash)).void }
      attr_writer :win

      # If unauthorized activity occurs on a card, you can create a Card Dispute and
      # we'll work with the card networks to return the funds if appropriate.
      sig do
        params(
          id: String,
          amount: Integer,
          card_id: String,
          created_at: Time,
          disputed_transaction_id: String,
          idempotency_key: T.nilable(String),
          loss: T.nilable(Increase::CardDispute::Loss::OrHash),
          network: Increase::CardDispute::Network::OrSymbol,
          status: Increase::CardDispute::Status::OrSymbol,
          type: Increase::CardDispute::Type::OrSymbol,
          user_submission_required_by: T.nilable(Time),
          visa: T.nilable(Increase::CardDispute::Visa::OrHash),
          win: T.nilable(Increase::CardDispute::Win::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Dispute identifier.
        id:,
        # The amount of the dispute.
        amount:,
        # The Card that the Card Dispute is associated with.
        card_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Card Dispute was created.
        created_at:,
        # The identifier of the Transaction that was disputed.
        disputed_transaction_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # If the Card Dispute's status is `lost`, this will contain details of the lost
        # dispute.
        loss:,
        # The network that the Card Dispute is associated with.
        network:,
        # The status of the Card Dispute.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `card_dispute`.
        type:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the user submission is required by. Present only if status is
        # `user_submission_required` and a user submission is required by a certain time.
        # Otherwise, this will be `nil`.
        user_submission_required_by:,
        # Card Dispute information for card payments processed over Visa's network. This
        # field will be present in the JSON response if and only if `network` is equal to
        # `visa`.
        visa:,
        # If the Card Dispute's status is `won`, this will contain details of the won
        # dispute.
        win:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            amount: Integer,
            card_id: String,
            created_at: Time,
            disputed_transaction_id: String,
            idempotency_key: T.nilable(String),
            loss: T.nilable(Increase::CardDispute::Loss),
            network: Increase::CardDispute::Network::TaggedSymbol,
            status: Increase::CardDispute::Status::TaggedSymbol,
            type: Increase::CardDispute::Type::TaggedSymbol,
            user_submission_required_by: T.nilable(Time),
            visa: T.nilable(Increase::CardDispute::Visa),
            win: T.nilable(Increase::CardDispute::Win)
          }
        )
      end
      def to_hash
      end

      class Loss < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::CardDispute::Loss, Increase::Internal::AnyHash)
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Card Dispute was lost.
        sig { returns(Time) }
        attr_accessor :lost_at

        # The reason the Card Dispute was lost.
        sig { returns(Increase::CardDispute::Loss::Reason::TaggedSymbol) }
        attr_accessor :reason

        # If the Card Dispute's status is `lost`, this will contain details of the lost
        # dispute.
        sig do
          params(
            lost_at: Time,
            reason: Increase::CardDispute::Loss::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Card Dispute was lost.
          lost_at:,
          # The reason the Card Dispute was lost.
          reason:
        )
        end

        sig do
          override.returns(
            {
              lost_at: Time,
              reason: Increase::CardDispute::Loss::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason the Card Dispute was lost.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::CardDispute::Loss::Reason) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The user withdrew the Card Dispute.
          USER_WITHDRAWN =
            T.let(
              :user_withdrawn,
              Increase::CardDispute::Loss::Reason::TaggedSymbol
            )

          # The Card Dispute was lost according to network rules.
          LOSS = T.let(:loss, Increase::CardDispute::Loss::Reason::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Increase::CardDispute::Loss::Reason::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      # The network that the Card Dispute is associated with.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardDispute::Network) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Visa: details will be under the `visa` object.
        VISA = T.let(:visa, Increase::CardDispute::Network::TaggedSymbol)

        # Pulse: details will be under the `pulse` object.
        PULSE = T.let(:pulse, Increase::CardDispute::Network::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardDispute::Network::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The status of the Card Dispute.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardDispute::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A User Submission is required to continue with the Card Dispute.
        USER_SUBMISSION_REQUIRED =
          T.let(
            :user_submission_required,
            Increase::CardDispute::Status::TaggedSymbol
          )

        # The most recent User Submission is being reviewed.
        PENDING_USER_SUBMISSION_REVIEWING =
          T.let(
            :pending_user_submission_reviewing,
            Increase::CardDispute::Status::TaggedSymbol
          )

        # The most recent User Submission is being submitted to the network.
        PENDING_USER_SUBMISSION_SUBMITTING =
          T.let(
            :pending_user_submission_submitting,
            Increase::CardDispute::Status::TaggedSymbol
          )

        # The user's withdrawal of the Card Dispute is being submitted to the network.
        PENDING_USER_WITHDRAWAL_SUBMITTING =
          T.let(
            :pending_user_withdrawal_submitting,
            Increase::CardDispute::Status::TaggedSymbol
          )

        # The Card Dispute is pending a response from the network.
        PENDING_RESPONSE =
          T.let(:pending_response, Increase::CardDispute::Status::TaggedSymbol)

        # The Card Dispute has been lost and funds previously credited from the acceptance have been debited.
        LOST = T.let(:lost, Increase::CardDispute::Status::TaggedSymbol)

        # The Card Dispute has been won and no further action can be taken.
        WON = T.let(:won, Increase::CardDispute::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardDispute::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_dispute`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardDispute::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_DISPUTE =
          T.let(:card_dispute, Increase::CardDispute::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::CardDispute::Type::TaggedSymbol])
        end
        def self.values
        end
      end

      class Visa < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::CardDispute::Visa, Increase::Internal::AnyHash)
          end

        # The network events for the Card Dispute.
        sig { returns(T::Array[Increase::CardDispute::Visa::NetworkEvent]) }
        attr_accessor :network_events

        # The category of the currently required user submission if the user wishes to
        # proceed with the dispute. Present if and only if status is
        # `user_submission_required`. Otherwise, this will be `nil`.
        sig do
          returns(
            T.nilable(
              Increase::CardDispute::Visa::RequiredUserSubmissionCategory::TaggedSymbol
            )
          )
        end
        attr_accessor :required_user_submission_category

        # The user submissions for the Card Dispute.
        sig { returns(T::Array[Increase::CardDispute::Visa::UserSubmission]) }
        attr_accessor :user_submissions

        # Card Dispute information for card payments processed over Visa's network. This
        # field will be present in the JSON response if and only if `network` is equal to
        # `visa`.
        sig do
          params(
            network_events:
              T::Array[Increase::CardDispute::Visa::NetworkEvent::OrHash],
            required_user_submission_category:
              T.nilable(
                Increase::CardDispute::Visa::RequiredUserSubmissionCategory::OrSymbol
              ),
            user_submissions:
              T::Array[Increase::CardDispute::Visa::UserSubmission::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The network events for the Card Dispute.
          network_events:,
          # The category of the currently required user submission if the user wishes to
          # proceed with the dispute. Present if and only if status is
          # `user_submission_required`. Otherwise, this will be `nil`.
          required_user_submission_category:,
          # The user submissions for the Card Dispute.
          user_submissions:
        )
        end

        sig do
          override.returns(
            {
              network_events:
                T::Array[Increase::CardDispute::Visa::NetworkEvent],
              required_user_submission_category:
                T.nilable(
                  Increase::CardDispute::Visa::RequiredUserSubmissionCategory::TaggedSymbol
                ),
              user_submissions:
                T::Array[Increase::CardDispute::Visa::UserSubmission]
            }
          )
        end
        def to_hash
        end

        class NetworkEvent < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDispute::Visa::NetworkEvent,
                Increase::Internal::AnyHash
              )
            end

          # The files attached to the Visa Card Dispute User Submission.
          sig do
            returns(
              T::Array[
                Increase::CardDispute::Visa::NetworkEvent::AttachmentFile
              ]
            )
          end
          attr_accessor :attachment_files

          # The category of the user submission. We may add additional possible values for
          # this enum over time; your application should be able to handle such additions
          # gracefully.
          sig do
            returns(
              Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # A Card Dispute Chargeback Accepted Visa Network Event object. This field will be
          # present in the JSON response if and only if `category` is equal to
          # `chargeback_accepted`. Contains the details specific to a chargeback accepted
          # Visa Card Dispute Network Event, which represents that a chargeback has been
          # accepted by the merchant.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::ChargebackAccepted
              )
            )
          end
          attr_reader :chargeback_accepted

          sig do
            params(
              chargeback_accepted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackAccepted::OrHash
                )
            ).void
          end
          attr_writer :chargeback_accepted

          # A Card Dispute Chargeback Submitted Visa Network Event object. This field will
          # be present in the JSON response if and only if `category` is equal to
          # `chargeback_submitted`. Contains the details specific to a chargeback submitted
          # Visa Card Dispute Network Event, which represents that a chargeback has been
          # submitted to the network.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::ChargebackSubmitted
              )
            )
          end
          attr_reader :chargeback_submitted

          sig do
            params(
              chargeback_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackSubmitted::OrHash
                )
            ).void
          end
          attr_writer :chargeback_submitted

          # A Card Dispute Chargeback Timed Out Visa Network Event object. This field will
          # be present in the JSON response if and only if `category` is equal to
          # `chargeback_timed_out`. Contains the details specific to a chargeback timed out
          # Visa Card Dispute Network Event, which represents that the chargeback has timed
          # out in the user's favor.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::ChargebackTimedOut
              )
            )
          end
          attr_reader :chargeback_timed_out

          sig do
            params(
              chargeback_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackTimedOut::OrHash
                )
            ).void
          end
          attr_writer :chargeback_timed_out

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Visa Card Dispute Network Event was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # The dispute financial transaction that resulted from the network event, if any.
          sig { returns(T.nilable(String)) }
          attr_accessor :dispute_financial_transaction_id

          # A Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event
          # object. This field will be present in the JSON response if and only if
          # `category` is equal to `merchant_prearbitration_decline_submitted`. Contains the
          # details specific to a merchant prearbitration decline submitted Visa Card
          # Dispute Network Event, which represents that the user has declined the
          # merchant's request for a prearbitration request decision in their favor.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted
              )
            )
          end
          attr_reader :merchant_prearbitration_decline_submitted

          sig do
            params(
              merchant_prearbitration_decline_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted::OrHash
                )
            ).void
          end
          attr_writer :merchant_prearbitration_decline_submitted

          # A Card Dispute Merchant Pre-Arbitration Received Visa Network Event object. This
          # field will be present in the JSON response if and only if `category` is equal to
          # `merchant_prearbitration_received`. Contains the details specific to a merchant
          # prearbitration received Visa Card Dispute Network Event, which represents that
          # the merchant has issued a prearbitration request in the user's favor.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived
              )
            )
          end
          attr_reader :merchant_prearbitration_received

          sig do
            params(
              merchant_prearbitration_received:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::OrHash
                )
            ).void
          end
          attr_writer :merchant_prearbitration_received

          # A Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event object.
          # This field will be present in the JSON response if and only if `category` is
          # equal to `merchant_prearbitration_timed_out`. Contains the details specific to a
          # merchant prearbitration timed out Visa Card Dispute Network Event, which
          # represents that the user has timed out responding to the merchant's
          # prearbitration request.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut
              )
            )
          end
          attr_reader :merchant_prearbitration_timed_out

          sig do
            params(
              merchant_prearbitration_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut::OrHash
                )
            ).void
          end
          attr_writer :merchant_prearbitration_timed_out

          # A Card Dispute Re-presented Visa Network Event object. This field will be
          # present in the JSON response if and only if `category` is equal to
          # `represented`. Contains the details specific to a re-presented Visa Card Dispute
          # Network Event, which represents that the merchant has declined the user's
          # chargeback and has re-presented the payment.
          sig do
            returns(
              T.nilable(Increase::CardDispute::Visa::NetworkEvent::Represented)
            )
          end
          attr_reader :represented

          sig do
            params(
              represented:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::OrHash
                )
            ).void
          end
          attr_writer :represented

          # A Card Dispute Re-presentment Timed Out Visa Network Event object. This field
          # will be present in the JSON response if and only if `category` is equal to
          # `representment_timed_out`. Contains the details specific to a re-presentment
          # time-out Visa Card Dispute Network Event, which represents that the user did not
          # respond to the re-presentment by the merchant within the time limit.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut
              )
            )
          end
          attr_reader :representment_timed_out

          sig do
            params(
              representment_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut::OrHash
                )
            ).void
          end
          attr_writer :representment_timed_out

          # A Card Dispute User Pre-Arbitration Accepted Visa Network Event object. This
          # field will be present in the JSON response if and only if `category` is equal to
          # `user_prearbitration_accepted`. Contains the details specific to a user
          # prearbitration accepted Visa Card Dispute Network Event, which represents that
          # the merchant has accepted the user's prearbitration request in the user's favor.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted
              )
            )
          end
          attr_reader :user_prearbitration_accepted

          sig do
            params(
              user_prearbitration_accepted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted::OrHash
                )
            ).void
          end
          attr_writer :user_prearbitration_accepted

          # A Card Dispute User Pre-Arbitration Declined Visa Network Event object. This
          # field will be present in the JSON response if and only if `category` is equal to
          # `user_prearbitration_declined`. Contains the details specific to a user
          # prearbitration declined Visa Card Dispute Network Event, which represents that
          # the merchant has declined the user's prearbitration request.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined
              )
            )
          end
          attr_reader :user_prearbitration_declined

          sig do
            params(
              user_prearbitration_declined:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined::OrHash
                )
            ).void
          end
          attr_writer :user_prearbitration_declined

          # A Card Dispute User Pre-Arbitration Submitted Visa Network Event object. This
          # field will be present in the JSON response if and only if `category` is equal to
          # `user_prearbitration_submitted`. Contains the details specific to a user
          # prearbitration submitted Visa Card Dispute Network Event, which represents that
          # the user's request for prearbitration has been submitted to the network.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted
              )
            )
          end
          attr_reader :user_prearbitration_submitted

          sig do
            params(
              user_prearbitration_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted::OrHash
                )
            ).void
          end
          attr_writer :user_prearbitration_submitted

          # A Card Dispute User Pre-Arbitration Timed Out Visa Network Event object. This
          # field will be present in the JSON response if and only if `category` is equal to
          # `user_prearbitration_timed_out`. Contains the details specific to a user
          # prearbitration timed out Visa Card Dispute Network Event, which represents that
          # the merchant has timed out responding to the user's prearbitration request.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut
              )
            )
          end
          attr_reader :user_prearbitration_timed_out

          sig do
            params(
              user_prearbitration_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut::OrHash
                )
            ).void
          end
          attr_writer :user_prearbitration_timed_out

          # A Card Dispute User Withdrawal Submitted Visa Network Event object. This field
          # will be present in the JSON response if and only if `category` is equal to
          # `user_withdrawal_submitted`. Contains the details specific to a user withdrawal
          # submitted Visa Card Dispute Network Event, which represents that the user's
          # request to withdraw the dispute has been submitted to the network.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted
              )
            )
          end
          attr_reader :user_withdrawal_submitted

          sig do
            params(
              user_withdrawal_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted::OrHash
                )
            ).void
          end
          attr_writer :user_withdrawal_submitted

          sig do
            params(
              attachment_files:
                T::Array[
                  Increase::CardDispute::Visa::NetworkEvent::AttachmentFile::OrHash
                ],
              category:
                Increase::CardDispute::Visa::NetworkEvent::Category::OrSymbol,
              chargeback_accepted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackAccepted::OrHash
                ),
              chargeback_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackSubmitted::OrHash
                ),
              chargeback_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackTimedOut::OrHash
                ),
              created_at: Time,
              dispute_financial_transaction_id: T.nilable(String),
              merchant_prearbitration_decline_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted::OrHash
                ),
              merchant_prearbitration_received:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::OrHash
                ),
              merchant_prearbitration_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut::OrHash
                ),
              represented:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::OrHash
                ),
              representment_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut::OrHash
                ),
              user_prearbitration_accepted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted::OrHash
                ),
              user_prearbitration_declined:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined::OrHash
                ),
              user_prearbitration_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted::OrHash
                ),
              user_prearbitration_timed_out:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut::OrHash
                ),
              user_withdrawal_submitted:
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The files attached to the Visa Card Dispute User Submission.
            attachment_files:,
            # The category of the user submission. We may add additional possible values for
            # this enum over time; your application should be able to handle such additions
            # gracefully.
            category:,
            # A Card Dispute Chargeback Accepted Visa Network Event object. This field will be
            # present in the JSON response if and only if `category` is equal to
            # `chargeback_accepted`. Contains the details specific to a chargeback accepted
            # Visa Card Dispute Network Event, which represents that a chargeback has been
            # accepted by the merchant.
            chargeback_accepted:,
            # A Card Dispute Chargeback Submitted Visa Network Event object. This field will
            # be present in the JSON response if and only if `category` is equal to
            # `chargeback_submitted`. Contains the details specific to a chargeback submitted
            # Visa Card Dispute Network Event, which represents that a chargeback has been
            # submitted to the network.
            chargeback_submitted:,
            # A Card Dispute Chargeback Timed Out Visa Network Event object. This field will
            # be present in the JSON response if and only if `category` is equal to
            # `chargeback_timed_out`. Contains the details specific to a chargeback timed out
            # Visa Card Dispute Network Event, which represents that the chargeback has timed
            # out in the user's favor.
            chargeback_timed_out:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the Visa Card Dispute Network Event was created.
            created_at:,
            # The dispute financial transaction that resulted from the network event, if any.
            dispute_financial_transaction_id:,
            # A Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event
            # object. This field will be present in the JSON response if and only if
            # `category` is equal to `merchant_prearbitration_decline_submitted`. Contains the
            # details specific to a merchant prearbitration decline submitted Visa Card
            # Dispute Network Event, which represents that the user has declined the
            # merchant's request for a prearbitration request decision in their favor.
            merchant_prearbitration_decline_submitted:,
            # A Card Dispute Merchant Pre-Arbitration Received Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `merchant_prearbitration_received`. Contains the details specific to a merchant
            # prearbitration received Visa Card Dispute Network Event, which represents that
            # the merchant has issued a prearbitration request in the user's favor.
            merchant_prearbitration_received:,
            # A Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event object.
            # This field will be present in the JSON response if and only if `category` is
            # equal to `merchant_prearbitration_timed_out`. Contains the details specific to a
            # merchant prearbitration timed out Visa Card Dispute Network Event, which
            # represents that the user has timed out responding to the merchant's
            # prearbitration request.
            merchant_prearbitration_timed_out:,
            # A Card Dispute Re-presented Visa Network Event object. This field will be
            # present in the JSON response if and only if `category` is equal to
            # `represented`. Contains the details specific to a re-presented Visa Card Dispute
            # Network Event, which represents that the merchant has declined the user's
            # chargeback and has re-presented the payment.
            represented:,
            # A Card Dispute Re-presentment Timed Out Visa Network Event object. This field
            # will be present in the JSON response if and only if `category` is equal to
            # `representment_timed_out`. Contains the details specific to a re-presentment
            # time-out Visa Card Dispute Network Event, which represents that the user did not
            # respond to the re-presentment by the merchant within the time limit.
            representment_timed_out:,
            # A Card Dispute User Pre-Arbitration Accepted Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_accepted`. Contains the details specific to a user
            # prearbitration accepted Visa Card Dispute Network Event, which represents that
            # the merchant has accepted the user's prearbitration request in the user's favor.
            user_prearbitration_accepted:,
            # A Card Dispute User Pre-Arbitration Declined Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_declined`. Contains the details specific to a user
            # prearbitration declined Visa Card Dispute Network Event, which represents that
            # the merchant has declined the user's prearbitration request.
            user_prearbitration_declined:,
            # A Card Dispute User Pre-Arbitration Submitted Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_submitted`. Contains the details specific to a user
            # prearbitration submitted Visa Card Dispute Network Event, which represents that
            # the user's request for prearbitration has been submitted to the network.
            user_prearbitration_submitted:,
            # A Card Dispute User Pre-Arbitration Timed Out Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_timed_out`. Contains the details specific to a user
            # prearbitration timed out Visa Card Dispute Network Event, which represents that
            # the merchant has timed out responding to the user's prearbitration request.
            user_prearbitration_timed_out:,
            # A Card Dispute User Withdrawal Submitted Visa Network Event object. This field
            # will be present in the JSON response if and only if `category` is equal to
            # `user_withdrawal_submitted`. Contains the details specific to a user withdrawal
            # submitted Visa Card Dispute Network Event, which represents that the user's
            # request to withdraw the dispute has been submitted to the network.
            user_withdrawal_submitted:
          )
          end

          sig do
            override.returns(
              {
                attachment_files:
                  T::Array[
                    Increase::CardDispute::Visa::NetworkEvent::AttachmentFile
                  ],
                category:
                  Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol,
                chargeback_accepted:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::ChargebackAccepted
                  ),
                chargeback_submitted:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::ChargebackSubmitted
                  ),
                chargeback_timed_out:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::ChargebackTimedOut
                  ),
                created_at: Time,
                dispute_financial_transaction_id: T.nilable(String),
                merchant_prearbitration_decline_submitted:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted
                  ),
                merchant_prearbitration_received:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived
                  ),
                merchant_prearbitration_timed_out:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut
                  ),
                represented:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented
                  ),
                representment_timed_out:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut
                  ),
                user_prearbitration_accepted:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted
                  ),
                user_prearbitration_declined:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined
                  ),
                user_prearbitration_submitted:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted
                  ),
                user_prearbitration_timed_out:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut
                  ),
                user_withdrawal_submitted:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted
                  )
              }
            )
          end
          def to_hash
          end

          class AttachmentFile < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::AttachmentFile,
                  Increase::Internal::AnyHash
                )
              end

            # The ID of the file attached to the Card Dispute.
            sig { returns(String) }
            attr_accessor :file_id

            sig { params(file_id: String).returns(T.attached_class) }
            def self.new(
              # The ID of the file attached to the Card Dispute.
              file_id:
            )
            end

            sig { override.returns({ file_id: String }) }
            def to_hash
            end
          end

          # The category of the user submission. We may add additional possible values for
          # this enum over time; your application should be able to handle such additions
          # gracefully.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDispute::Visa::NetworkEvent::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Card Dispute Chargeback Accepted Visa Network Event: details will be under the `chargeback_accepted` object.
            CHARGEBACK_ACCEPTED =
              T.let(
                :chargeback_accepted,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute Chargeback Submitted Visa Network Event: details will be under the `chargeback_submitted` object.
            CHARGEBACK_SUBMITTED =
              T.let(
                :chargeback_submitted,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute Chargeback Timed Out Visa Network Event: details will be under the `chargeback_timed_out` object.
            CHARGEBACK_TIMED_OUT =
              T.let(
                :chargeback_timed_out,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event: details will be under the `merchant_prearbitration_decline_submitted` object.
            MERCHANT_PREARBITRATION_DECLINE_SUBMITTED =
              T.let(
                :merchant_prearbitration_decline_submitted,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute Merchant Pre-Arbitration Received Visa Network Event: details will be under the `merchant_prearbitration_received` object.
            MERCHANT_PREARBITRATION_RECEIVED =
              T.let(
                :merchant_prearbitration_received,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event: details will be under the `merchant_prearbitration_timed_out` object.
            MERCHANT_PREARBITRATION_TIMED_OUT =
              T.let(
                :merchant_prearbitration_timed_out,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute Re-presented Visa Network Event: details will be under the `represented` object.
            REPRESENTED =
              T.let(
                :represented,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute Re-presentment Timed Out Visa Network Event: details will be under the `representment_timed_out` object.
            REPRESENTMENT_TIMED_OUT =
              T.let(
                :representment_timed_out,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute User Pre-Arbitration Accepted Visa Network Event: details will be under the `user_prearbitration_accepted` object.
            USER_PREARBITRATION_ACCEPTED =
              T.let(
                :user_prearbitration_accepted,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute User Pre-Arbitration Declined Visa Network Event: details will be under the `user_prearbitration_declined` object.
            USER_PREARBITRATION_DECLINED =
              T.let(
                :user_prearbitration_declined,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute User Pre-Arbitration Submitted Visa Network Event: details will be under the `user_prearbitration_submitted` object.
            USER_PREARBITRATION_SUBMITTED =
              T.let(
                :user_prearbitration_submitted,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute User Pre-Arbitration Timed Out Visa Network Event: details will be under the `user_prearbitration_timed_out` object.
            USER_PREARBITRATION_TIMED_OUT =
              T.let(
                :user_prearbitration_timed_out,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            # Card Dispute User Withdrawal Submitted Visa Network Event: details will be under the `user_withdrawal_submitted` object.
            USER_WITHDRAWAL_SUBMITTED =
              T.let(
                :user_withdrawal_submitted,
                Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDispute::Visa::NetworkEvent::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class ChargebackAccepted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackAccepted,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute Chargeback Accepted Visa Network Event object. This field will be
            # present in the JSON response if and only if `category` is equal to
            # `chargeback_accepted`. Contains the details specific to a chargeback accepted
            # Visa Card Dispute Network Event, which represents that a chargeback has been
            # accepted by the merchant.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class ChargebackSubmitted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackSubmitted,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute Chargeback Submitted Visa Network Event object. This field will
            # be present in the JSON response if and only if `category` is equal to
            # `chargeback_submitted`. Contains the details specific to a chargeback submitted
            # Visa Card Dispute Network Event, which represents that a chargeback has been
            # submitted to the network.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class ChargebackTimedOut < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::ChargebackTimedOut,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute Chargeback Timed Out Visa Network Event object. This field will
            # be present in the JSON response if and only if `category` is equal to
            # `chargeback_timed_out`. Contains the details specific to a chargeback timed out
            # Visa Card Dispute Network Event, which represents that the chargeback has timed
            # out in the user's favor.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class MerchantPrearbitrationDeclineSubmitted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationDeclineSubmitted,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute Merchant Pre-Arbitration Decline Submitted Visa Network Event
            # object. This field will be present in the JSON response if and only if
            # `category` is equal to `merchant_prearbitration_decline_submitted`. Contains the
            # details specific to a merchant prearbitration decline submitted Visa Card
            # Dispute Network Event, which represents that the user has declined the
            # merchant's request for a prearbitration request decision in their favor.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class MerchantPrearbitrationReceived < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived,
                  Increase::Internal::AnyHash
                )
              end

            # Cardholder no longer disputes details. Present if and only if `reason` is
            # `cardholder_no_longer_disputes`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes
                )
              )
            end
            attr_reader :cardholder_no_longer_disputes

            sig do
              params(
                cardholder_no_longer_disputes:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes::OrHash
                  )
              ).void
            end
            attr_writer :cardholder_no_longer_disputes

            # Compelling evidence details. Present if and only if `reason` is
            # `compelling_evidence`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence
                )
              )
            end
            attr_reader :compelling_evidence

            sig do
              params(
                compelling_evidence:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::OrHash
                  )
              ).void
            end
            attr_writer :compelling_evidence

            # Credit or reversal processed details. Present if and only if `reason` is
            # `credit_or_reversal_processed`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed
                )
              )
            end
            attr_reader :credit_or_reversal_processed

            sig do
              params(
                credit_or_reversal_processed:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed::OrHash
                  )
              ).void
            end
            attr_writer :credit_or_reversal_processed

            # Delayed charge transaction details. Present if and only if `reason` is
            # `delayed_charge_transaction`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction
                )
              )
            end
            attr_reader :delayed_charge_transaction

            sig do
              params(
                delayed_charge_transaction:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction::OrHash
                  )
              ).void
            end
            attr_writer :delayed_charge_transaction

            # Evidence of imprint details. Present if and only if `reason` is
            # `evidence_of_imprint`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint
                )
              )
            end
            attr_reader :evidence_of_imprint

            sig do
              params(
                evidence_of_imprint:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint::OrHash
                  )
              ).void
            end
            attr_writer :evidence_of_imprint

            # Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute
                )
              )
            end
            attr_reader :invalid_dispute

            sig do
              params(
                invalid_dispute:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::OrHash
                  )
              ).void
            end
            attr_writer :invalid_dispute

            # Non-fiat currency or non-fungible token received details. Present if and only if
            # `reason` is `non_fiat_currency_or_non_fungible_token_received`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived
                )
              )
            end
            attr_reader :non_fiat_currency_or_non_fungible_token_received

            sig do
              params(
                non_fiat_currency_or_non_fungible_token_received:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived::OrHash
                  )
              ).void
            end
            attr_writer :non_fiat_currency_or_non_fungible_token_received

            # Prior undisputed non-fraud transactions details. Present if and only if `reason`
            # is `prior_undisputed_non_fraud_transactions`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions
                )
              )
            end
            attr_reader :prior_undisputed_non_fraud_transactions

            sig do
              params(
                prior_undisputed_non_fraud_transactions:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions::OrHash
                  )
              ).void
            end
            attr_writer :prior_undisputed_non_fraud_transactions

            # The reason the merchant re-presented the dispute.
            sig do
              returns(
                Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
              )
            end
            attr_accessor :reason

            # A Card Dispute Merchant Pre-Arbitration Received Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `merchant_prearbitration_received`. Contains the details specific to a merchant
            # prearbitration received Visa Card Dispute Network Event, which represents that
            # the merchant has issued a prearbitration request in the user's favor.
            sig do
              params(
                cardholder_no_longer_disputes:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes::OrHash
                  ),
                compelling_evidence:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::OrHash
                  ),
                credit_or_reversal_processed:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed::OrHash
                  ),
                delayed_charge_transaction:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction::OrHash
                  ),
                evidence_of_imprint:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint::OrHash
                  ),
                invalid_dispute:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::OrHash
                  ),
                non_fiat_currency_or_non_fungible_token_received:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived::OrHash
                  ),
                prior_undisputed_non_fraud_transactions:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions::OrHash
                  ),
                reason:
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Cardholder no longer disputes details. Present if and only if `reason` is
              # `cardholder_no_longer_disputes`.
              cardholder_no_longer_disputes:,
              # Compelling evidence details. Present if and only if `reason` is
              # `compelling_evidence`.
              compelling_evidence:,
              # Credit or reversal processed details. Present if and only if `reason` is
              # `credit_or_reversal_processed`.
              credit_or_reversal_processed:,
              # Delayed charge transaction details. Present if and only if `reason` is
              # `delayed_charge_transaction`.
              delayed_charge_transaction:,
              # Evidence of imprint details. Present if and only if `reason` is
              # `evidence_of_imprint`.
              evidence_of_imprint:,
              # Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
              invalid_dispute:,
              # Non-fiat currency or non-fungible token received details. Present if and only if
              # `reason` is `non_fiat_currency_or_non_fungible_token_received`.
              non_fiat_currency_or_non_fungible_token_received:,
              # Prior undisputed non-fraud transactions details. Present if and only if `reason`
              # is `prior_undisputed_non_fraud_transactions`.
              prior_undisputed_non_fraud_transactions:,
              # The reason the merchant re-presented the dispute.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  cardholder_no_longer_disputes:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes
                    ),
                  compelling_evidence:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence
                    ),
                  credit_or_reversal_processed:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed
                    ),
                  delayed_charge_transaction:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction
                    ),
                  evidence_of_imprint:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint
                    ),
                  invalid_dispute:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute
                    ),
                  non_fiat_currency_or_non_fungible_token_received:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived
                    ),
                  prior_undisputed_non_fraud_transactions:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions
                    ),
                  reason:
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            class CardholderNoLongerDisputes < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CardholderNoLongerDisputes,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation for why the merchant believes the cardholder no longer disputes the
              # transaction.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Cardholder no longer disputes details. Present if and only if `reason` is
              # `cardholder_no_longer_disputes`.
              sig do
                params(explanation: T.nilable(String)).returns(T.attached_class)
              end
              def self.new(
                # Explanation for why the merchant believes the cardholder no longer disputes the
                # transaction.
                explanation:
              )
              end

              sig { override.returns({ explanation: T.nilable(String) }) }
              def to_hash
              end
            end

            class CompellingEvidence < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence,
                    Increase::Internal::AnyHash
                  )
                end

              # The category of compelling evidence provided by the merchant.
              sig do
                returns(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                )
              end
              attr_accessor :category

              # Explanation of the compelling evidence provided by the merchant.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Compelling evidence details. Present if and only if `reason` is
              # `compelling_evidence`.
              sig do
                params(
                  category:
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::OrSymbol,
                  explanation: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # The category of compelling evidence provided by the merchant.
                category:,
                # Explanation of the compelling evidence provided by the merchant.
                explanation:
              )
              end

              sig do
                override.returns(
                  {
                    category:
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol,
                    explanation: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # The category of compelling evidence provided by the merchant.
              module Category
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Authorized signer known by the cardholder.
                AUTHORIZED_SIGNER =
                  T.let(
                    :authorized_signer,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Proof of delivery.
                DELIVERY =
                  T.let(
                    :delivery,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Proof of delivery to cardholder at place of employment.
                DELIVERY_AT_PLACE_OF_EMPLOYMENT =
                  T.let(
                    :delivery_at_place_of_employment,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Proof of digital goods download.
                DIGITAL_GOODS_DOWNLOAD =
                  T.let(
                    :digital_goods_download,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Dynamic Currency Conversion actively chosen by cardholder.
                DYNAMIC_CURRENCY_CONVERSION_ACTIVELY_CHOSEN =
                  T.let(
                    :dynamic_currency_conversion_actively_chosen,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Flight manifest with corresponding purchase itinerary record.
                FLIGHT_MANIFEST_AND_PURCHASE_ITINERARY =
                  T.let(
                    :flight_manifest_and_purchase_itinerary,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Signer is member of cardholder's household.
                HOUSEHOLD_MEMBER_SIGNER =
                  T.let(
                    :household_member_signer,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Legitimate spend across multiple payment types for same merchandise.
                LEGITIMATE_SPEND_ACROSS_PAYMENT_TYPES_FOR_SAME_MERCHANDISE =
                  T.let(
                    :legitimate_spend_across_payment_types_for_same_merchandise,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Documentation to prove the cardholder is in possession of and/or using the merchandise.
                MERCHANDISE_USE =
                  T.let(
                    :merchandise_use,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Passenger transport: proof ticket was received, scanned at gate or other transaction related to original (for example, frequent flyer miles.)
                PASSENGER_TRANSPORT_TICKET_USE =
                  T.let(
                    :passenger_transport_ticket_use,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Recurring transaction with binding contract or previous undisputed recurring transactions and proof the cardholder is using the merchandise or service.
                RECURRING_TRANSACTION_WITH_BINDING_CONTRACT_OR_PREVIOUS_UNDISPUTED_TRANSACTION =
                  T.let(
                    :recurring_transaction_with_binding_contract_or_previous_undisputed_transaction,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Signed delivery form, or copy of/details of identification from cardholder as proof goods were picked up at merchant location.
                SIGNED_DELIVERY_OR_PICKUP_FORM =
                  T.let(
                    :signed_delivery_or_pickup_form,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Signed Mail Order/Phone Order form.
                SIGNED_MAIL_ORDER_PHONE_ORDER_FORM =
                  T.let(
                    :signed_mail_order_phone_order_form,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Travel & Expense: loyalty transactions related to purchase.
                TRAVEL_AND_EXPENSE_LOYALTY_TRANSACTION =
                  T.let(
                    :travel_and_expense_loyalty_transaction,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                # Travel & Expense: subsequent purchases made throughout service period.
                TRAVEL_AND_EXPENSE_SUBSEQUENT_PURCHASE =
                  T.let(
                    :travel_and_expense_subsequent_purchase,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CompellingEvidence::Category::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class CreditOrReversalProcessed < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::CreditOrReversalProcessed,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount of the credit or reversal in the minor unit of its currency. For
              # dollars, for example, this is cents.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or
              # reversal's currency.
              sig { returns(String) }
              attr_accessor :currency

              # Explanation for why the merchant believes the credit or reversal was processed.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # The date the credit or reversal was processed.
              sig { returns(Date) }
              attr_accessor :processed_at

              # Credit or reversal processed details. Present if and only if `reason` is
              # `credit_or_reversal_processed`.
              sig do
                params(
                  amount: Integer,
                  currency: String,
                  explanation: T.nilable(String),
                  processed_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # The amount of the credit or reversal in the minor unit of its currency. For
                # dollars, for example, this is cents.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or
                # reversal's currency.
                currency:,
                # Explanation for why the merchant believes the credit or reversal was processed.
                explanation:,
                # The date the credit or reversal was processed.
                processed_at:
              )
              end

              sig do
                override.returns(
                  {
                    amount: Integer,
                    currency: String,
                    explanation: T.nilable(String),
                    processed_at: Date
                  }
                )
              end
              def to_hash
              end
            end

            class DelayedChargeTransaction < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::DelayedChargeTransaction,
                    Increase::Internal::AnyHash
                  )
                end

              # Additional details about the delayed charge transaction.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Delayed charge transaction details. Present if and only if `reason` is
              # `delayed_charge_transaction`.
              sig do
                params(explanation: T.nilable(String)).returns(T.attached_class)
              end
              def self.new(
                # Additional details about the delayed charge transaction.
                explanation:
              )
              end

              sig { override.returns({ explanation: T.nilable(String) }) }
              def to_hash
              end
            end

            class EvidenceOfImprint < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::EvidenceOfImprint,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation of the evidence of imprint.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Evidence of imprint details. Present if and only if `reason` is
              # `evidence_of_imprint`.
              sig do
                params(explanation: T.nilable(String)).returns(T.attached_class)
              end
              def self.new(
                # Explanation of the evidence of imprint.
                explanation:
              )
              end

              sig { override.returns({ explanation: T.nilable(String) }) }
              def to_hash
              end
            end

            class InvalidDispute < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation for why the dispute is considered invalid by the merchant.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # The reason a merchant considers the dispute invalid.
              sig do
                returns(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason::TaggedSymbol
                )
              end
              attr_accessor :reason

              # Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
              sig do
                params(
                  explanation: T.nilable(String),
                  reason:
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Explanation for why the dispute is considered invalid by the merchant.
                explanation:,
                # The reason a merchant considers the dispute invalid.
                reason:
              )
              end

              sig do
                override.returns(
                  {
                    explanation: T.nilable(String),
                    reason:
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # The reason a merchant considers the dispute invalid.
              module Reason
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason::TaggedSymbol
                  )

                # Special authorization procedures followed.
                SPECIAL_AUTHORIZATION_PROCEDURES_FOLLOWED =
                  T.let(
                    :special_authorization_procedures_followed,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::InvalidDispute::Reason::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class NonFiatCurrencyOrNonFungibleTokenReceived < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::NonFiatCurrencyOrNonFungibleTokenReceived,
                    Increase::Internal::AnyHash
                  )
                end

              # Blockchain transaction hash.
              sig { returns(String) }
              attr_accessor :blockchain_transaction_hash

              # Destination wallet address.
              sig { returns(String) }
              attr_accessor :destination_wallet_address

              # Prior approved transactions.
              sig { returns(T.nilable(String)) }
              attr_accessor :prior_approved_transactions

              # Non-fiat currency or non-fungible token received details. Present if and only if
              # `reason` is `non_fiat_currency_or_non_fungible_token_received`.
              sig do
                params(
                  blockchain_transaction_hash: String,
                  destination_wallet_address: String,
                  prior_approved_transactions: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Blockchain transaction hash.
                blockchain_transaction_hash:,
                # Destination wallet address.
                destination_wallet_address:,
                # Prior approved transactions.
                prior_approved_transactions:
              )
              end

              sig do
                override.returns(
                  {
                    blockchain_transaction_hash: String,
                    destination_wallet_address: String,
                    prior_approved_transactions: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end

            class PriorUndisputedNonFraudTransactions < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::PriorUndisputedNonFraudTransactions,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation of the prior undisputed non-fraud transactions provided by the
              # merchant.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Prior undisputed non-fraud transactions details. Present if and only if `reason`
              # is `prior_undisputed_non_fraud_transactions`.
              sig do
                params(explanation: T.nilable(String)).returns(T.attached_class)
              end
              def self.new(
                # Explanation of the prior undisputed non-fraud transactions provided by the
                # merchant.
                explanation:
              )
              end

              sig { override.returns({ explanation: T.nilable(String) }) }
              def to_hash
              end
            end

            # The reason the merchant re-presented the dispute.
            module Reason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Cardholder no longer disputes the transaction.
              CARDHOLDER_NO_LONGER_DISPUTES =
                T.let(
                  :cardholder_no_longer_disputes,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              # Compelling evidence.
              COMPELLING_EVIDENCE =
                T.let(
                  :compelling_evidence,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              # Credit or reversal was processed.
              CREDIT_OR_REVERSAL_PROCESSED =
                T.let(
                  :credit_or_reversal_processed,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              # Delayed charge transaction.
              DELAYED_CHARGE_TRANSACTION =
                T.let(
                  :delayed_charge_transaction,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              # Evidence of imprint.
              EVIDENCE_OF_IMPRINT =
                T.let(
                  :evidence_of_imprint,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              # Invalid dispute.
              INVALID_DISPUTE =
                T.let(
                  :invalid_dispute,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              # Non-fiat currency or non-fungible token was received by the cardholder.
              NON_FIAT_CURRENCY_OR_NON_FUNGIBLE_TOKEN_RECEIVED =
                T.let(
                  :non_fiat_currency_or_non_fungible_token_received,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              # Prior undisputed non-fraud transactions.
              PRIOR_UNDISPUTED_NON_FRAUD_TRANSACTIONS =
                T.let(
                  :prior_undisputed_non_fraud_transactions,
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationReceived::Reason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class MerchantPrearbitrationTimedOut < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::MerchantPrearbitrationTimedOut,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute Merchant Pre-Arbitration Timed Out Visa Network Event object.
            # This field will be present in the JSON response if and only if `category` is
            # equal to `merchant_prearbitration_timed_out`. Contains the details specific to a
            # merchant prearbitration timed out Visa Card Dispute Network Event, which
            # represents that the user has timed out responding to the merchant's
            # prearbitration request.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class Represented < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::Represented,
                  Increase::Internal::AnyHash
                )
              end

            # Cardholder no longer disputes details. Present if and only if `reason` is
            # `cardholder_no_longer_disputes`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes
                )
              )
            end
            attr_reader :cardholder_no_longer_disputes

            sig do
              params(
                cardholder_no_longer_disputes:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes::OrHash
                  )
              ).void
            end
            attr_writer :cardholder_no_longer_disputes

            # Credit or reversal processed details. Present if and only if `reason` is
            # `credit_or_reversal_processed`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed
                )
              )
            end
            attr_reader :credit_or_reversal_processed

            sig do
              params(
                credit_or_reversal_processed:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed::OrHash
                  )
              ).void
            end
            attr_writer :credit_or_reversal_processed

            # Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute
                )
              )
            end
            attr_reader :invalid_dispute

            sig do
              params(
                invalid_dispute:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::OrHash
                  )
              ).void
            end
            attr_writer :invalid_dispute

            # Non-fiat currency or non-fungible token as described details. Present if and
            # only if `reason` is `non_fiat_currency_or_non_fungible_token_as_described`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed
                )
              )
            end
            attr_reader :non_fiat_currency_or_non_fungible_token_as_described

            sig do
              params(
                non_fiat_currency_or_non_fungible_token_as_described:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed::OrHash
                  )
              ).void
            end
            attr_writer :non_fiat_currency_or_non_fungible_token_as_described

            # Non-fiat currency or non-fungible token received details. Present if and only if
            # `reason` is `non_fiat_currency_or_non_fungible_token_received`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived
                )
              )
            end
            attr_reader :non_fiat_currency_or_non_fungible_token_received

            sig do
              params(
                non_fiat_currency_or_non_fungible_token_received:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived::OrHash
                  )
              ).void
            end
            attr_writer :non_fiat_currency_or_non_fungible_token_received

            # Proof of cash disbursement details. Present if and only if `reason` is
            # `proof_of_cash_disbursement`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement
                )
              )
            end
            attr_reader :proof_of_cash_disbursement

            sig do
              params(
                proof_of_cash_disbursement:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement::OrHash
                  )
              ).void
            end
            attr_writer :proof_of_cash_disbursement

            # The reason the merchant re-presented the dispute.
            sig do
              returns(
                Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
              )
            end
            attr_accessor :reason

            # Reversal issued by merchant details. Present if and only if `reason` is
            # `reversal_issued`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued
                )
              )
            end
            attr_reader :reversal_issued

            sig do
              params(
                reversal_issued:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued::OrHash
                  )
              ).void
            end
            attr_writer :reversal_issued

            # A Card Dispute Re-presented Visa Network Event object. This field will be
            # present in the JSON response if and only if `category` is equal to
            # `represented`. Contains the details specific to a re-presented Visa Card Dispute
            # Network Event, which represents that the merchant has declined the user's
            # chargeback and has re-presented the payment.
            sig do
              params(
                cardholder_no_longer_disputes:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes::OrHash
                  ),
                credit_or_reversal_processed:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed::OrHash
                  ),
                invalid_dispute:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::OrHash
                  ),
                non_fiat_currency_or_non_fungible_token_as_described:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed::OrHash
                  ),
                non_fiat_currency_or_non_fungible_token_received:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived::OrHash
                  ),
                proof_of_cash_disbursement:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement::OrHash
                  ),
                reason:
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::OrSymbol,
                reversal_issued:
                  T.nilable(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Cardholder no longer disputes details. Present if and only if `reason` is
              # `cardholder_no_longer_disputes`.
              cardholder_no_longer_disputes:,
              # Credit or reversal processed details. Present if and only if `reason` is
              # `credit_or_reversal_processed`.
              credit_or_reversal_processed:,
              # Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
              invalid_dispute:,
              # Non-fiat currency or non-fungible token as described details. Present if and
              # only if `reason` is `non_fiat_currency_or_non_fungible_token_as_described`.
              non_fiat_currency_or_non_fungible_token_as_described:,
              # Non-fiat currency or non-fungible token received details. Present if and only if
              # `reason` is `non_fiat_currency_or_non_fungible_token_received`.
              non_fiat_currency_or_non_fungible_token_received:,
              # Proof of cash disbursement details. Present if and only if `reason` is
              # `proof_of_cash_disbursement`.
              proof_of_cash_disbursement:,
              # The reason the merchant re-presented the dispute.
              reason:,
              # Reversal issued by merchant details. Present if and only if `reason` is
              # `reversal_issued`.
              reversal_issued:
            )
            end

            sig do
              override.returns(
                {
                  cardholder_no_longer_disputes:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes
                    ),
                  credit_or_reversal_processed:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed
                    ),
                  invalid_dispute:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute
                    ),
                  non_fiat_currency_or_non_fungible_token_as_described:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed
                    ),
                  non_fiat_currency_or_non_fungible_token_received:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived
                    ),
                  proof_of_cash_disbursement:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement
                    ),
                  reason:
                    Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol,
                  reversal_issued:
                    T.nilable(
                      Increase::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued
                    )
                }
              )
            end
            def to_hash
            end

            class CardholderNoLongerDisputes < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::CardholderNoLongerDisputes,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation for why the merchant believes the cardholder no longer disputes the
              # transaction.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Cardholder no longer disputes details. Present if and only if `reason` is
              # `cardholder_no_longer_disputes`.
              sig do
                params(explanation: T.nilable(String)).returns(T.attached_class)
              end
              def self.new(
                # Explanation for why the merchant believes the cardholder no longer disputes the
                # transaction.
                explanation:
              )
              end

              sig { override.returns({ explanation: T.nilable(String) }) }
              def to_hash
              end
            end

            class CreditOrReversalProcessed < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::CreditOrReversalProcessed,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount of the credit or reversal in the minor unit of its currency. For
              # dollars, for example, this is cents.
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or
              # reversal's currency.
              sig { returns(String) }
              attr_accessor :currency

              # Explanation for why the merchant believes the credit or reversal was processed.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # The date the credit or reversal was processed.
              sig { returns(Date) }
              attr_accessor :processed_at

              # Credit or reversal processed details. Present if and only if `reason` is
              # `credit_or_reversal_processed`.
              sig do
                params(
                  amount: Integer,
                  currency: String,
                  explanation: T.nilable(String),
                  processed_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # The amount of the credit or reversal in the minor unit of its currency. For
                # dollars, for example, this is cents.
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the credit or
                # reversal's currency.
                currency:,
                # Explanation for why the merchant believes the credit or reversal was processed.
                explanation:,
                # The date the credit or reversal was processed.
                processed_at:
              )
              end

              sig do
                override.returns(
                  {
                    amount: Integer,
                    currency: String,
                    explanation: T.nilable(String),
                    processed_at: Date
                  }
                )
              end
              def to_hash
              end
            end

            class InvalidDispute < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation for why the dispute is considered invalid by the merchant.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # The reason a merchant considers the dispute invalid.
              sig do
                returns(
                  Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                )
              end
              attr_accessor :reason

              # Invalid dispute details. Present if and only if `reason` is `invalid_dispute`.
              sig do
                params(
                  explanation: T.nilable(String),
                  reason:
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Explanation for why the dispute is considered invalid by the merchant.
                explanation:,
                # The reason a merchant considers the dispute invalid.
                reason:
              )
              end

              sig do
                override.returns(
                  {
                    explanation: T.nilable(String),
                    reason:
                      Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # The reason a merchant considers the dispute invalid.
              module Reason
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Automatic Teller Machine (ATM) transaction proof provided.
                AUTOMATIC_TELLER_MACHINE_TRANSACTION_PROOF_PROVIDED =
                  T.let(
                    :automatic_teller_machine_transaction_proof_provided,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Balance of partial prepayment not paid.
                BALANCE_OF_PARTIAL_PREPAYMENT_NOT_PAID =
                  T.let(
                    :balance_of_partial_prepayment_not_paid,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Cardholder canceled before expected receipt date of the merchandise.
                CARDHOLDER_CANCELED_BEFORE_EXPECTED_MERCHANDISE_RECEIPT_DATE =
                  T.let(
                    :cardholder_canceled_before_expected_merchandise_receipt_date,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Cardholder canceled before expected receipt date of the services.
                CARDHOLDER_CANCELED_BEFORE_EXPECTED_SERVICES_RECEIPT_DATE =
                  T.let(
                    :cardholder_canceled_before_expected_services_receipt_date,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Cardholder canceled on a different date than claimed.
                CARDHOLDER_CANCELED_DIFFERENT_DATE =
                  T.let(
                    :cardholder_canceled_different_date,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Cardholder received  did not cancel according to policy.
                CARDHOLDER_DID_NOT_CANCEL_ACCORDING_TO_POLICY =
                  T.let(
                    :cardholder_did_not_cancel_according_to_policy,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Cardholder received the merchandise.
                CARDHOLDER_RECEIVED_MERCHANDISE =
                  T.let(
                    :cardholder_received_merchandise,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Country code is correct.
                COUNTRY_CODE_CORRECT =
                  T.let(
                    :country_code_correct,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Credit was processed correctly.
                CREDIT_PROCESSED_CORRECTLY =
                  T.let(
                    :credit_processed_correctly,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Currency is correct.
                CURRENCY_CORRECT =
                  T.let(
                    :currency_correct,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Dispute is for quality.
                DISPUTE_IS_FOR_QUALITY =
                  T.let(
                    :dispute_is_for_quality,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Dispute is for Visa Cash Back transaction portion.
                DISPUTE_IS_FOR_VISA_CASH_BACK_TRANSACTION_PORTION =
                  T.let(
                    :dispute_is_for_visa_cash_back_transaction_portion,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Disputed amount is Value Added Tax (VAT).
                DISPUTED_AMOUNT_IS_VALUE_ADDED_TAX =
                  T.let(
                    :disputed_amount_is_value_added_tax,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Disputed amount is Value Added Tax (VAT) but no credit receipt was provided by the cardholder.
                DISPUTED_AMOUNT_IS_VALUE_ADDED_TAX_NO_CREDIT_RECEIPT_PROVIDED =
                  T.let(
                    :disputed_amount_is_value_added_tax_no_credit_receipt_provided,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Limited return or cancellation policy was properly disclosed.
                LIMITED_RETURN_OR_CANCELLATION_POLICY_PROPERLY_DISCLOSED =
                  T.let(
                    :limited_return_or_cancellation_policy_properly_disclosed,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise held at cardholder customs agency.
                MERCHANDISE_HELD_AT_CARDHOLDER_CUSTOMS_AGENCY =
                  T.let(
                    :merchandise_held_at_cardholder_customs_agency,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise matches the merchant's description.
                MERCHANDISE_MATCHES_DESCRIPTION =
                  T.let(
                    :merchandise_matches_description,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise is not counterfeit.
                MERCHANDISE_NOT_COUNTERFEIT =
                  T.let(
                    :merchandise_not_counterfeit,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise is not damaged.
                MERCHANDISE_NOT_DAMAGED =
                  T.let(
                    :merchandise_not_damaged,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise is not defective.
                MERCHANDISE_NOT_DEFECTIVE =
                  T.let(
                    :merchandise_not_defective,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise was provided prior to the cancellation date.
                MERCHANDISE_PROVIDED_PRIOR_TO_CANCELLATION_DATE =
                  T.let(
                    :merchandise_provided_prior_to_cancellation_date,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise quality matches the merchant's description.
                MERCHANDISE_QUALITY_MATCHES_DESCRIPTION =
                  T.let(
                    :merchandise_quality_matches_description,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchandise was not attempted returned to the merchant.
                MERCHANDISE_RETURN_NOT_ATTEMPTED =
                  T.let(
                    :merchandise_return_not_attempted,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Merchant was not notified of the closed account.
                MERCHANT_NOT_NOTIFIED_OF_CLOSED_ACCOUNT =
                  T.let(
                    :merchant_not_notified_of_closed_account,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Name on manifest of departed flight matches name on purchased itinerary.
                NAME_ON_FLIGHT_MANIFEST_MATCHES_PURCHASE =
                  T.let(
                    :name_on_flight_manifest_matches_purchase,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # No credit receipt was provided by the cardholder.
                NO_CREDIT_RECEIPT_PROVIDED =
                  T.let(
                    :no_credit_receipt_provided,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # The claimed processing error did not occur.
                PROCESSING_ERROR_INCORRECT =
                  T.let(
                    :processing_error_incorrect,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Returned merchandise held at customs agency outside the merchant's country.
                RETURNED_MECHANDISE_HELD_AT_CUSTOMS_AGENCY_OUTSIDE_MERCHANT_COUNTRY =
                  T.let(
                    :returned_mechandise_held_at_customs_agency_outside_merchant_country,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Services match the merchant's description.
                SERVICES_MATCH_DESCRIPTION =
                  T.let(
                    :services_match_description,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Services were provided prior to the cancellation date.
                SERVICES_PROVIDED_PRIOR_TO_CANCELLATION_DATE =
                  T.let(
                    :services_provided_prior_to_cancellation_date,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Services were used after the cancellation date and prior to the dispute submission date.
                SERVICES_USED_AFTER_CANCELLATION_DATE =
                  T.let(
                    :services_used_after_cancellation_date,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Terms of service were not misrepresented.
                TERMS_OF_SERVICE_NOT_MISREPRESENTED =
                  T.let(
                    :terms_of_service_not_misrepresented,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                # Transaction code is correct.
                TRANSACTION_CODE_CORRECT =
                  T.let(
                    :transaction_code_correct,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::NetworkEvent::Represented::InvalidDispute::Reason::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class NonFiatCurrencyOrNonFungibleTokenAsDescribed < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenAsDescribed,
                    Increase::Internal::AnyHash
                  )
                end

              # Non-fiat currency or non-fungible token as described details. Present if and
              # only if `reason` is `non_fiat_currency_or_non_fungible_token_as_described`.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class NonFiatCurrencyOrNonFungibleTokenReceived < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::NonFiatCurrencyOrNonFungibleTokenReceived,
                    Increase::Internal::AnyHash
                  )
                end

              # Blockchain transaction hash.
              sig { returns(String) }
              attr_accessor :blockchain_transaction_hash

              # Destination wallet address.
              sig { returns(String) }
              attr_accessor :destination_wallet_address

              # Prior approved transactions.
              sig { returns(T.nilable(String)) }
              attr_accessor :prior_approved_transactions

              # Non-fiat currency or non-fungible token received details. Present if and only if
              # `reason` is `non_fiat_currency_or_non_fungible_token_received`.
              sig do
                params(
                  blockchain_transaction_hash: String,
                  destination_wallet_address: String,
                  prior_approved_transactions: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Blockchain transaction hash.
                blockchain_transaction_hash:,
                # Destination wallet address.
                destination_wallet_address:,
                # Prior approved transactions.
                prior_approved_transactions:
              )
              end

              sig do
                override.returns(
                  {
                    blockchain_transaction_hash: String,
                    destination_wallet_address: String,
                    prior_approved_transactions: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end

            class ProofOfCashDisbursement < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::ProofOfCashDisbursement,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation for why the merchant believes the evidence provides proof of cash
              # disbursement.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Proof of cash disbursement details. Present if and only if `reason` is
              # `proof_of_cash_disbursement`.
              sig do
                params(explanation: T.nilable(String)).returns(T.attached_class)
              end
              def self.new(
                # Explanation for why the merchant believes the evidence provides proof of cash
                # disbursement.
                explanation:
              )
              end

              sig { override.returns({ explanation: T.nilable(String) }) }
              def to_hash
              end
            end

            # The reason the merchant re-presented the dispute.
            module Reason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDispute::Visa::NetworkEvent::Represented::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Cardholder no longer disputes the transaction.
              CARDHOLDER_NO_LONGER_DISPUTES =
                T.let(
                  :cardholder_no_longer_disputes,
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                )

              # Credit or reversal was processed.
              CREDIT_OR_REVERSAL_PROCESSED =
                T.let(
                  :credit_or_reversal_processed,
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                )

              # Invalid dispute.
              INVALID_DISPUTE =
                T.let(
                  :invalid_dispute,
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                )

              # Non-fiat currency or non-fungible token is as described by the merchant.
              NON_FIAT_CURRENCY_OR_NON_FUNGIBLE_TOKEN_AS_DESCRIBED =
                T.let(
                  :non_fiat_currency_or_non_fungible_token_as_described,
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                )

              # Non-fiat currency or non-fungible token was received by the cardholder.
              NON_FIAT_CURRENCY_OR_NON_FUNGIBLE_TOKEN_RECEIVED =
                T.let(
                  :non_fiat_currency_or_non_fungible_token_received,
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                )

              # Proof of cash disbursement provided.
              PROOF_OF_CASH_DISBURSEMENT =
                T.let(
                  :proof_of_cash_disbursement,
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                )

              # Reversal issued by merchant.
              REVERSAL_ISSUED =
                T.let(
                  :reversal_issued,
                  Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDispute::Visa::NetworkEvent::Represented::Reason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class ReversalIssued < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::NetworkEvent::Represented::ReversalIssued,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation of the reversal issued by the merchant.
              sig { returns(T.nilable(String)) }
              attr_accessor :explanation

              # Reversal issued by merchant details. Present if and only if `reason` is
              # `reversal_issued`.
              sig do
                params(explanation: T.nilable(String)).returns(T.attached_class)
              end
              def self.new(
                # Explanation of the reversal issued by the merchant.
                explanation:
              )
              end

              sig { override.returns({ explanation: T.nilable(String) }) }
              def to_hash
              end
            end
          end

          class RepresentmentTimedOut < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::RepresentmentTimedOut,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute Re-presentment Timed Out Visa Network Event object. This field
            # will be present in the JSON response if and only if `category` is equal to
            # `representment_timed_out`. Contains the details specific to a re-presentment
            # time-out Visa Card Dispute Network Event, which represents that the user did not
            # respond to the re-presentment by the merchant within the time limit.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class UserPrearbitrationAccepted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationAccepted,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute User Pre-Arbitration Accepted Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_accepted`. Contains the details specific to a user
            # prearbitration accepted Visa Card Dispute Network Event, which represents that
            # the merchant has accepted the user's prearbitration request in the user's favor.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class UserPrearbitrationDeclined < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationDeclined,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute User Pre-Arbitration Declined Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_declined`. Contains the details specific to a user
            # prearbitration declined Visa Card Dispute Network Event, which represents that
            # the merchant has declined the user's prearbitration request.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class UserPrearbitrationSubmitted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationSubmitted,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute User Pre-Arbitration Submitted Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_submitted`. Contains the details specific to a user
            # prearbitration submitted Visa Card Dispute Network Event, which represents that
            # the user's request for prearbitration has been submitted to the network.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class UserPrearbitrationTimedOut < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::UserPrearbitrationTimedOut,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute User Pre-Arbitration Timed Out Visa Network Event object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration_timed_out`. Contains the details specific to a user
            # prearbitration timed out Visa Card Dispute Network Event, which represents that
            # the merchant has timed out responding to the user's prearbitration request.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class UserWithdrawalSubmitted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::NetworkEvent::UserWithdrawalSubmitted,
                  Increase::Internal::AnyHash
                )
              end

            # A Card Dispute User Withdrawal Submitted Visa Network Event object. This field
            # will be present in the JSON response if and only if `category` is equal to
            # `user_withdrawal_submitted`. Contains the details specific to a user withdrawal
            # submitted Visa Card Dispute Network Event, which represents that the user's
            # request to withdraw the dispute has been submitted to the network.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end
        end

        # The category of the currently required user submission if the user wishes to
        # proceed with the dispute. Present if and only if status is
        # `user_submission_required`. Otherwise, this will be `nil`.
        module RequiredUserSubmissionCategory
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardDispute::Visa::RequiredUserSubmissionCategory
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A Chargeback User Submission is required.
          CHARGEBACK =
            T.let(
              :chargeback,
              Increase::CardDispute::Visa::RequiredUserSubmissionCategory::TaggedSymbol
            )

          # A Merchant Pre Arbitration Decline User Submission is required.
          MERCHANT_PREARBITRATION_DECLINE =
            T.let(
              :merchant_prearbitration_decline,
              Increase::CardDispute::Visa::RequiredUserSubmissionCategory::TaggedSymbol
            )

          # A User Initiated Pre Arbitration User Submission is required.
          USER_PREARBITRATION =
            T.let(
              :user_prearbitration,
              Increase::CardDispute::Visa::RequiredUserSubmissionCategory::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardDispute::Visa::RequiredUserSubmissionCategory::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class UserSubmission < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDispute::Visa::UserSubmission,
                Increase::Internal::AnyHash
              )
            end

          # The date and time at which the Visa Card Dispute User Submission was reviewed
          # and accepted.
          sig { returns(T.nilable(Time)) }
          attr_accessor :accepted_at

          # The amount of the dispute if it is different from the amount of a prior user
          # submission or the disputed transaction.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :amount

          # The files attached to the Visa Card Dispute User Submission.
          sig do
            returns(
              T::Array[
                Increase::CardDispute::Visa::UserSubmission::AttachmentFile
              ]
            )
          end
          attr_accessor :attachment_files

          # The category of the user submission. We may add additional possible values for
          # this enum over time; your application should be able to handle such additions
          # gracefully.
          sig do
            returns(
              Increase::CardDispute::Visa::UserSubmission::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # A Visa Card Dispute Chargeback User Submission Chargeback Details object. This
          # field will be present in the JSON response if and only if `category` is equal to
          # `chargeback`. Contains the details specific to a Visa chargeback User Submission
          # for a Card Dispute.
          sig do
            returns(
              T.nilable(Increase::CardDispute::Visa::UserSubmission::Chargeback)
            )
          end
          attr_reader :chargeback

          sig do
            params(
              chargeback:
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::OrHash
                )
            ).void
          end
          attr_writer :chargeback

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Visa Card Dispute User Submission was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # The date and time at which Increase requested further information from the user
          # for the Visa Card Dispute.
          sig { returns(T.nilable(Time)) }
          attr_accessor :further_information_requested_at

          # The reason for Increase requesting further information from the user for the
          # Visa Card Dispute.
          sig { returns(T.nilable(String)) }
          attr_accessor :further_information_requested_reason

          # A Visa Card Dispute Merchant Pre-Arbitration Decline User Submission object.
          # This field will be present in the JSON response if and only if `category` is
          # equal to `merchant_prearbitration_decline`. Contains the details specific to a
          # merchant prearbitration decline Visa Card Dispute User Submission.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline
              )
            )
          end
          attr_reader :merchant_prearbitration_decline

          sig do
            params(
              merchant_prearbitration_decline:
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline::OrHash
                )
            ).void
          end
          attr_writer :merchant_prearbitration_decline

          # The status of the Visa Card Dispute User Submission.
          sig do
            returns(
              Increase::CardDispute::Visa::UserSubmission::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Visa Card Dispute User Submission was updated.
          sig { returns(Time) }
          attr_accessor :updated_at

          # A Visa Card Dispute User-Initiated Pre-Arbitration User Submission object. This
          # field will be present in the JSON response if and only if `category` is equal to
          # `user_prearbitration`. Contains the details specific to a user-initiated
          # pre-arbitration Visa Card Dispute User Submission.
          sig do
            returns(
              T.nilable(
                Increase::CardDispute::Visa::UserSubmission::UserPrearbitration
              )
            )
          end
          attr_reader :user_prearbitration

          sig do
            params(
              user_prearbitration:
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::OrHash
                )
            ).void
          end
          attr_writer :user_prearbitration

          sig do
            params(
              accepted_at: T.nilable(Time),
              amount: T.nilable(Integer),
              attachment_files:
                T::Array[
                  Increase::CardDispute::Visa::UserSubmission::AttachmentFile::OrHash
                ],
              category:
                Increase::CardDispute::Visa::UserSubmission::Category::OrSymbol,
              chargeback:
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::OrHash
                ),
              created_at: Time,
              further_information_requested_at: T.nilable(Time),
              further_information_requested_reason: T.nilable(String),
              merchant_prearbitration_decline:
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline::OrHash
                ),
              status:
                Increase::CardDispute::Visa::UserSubmission::Status::OrSymbol,
              updated_at: Time,
              user_prearbitration:
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The date and time at which the Visa Card Dispute User Submission was reviewed
            # and accepted.
            accepted_at:,
            # The amount of the dispute if it is different from the amount of a prior user
            # submission or the disputed transaction.
            amount:,
            # The files attached to the Visa Card Dispute User Submission.
            attachment_files:,
            # The category of the user submission. We may add additional possible values for
            # this enum over time; your application should be able to handle such additions
            # gracefully.
            category:,
            # A Visa Card Dispute Chargeback User Submission Chargeback Details object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `chargeback`. Contains the details specific to a Visa chargeback User Submission
            # for a Card Dispute.
            chargeback:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the Visa Card Dispute User Submission was created.
            created_at:,
            # The date and time at which Increase requested further information from the user
            # for the Visa Card Dispute.
            further_information_requested_at:,
            # The reason for Increase requesting further information from the user for the
            # Visa Card Dispute.
            further_information_requested_reason:,
            # A Visa Card Dispute Merchant Pre-Arbitration Decline User Submission object.
            # This field will be present in the JSON response if and only if `category` is
            # equal to `merchant_prearbitration_decline`. Contains the details specific to a
            # merchant prearbitration decline Visa Card Dispute User Submission.
            merchant_prearbitration_decline:,
            # The status of the Visa Card Dispute User Submission.
            status:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
            # the Visa Card Dispute User Submission was updated.
            updated_at:,
            # A Visa Card Dispute User-Initiated Pre-Arbitration User Submission object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration`. Contains the details specific to a user-initiated
            # pre-arbitration Visa Card Dispute User Submission.
            user_prearbitration:
          )
          end

          sig do
            override.returns(
              {
                accepted_at: T.nilable(Time),
                amount: T.nilable(Integer),
                attachment_files:
                  T::Array[
                    Increase::CardDispute::Visa::UserSubmission::AttachmentFile
                  ],
                category:
                  Increase::CardDispute::Visa::UserSubmission::Category::TaggedSymbol,
                chargeback:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback
                  ),
                created_at: Time,
                further_information_requested_at: T.nilable(Time),
                further_information_requested_reason: T.nilable(String),
                merchant_prearbitration_decline:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline
                  ),
                status:
                  Increase::CardDispute::Visa::UserSubmission::Status::TaggedSymbol,
                updated_at: Time,
                user_prearbitration:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration
                  )
              }
            )
          end
          def to_hash
          end

          class AttachmentFile < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::UserSubmission::AttachmentFile,
                  Increase::Internal::AnyHash
                )
              end

            # The ID of the file attached to the Card Dispute.
            sig { returns(String) }
            attr_accessor :file_id

            sig { params(file_id: String).returns(T.attached_class) }
            def self.new(
              # The ID of the file attached to the Card Dispute.
              file_id:
            )
            end

            sig { override.returns({ file_id: String }) }
            def to_hash
            end
          end

          # The category of the user submission. We may add additional possible values for
          # this enum over time; your application should be able to handle such additions
          # gracefully.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDispute::Visa::UserSubmission::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa Card Dispute Chargeback User Submission Chargeback Details: details will be under the `chargeback` object.
            CHARGEBACK =
              T.let(
                :chargeback,
                Increase::CardDispute::Visa::UserSubmission::Category::TaggedSymbol
              )

            # Visa Card Dispute Merchant Pre-Arbitration Decline User Submission: details will be under the `merchant_prearbitration_decline` object.
            MERCHANT_PREARBITRATION_DECLINE =
              T.let(
                :merchant_prearbitration_decline,
                Increase::CardDispute::Visa::UserSubmission::Category::TaggedSymbol
              )

            # Visa Card Dispute User-Initiated Pre-Arbitration User Submission: details will be under the `user_prearbitration` object.
            USER_PREARBITRATION =
              T.let(
                :user_prearbitration,
                Increase::CardDispute::Visa::UserSubmission::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDispute::Visa::UserSubmission::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Chargeback < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback,
                  Increase::Internal::AnyHash
                )
              end

            # Authorization. Present if and only if `category` is `authorization`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization
                )
              )
            end
            attr_reader :authorization

            sig do
              params(
                authorization:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::OrHash
                  )
              ).void
            end
            attr_writer :authorization

            # Category.
            sig do
              returns(
                Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Canceled merchandise. Present if and only if `category` is
            # `consumer_canceled_merchandise`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise
                )
              )
            end
            attr_reader :consumer_canceled_merchandise

            sig do
              params(
                consumer_canceled_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::OrHash
                  )
              ).void
            end
            attr_writer :consumer_canceled_merchandise

            # Canceled recurring transaction. Present if and only if `category` is
            # `consumer_canceled_recurring_transaction`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction
                )
              )
            end
            attr_reader :consumer_canceled_recurring_transaction

            sig do
              params(
                consumer_canceled_recurring_transaction:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::OrHash
                  )
              ).void
            end
            attr_writer :consumer_canceled_recurring_transaction

            # Canceled services. Present if and only if `category` is
            # `consumer_canceled_services`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices
                )
              )
            end
            attr_reader :consumer_canceled_services

            sig do
              params(
                consumer_canceled_services:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::OrHash
                  )
              ).void
            end
            attr_writer :consumer_canceled_services

            # Counterfeit merchandise. Present if and only if `category` is
            # `consumer_counterfeit_merchandise`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise
                )
              )
            end
            attr_reader :consumer_counterfeit_merchandise

            sig do
              params(
                consumer_counterfeit_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise::OrHash
                  )
              ).void
            end
            attr_writer :consumer_counterfeit_merchandise

            # Credit not processed. Present if and only if `category` is
            # `consumer_credit_not_processed`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed
                )
              )
            end
            attr_reader :consumer_credit_not_processed

            sig do
              params(
                consumer_credit_not_processed:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed::OrHash
                  )
              ).void
            end
            attr_writer :consumer_credit_not_processed

            # Damaged or defective merchandise. Present if and only if `category` is
            # `consumer_damaged_or_defective_merchandise`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise
                )
              )
            end
            attr_reader :consumer_damaged_or_defective_merchandise

            sig do
              params(
                consumer_damaged_or_defective_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::OrHash
                  )
              ).void
            end
            attr_writer :consumer_damaged_or_defective_merchandise

            # Merchandise misrepresentation. Present if and only if `category` is
            # `consumer_merchandise_misrepresentation`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation
                )
              )
            end
            attr_reader :consumer_merchandise_misrepresentation

            sig do
              params(
                consumer_merchandise_misrepresentation:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::OrHash
                  )
              ).void
            end
            attr_writer :consumer_merchandise_misrepresentation

            # Merchandise not as described. Present if and only if `category` is
            # `consumer_merchandise_not_as_described`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed
                )
              )
            end
            attr_reader :consumer_merchandise_not_as_described

            sig do
              params(
                consumer_merchandise_not_as_described:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::OrHash
                  )
              ).void
            end
            attr_writer :consumer_merchandise_not_as_described

            # Merchandise not received. Present if and only if `category` is
            # `consumer_merchandise_not_received`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived
                )
              )
            end
            attr_reader :consumer_merchandise_not_received

            sig do
              params(
                consumer_merchandise_not_received:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::OrHash
                  )
              ).void
            end
            attr_writer :consumer_merchandise_not_received

            # Non-receipt of cash. Present if and only if `category` is
            # `consumer_non_receipt_of_cash`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash
                )
              )
            end
            attr_reader :consumer_non_receipt_of_cash

            sig do
              params(
                consumer_non_receipt_of_cash:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash::OrHash
                  )
              ).void
            end
            attr_writer :consumer_non_receipt_of_cash

            # Original Credit Transaction (OCT) not accepted. Present if and only if
            # `category` is `consumer_original_credit_transaction_not_accepted`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted
                )
              )
            end
            attr_reader :consumer_original_credit_transaction_not_accepted

            sig do
              params(
                consumer_original_credit_transaction_not_accepted:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::OrHash
                  )
              ).void
            end
            attr_writer :consumer_original_credit_transaction_not_accepted

            # Merchandise quality issue. Present if and only if `category` is
            # `consumer_quality_merchandise`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise
                )
              )
            end
            attr_reader :consumer_quality_merchandise

            sig do
              params(
                consumer_quality_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OrHash
                  )
              ).void
            end
            attr_writer :consumer_quality_merchandise

            # Services quality issue. Present if and only if `category` is
            # `consumer_quality_services`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices
                )
              )
            end
            attr_reader :consumer_quality_services

            sig do
              params(
                consumer_quality_services:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OrHash
                  )
              ).void
            end
            attr_writer :consumer_quality_services

            # Services misrepresentation. Present if and only if `category` is
            # `consumer_services_misrepresentation`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation
                )
              )
            end
            attr_reader :consumer_services_misrepresentation

            sig do
              params(
                consumer_services_misrepresentation:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::OrHash
                  )
              ).void
            end
            attr_writer :consumer_services_misrepresentation

            # Services not as described. Present if and only if `category` is
            # `consumer_services_not_as_described`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed
                )
              )
            end
            attr_reader :consumer_services_not_as_described

            sig do
              params(
                consumer_services_not_as_described:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::OrHash
                  )
              ).void
            end
            attr_writer :consumer_services_not_as_described

            # Services not received. Present if and only if `category` is
            # `consumer_services_not_received`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived
                )
              )
            end
            attr_reader :consumer_services_not_received

            sig do
              params(
                consumer_services_not_received:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::OrHash
                  )
              ).void
            end
            attr_writer :consumer_services_not_received

            # Fraud. Present if and only if `category` is `fraud`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud
                )
              )
            end
            attr_reader :fraud

            sig do
              params(
                fraud:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::OrHash
                  )
              ).void
            end
            attr_writer :fraud

            # Processing error. Present if and only if `category` is `processing_error`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError
                )
              )
            end
            attr_reader :processing_error

            sig do
              params(
                processing_error:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::OrHash
                  )
              ).void
            end
            attr_writer :processing_error

            # A Visa Card Dispute Chargeback User Submission Chargeback Details object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `chargeback`. Contains the details specific to a Visa chargeback User Submission
            # for a Card Dispute.
            sig do
              params(
                authorization:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::OrHash
                  ),
                category:
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::OrSymbol,
                consumer_canceled_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::OrHash
                  ),
                consumer_canceled_recurring_transaction:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::OrHash
                  ),
                consumer_canceled_services:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::OrHash
                  ),
                consumer_counterfeit_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise::OrHash
                  ),
                consumer_credit_not_processed:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed::OrHash
                  ),
                consumer_damaged_or_defective_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::OrHash
                  ),
                consumer_merchandise_misrepresentation:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::OrHash
                  ),
                consumer_merchandise_not_as_described:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::OrHash
                  ),
                consumer_merchandise_not_received:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::OrHash
                  ),
                consumer_non_receipt_of_cash:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash::OrHash
                  ),
                consumer_original_credit_transaction_not_accepted:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::OrHash
                  ),
                consumer_quality_merchandise:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OrHash
                  ),
                consumer_quality_services:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OrHash
                  ),
                consumer_services_misrepresentation:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::OrHash
                  ),
                consumer_services_not_as_described:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::OrHash
                  ),
                consumer_services_not_received:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::OrHash
                  ),
                fraud:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::OrHash
                  ),
                processing_error:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Authorization. Present if and only if `category` is `authorization`.
              authorization:,
              # Category.
              category:,
              # Canceled merchandise. Present if and only if `category` is
              # `consumer_canceled_merchandise`.
              consumer_canceled_merchandise:,
              # Canceled recurring transaction. Present if and only if `category` is
              # `consumer_canceled_recurring_transaction`.
              consumer_canceled_recurring_transaction:,
              # Canceled services. Present if and only if `category` is
              # `consumer_canceled_services`.
              consumer_canceled_services:,
              # Counterfeit merchandise. Present if and only if `category` is
              # `consumer_counterfeit_merchandise`.
              consumer_counterfeit_merchandise:,
              # Credit not processed. Present if and only if `category` is
              # `consumer_credit_not_processed`.
              consumer_credit_not_processed:,
              # Damaged or defective merchandise. Present if and only if `category` is
              # `consumer_damaged_or_defective_merchandise`.
              consumer_damaged_or_defective_merchandise:,
              # Merchandise misrepresentation. Present if and only if `category` is
              # `consumer_merchandise_misrepresentation`.
              consumer_merchandise_misrepresentation:,
              # Merchandise not as described. Present if and only if `category` is
              # `consumer_merchandise_not_as_described`.
              consumer_merchandise_not_as_described:,
              # Merchandise not received. Present if and only if `category` is
              # `consumer_merchandise_not_received`.
              consumer_merchandise_not_received:,
              # Non-receipt of cash. Present if and only if `category` is
              # `consumer_non_receipt_of_cash`.
              consumer_non_receipt_of_cash:,
              # Original Credit Transaction (OCT) not accepted. Present if and only if
              # `category` is `consumer_original_credit_transaction_not_accepted`.
              consumer_original_credit_transaction_not_accepted:,
              # Merchandise quality issue. Present if and only if `category` is
              # `consumer_quality_merchandise`.
              consumer_quality_merchandise:,
              # Services quality issue. Present if and only if `category` is
              # `consumer_quality_services`.
              consumer_quality_services:,
              # Services misrepresentation. Present if and only if `category` is
              # `consumer_services_misrepresentation`.
              consumer_services_misrepresentation:,
              # Services not as described. Present if and only if `category` is
              # `consumer_services_not_as_described`.
              consumer_services_not_as_described:,
              # Services not received. Present if and only if `category` is
              # `consumer_services_not_received`.
              consumer_services_not_received:,
              # Fraud. Present if and only if `category` is `fraud`.
              fraud:,
              # Processing error. Present if and only if `category` is `processing_error`.
              processing_error:
            )
            end

            sig do
              override.returns(
                {
                  authorization:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization
                    ),
                  category:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol,
                  consumer_canceled_merchandise:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise
                    ),
                  consumer_canceled_recurring_transaction:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction
                    ),
                  consumer_canceled_services:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices
                    ),
                  consumer_counterfeit_merchandise:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise
                    ),
                  consumer_credit_not_processed:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed
                    ),
                  consumer_damaged_or_defective_merchandise:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise
                    ),
                  consumer_merchandise_misrepresentation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation
                    ),
                  consumer_merchandise_not_as_described:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed
                    ),
                  consumer_merchandise_not_received:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived
                    ),
                  consumer_non_receipt_of_cash:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash
                    ),
                  consumer_original_credit_transaction_not_accepted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted
                    ),
                  consumer_quality_merchandise:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise
                    ),
                  consumer_quality_services:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices
                    ),
                  consumer_services_misrepresentation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation
                    ),
                  consumer_services_not_as_described:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed
                    ),
                  consumer_services_not_received:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived
                    ),
                  fraud:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud
                    ),
                  processing_error:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError
                    )
                }
              )
            end
            def to_hash
            end

            class Authorization < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization,
                    Increase::Internal::AnyHash
                  )
                end

              # Account status.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus::TaggedSymbol
                )
              end
              attr_accessor :account_status

              # Authorization. Present if and only if `category` is `authorization`.
              sig do
                params(
                  account_status:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Account status.
                account_status:
              )
              end

              sig do
                override.returns(
                  {
                    account_status:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # Account status.
              module AccountStatus
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Account closed.
                ACCOUNT_CLOSED =
                  T.let(
                    :account_closed,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus::TaggedSymbol
                  )

                # Credit problem.
                CREDIT_PROBLEM =
                  T.let(
                    :credit_problem,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus::TaggedSymbol
                  )

                # Fraud.
                FRAUD =
                  T.let(
                    :fraud,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Authorization::AccountStatus::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            # Category.
            module Category
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Authorization.
              AUTHORIZATION =
                T.let(
                  :authorization,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: canceled merchandise.
              CONSUMER_CANCELED_MERCHANDISE =
                T.let(
                  :consumer_canceled_merchandise,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: canceled recurring transaction.
              CONSUMER_CANCELED_RECURRING_TRANSACTION =
                T.let(
                  :consumer_canceled_recurring_transaction,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: canceled services.
              CONSUMER_CANCELED_SERVICES =
                T.let(
                  :consumer_canceled_services,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: counterfeit merchandise.
              CONSUMER_COUNTERFEIT_MERCHANDISE =
                T.let(
                  :consumer_counterfeit_merchandise,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: credit not processed.
              CONSUMER_CREDIT_NOT_PROCESSED =
                T.let(
                  :consumer_credit_not_processed,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: damaged or defective merchandise.
              CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE =
                T.let(
                  :consumer_damaged_or_defective_merchandise,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: merchandise misrepresentation.
              CONSUMER_MERCHANDISE_MISREPRESENTATION =
                T.let(
                  :consumer_merchandise_misrepresentation,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: merchandise not as described.
              CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED =
                T.let(
                  :consumer_merchandise_not_as_described,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: merchandise not received.
              CONSUMER_MERCHANDISE_NOT_RECEIVED =
                T.let(
                  :consumer_merchandise_not_received,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: non-receipt of cash.
              CONSUMER_NON_RECEIPT_OF_CASH =
                T.let(
                  :consumer_non_receipt_of_cash,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: Original Credit Transaction (OCT) not accepted.
              CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED =
                T.let(
                  :consumer_original_credit_transaction_not_accepted,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: merchandise quality issue.
              CONSUMER_QUALITY_MERCHANDISE =
                T.let(
                  :consumer_quality_merchandise,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: services quality issue.
              CONSUMER_QUALITY_SERVICES =
                T.let(
                  :consumer_quality_services,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: services misrepresentation.
              CONSUMER_SERVICES_MISREPRESENTATION =
                T.let(
                  :consumer_services_misrepresentation,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: services not as described.
              CONSUMER_SERVICES_NOT_AS_DESCRIBED =
                T.let(
                  :consumer_services_not_as_described,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Consumer: services not received.
              CONSUMER_SERVICES_NOT_RECEIVED =
                T.let(
                  :consumer_services_not_received,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Fraud.
              FRAUD =
                T.let(
                  :fraud,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              # Processing error.
              PROCESSING_ERROR =
                T.let(
                  :processing_error,
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class ConsumerCanceledMerchandise < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise,
                    Increase::Internal::AnyHash
                  )
                end

              # Cardholder cancellation.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation
                  )
                )
              end
              attr_reader :cardholder_cancellation

              sig do
                params(
                  cardholder_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::OrHash
                    )
                ).void
              end
              attr_writer :cardholder_cancellation

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Not returned. Present if and only if `return_outcome` is `not_returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned
                  )
                )
              end
              attr_reader :not_returned

              sig do
                params(
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned::OrHash
                    )
                ).void
              end
              attr_writer :not_returned

              # Purchase explanation.
              sig { returns(String) }
              attr_accessor :purchase_explanation

              # Received or expected at.
              sig { returns(Date) }
              attr_accessor :received_or_expected_at

              # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted
                  )
                )
              end
              attr_reader :return_attempted

              sig do
                params(
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::OrHash
                    )
                ).void
              end
              attr_writer :return_attempted

              # Return outcome.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                )
              end
              attr_accessor :return_outcome

              # Returned. Present if and only if `return_outcome` is `returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned
                  )
                )
              end
              attr_reader :returned

              sig do
                params(
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::OrHash
                    )
                ).void
              end
              attr_writer :returned

              # Canceled merchandise. Present if and only if `category` is
              # `consumer_canceled_merchandise`.
              sig do
                params(
                  cardholder_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::OrHash
                    ),
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::OrSymbol,
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned::OrHash
                    ),
                  purchase_explanation: String,
                  received_or_expected_at: Date,
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::OrHash
                    ),
                  return_outcome:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::OrSymbol,
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::OrHash
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Cardholder cancellation.
                cardholder_cancellation:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                not_returned:,
                # Purchase explanation.
                purchase_explanation:,
                # Received or expected at.
                received_or_expected_at:,
                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                return_attempted:,
                # Return outcome.
                return_outcome:,
                # Returned. Present if and only if `return_outcome` is `returned`.
                returned:
              )
              end

              sig do
                override.returns(
                  {
                    cardholder_cancellation:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation
                      ),
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol,
                    not_returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned
                      ),
                    purchase_explanation: String,
                    received_or_expected_at: Date,
                    return_attempted:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted
                      ),
                    return_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol,
                    returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned
                      )
                  }
                )
              end
              def to_hash
              end

              class CardholderCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Canceled prior to ship date.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                  )
                end
                attr_accessor :canceled_prior_to_ship_date

                # Cancellation policy provided.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  )
                end
                attr_accessor :cancellation_policy_provided

                # Reason.
                sig { returns(String) }
                attr_accessor :reason

                # Cardholder cancellation.
                sig do
                  params(
                    canceled_at: Date,
                    canceled_prior_to_ship_date:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::OrSymbol,
                    cancellation_policy_provided:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
                    reason: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Canceled at.
                  canceled_at:,
                  # Canceled prior to ship date.
                  canceled_prior_to_ship_date:,
                  # Cancellation policy provided.
                  cancellation_policy_provided:,
                  # Reason.
                  reason:
                )
                end

                sig do
                  override.returns(
                    {
                      canceled_at: Date,
                      canceled_prior_to_ship_date:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol,
                      cancellation_policy_provided:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol,
                      reason: String
                    }
                  )
                end
                def to_hash
                end

                # Canceled prior to ship date.
                module CanceledPriorToShipDate
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Canceled prior to ship date.
                  CANCELED_PRIOR_TO_SHIP_DATE =
                    T.let(
                      :canceled_prior_to_ship_date,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                    )

                  # Not canceled prior to ship date.
                  NOT_CANCELED_PRIOR_TO_SHIP_DATE =
                    T.let(
                      :not_canceled_prior_to_ship_date,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                # Cancellation policy provided.
                module CancellationPolicyProvided
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Not provided.
                  NOT_PROVIDED =
                    T.let(
                      :not_provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                    )

                  # Provided.
                  PROVIDED =
                    T.let(
                      :provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class NotReturned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::NotReturned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end

              class ReturnAttempted < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted,
                      Increase::Internal::AnyHash
                    )
                  end

                # Attempt explanation.
                sig { returns(String) }
                attr_accessor :attempt_explanation

                # Attempt reason.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )
                end
                attr_accessor :attempt_reason

                # Attempted at.
                sig { returns(Date) }
                attr_accessor :attempted_at

                # Merchandise disposition.
                sig { returns(String) }
                attr_accessor :merchandise_disposition

                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                sig do
                  params(
                    attempt_explanation: String,
                    attempt_reason:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                    attempted_at: Date,
                    merchandise_disposition: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Attempt explanation.
                  attempt_explanation:,
                  # Attempt reason.
                  attempt_reason:,
                  # Attempted at.
                  attempted_at:,
                  # Merchandise disposition.
                  merchandise_disposition:
                )
                end

                sig do
                  override.returns(
                    {
                      attempt_explanation: String,
                      attempt_reason:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol,
                      attempted_at: Date,
                      merchandise_disposition: String
                    }
                  )
                end
                def to_hash
                end

                # Attempt reason.
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING =
                    T.let(
                      :merchant_not_responding,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED =
                    T.let(
                      :no_return_authorization_provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS =
                    T.let(
                      :no_return_instructions,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN =
                    T.let(
                      :requested_not_to_return,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED =
                    T.let(
                      :return_not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Return outcome.
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not returned.
                NOT_RETURNED =
                  T.let(
                    :not_returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                  )

                # Returned.
                RETURNED =
                  T.let(
                    :returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                  )

                # Return attempted.
                RETURN_ATTEMPTED =
                  T.let(
                    :return_attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Returned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Merchant received return at.
                sig { returns(T.nilable(Date)) }
                attr_accessor :merchant_received_return_at

                # Other explanation. Required if and only if the return method is `other`.
                sig { returns(T.nilable(String)) }
                attr_accessor :other_explanation

                # Return method.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )
                end
                attr_accessor :return_method

                # Returned at.
                sig { returns(Date) }
                attr_accessor :returned_at

                # Tracking number.
                sig { returns(T.nilable(String)) }
                attr_accessor :tracking_number

                # Returned. Present if and only if `return_outcome` is `returned`.
                sig do
                  params(
                    merchant_received_return_at: T.nilable(Date),
                    other_explanation: T.nilable(String),
                    return_method:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::OrSymbol,
                    returned_at: Date,
                    tracking_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Merchant received return at.
                  merchant_received_return_at:,
                  # Other explanation. Required if and only if the return method is `other`.
                  other_explanation:,
                  # Return method.
                  return_method:,
                  # Returned at.
                  returned_at:,
                  # Tracking number.
                  tracking_number:
                )
                end

                sig do
                  override.returns(
                    {
                      merchant_received_return_at: T.nilable(Date),
                      other_explanation: T.nilable(String),
                      return_method:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol,
                      returned_at: Date,
                      tracking_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Return method.
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # DHL.
                  DHL =
                    T.let(
                      :dhl,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Face-to-face.
                  FACE_TO_FACE =
                    T.let(
                      :face_to_face,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # FedEx.
                  FEDEX =
                    T.let(
                      :fedex,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Other.
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Postal service.
                  POSTAL_SERVICE =
                    T.let(
                      :postal_service,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # UPS.
                  UPS =
                    T.let(
                      :ups,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class ConsumerCanceledRecurringTransaction < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction,
                    Increase::Internal::AnyHash
                  )
                end

              # Cancellation target.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
                )
              end
              attr_accessor :cancellation_target

              # Merchant contact methods.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods
                )
              end
              attr_reader :merchant_contact_methods

              sig do
                params(
                  merchant_contact_methods:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods::OrHash
                ).void
              end
              attr_writer :merchant_contact_methods

              # Other form of payment explanation.
              sig { returns(T.nilable(String)) }
              attr_accessor :other_form_of_payment_explanation

              # Transaction or account canceled at.
              sig { returns(Date) }
              attr_accessor :transaction_or_account_canceled_at

              # Canceled recurring transaction. Present if and only if `category` is
              # `consumer_canceled_recurring_transaction`.
              sig do
                params(
                  cancellation_target:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::OrSymbol,
                  merchant_contact_methods:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods::OrHash,
                  other_form_of_payment_explanation: T.nilable(String),
                  transaction_or_account_canceled_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # Cancellation target.
                cancellation_target:,
                # Merchant contact methods.
                merchant_contact_methods:,
                # Other form of payment explanation.
                other_form_of_payment_explanation:,
                # Transaction or account canceled at.
                transaction_or_account_canceled_at:
              )
              end

              sig do
                override.returns(
                  {
                    cancellation_target:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol,
                    merchant_contact_methods:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods,
                    other_form_of_payment_explanation: T.nilable(String),
                    transaction_or_account_canceled_at: Date
                  }
                )
              end
              def to_hash
              end

              # Cancellation target.
              module CancellationTarget
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Account.
                ACCOUNT =
                  T.let(
                    :account,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
                  )

                # Transaction.
                TRANSACTION =
                  T.let(
                    :transaction,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class MerchantContactMethods < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods,
                      Increase::Internal::AnyHash
                    )
                  end

                # Application name.
                sig { returns(T.nilable(String)) }
                attr_accessor :application_name

                # Call center phone number.
                sig { returns(T.nilable(String)) }
                attr_accessor :call_center_phone_number

                # Email address.
                sig { returns(T.nilable(String)) }
                attr_accessor :email_address

                # In person address.
                sig { returns(T.nilable(String)) }
                attr_accessor :in_person_address

                # Mailing address.
                sig { returns(T.nilable(String)) }
                attr_accessor :mailing_address

                # Text phone number.
                sig { returns(T.nilable(String)) }
                attr_accessor :text_phone_number

                # Merchant contact methods.
                sig do
                  params(
                    application_name: T.nilable(String),
                    call_center_phone_number: T.nilable(String),
                    email_address: T.nilable(String),
                    in_person_address: T.nilable(String),
                    mailing_address: T.nilable(String),
                    text_phone_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Application name.
                  application_name:,
                  # Call center phone number.
                  call_center_phone_number:,
                  # Email address.
                  email_address:,
                  # In person address.
                  in_person_address:,
                  # Mailing address.
                  mailing_address:,
                  # Text phone number.
                  text_phone_number:
                )
                end

                sig do
                  override.returns(
                    {
                      application_name: T.nilable(String),
                      call_center_phone_number: T.nilable(String),
                      email_address: T.nilable(String),
                      in_person_address: T.nilable(String),
                      mailing_address: T.nilable(String),
                      text_phone_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end
              end
            end

            class ConsumerCanceledServices < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices,
                    Increase::Internal::AnyHash
                  )
                end

              # Cardholder cancellation.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation
                )
              end
              attr_reader :cardholder_cancellation

              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::OrHash
                ).void
              end
              attr_writer :cardholder_cancellation

              # Contracted at.
              sig { returns(Date) }
              attr_accessor :contracted_at

              # Guaranteed reservation explanation. Present if and only if `service_type` is
              # `guaranteed_reservation`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation
                  )
                )
              end
              attr_reader :guaranteed_reservation

              sig do
                params(
                  guaranteed_reservation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::OrHash
                    )
                ).void
              end
              attr_writer :guaranteed_reservation

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Other service type explanation. Present if and only if `service_type` is
              # `other`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other
                  )
                )
              end
              attr_reader :other

              sig do
                params(
                  other:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other::OrHash
                    )
                ).void
              end
              attr_writer :other

              # Purchase explanation.
              sig { returns(String) }
              attr_accessor :purchase_explanation

              # Service type.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                )
              end
              attr_accessor :service_type

              # Timeshare explanation. Present if and only if `service_type` is `timeshare`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare
                  )
                )
              end
              attr_reader :timeshare

              sig do
                params(
                  timeshare:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare::OrHash
                    )
                ).void
              end
              attr_writer :timeshare

              # Canceled services. Present if and only if `category` is
              # `consumer_canceled_services`.
              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::OrHash,
                  contracted_at: Date,
                  guaranteed_reservation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::OrHash
                    ),
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::OrSymbol,
                  other:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other::OrHash
                    ),
                  purchase_explanation: String,
                  service_type:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType::OrSymbol,
                  timeshare:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare::OrHash
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Cardholder cancellation.
                cardholder_cancellation:,
                # Contracted at.
                contracted_at:,
                # Guaranteed reservation explanation. Present if and only if `service_type` is
                # `guaranteed_reservation`.
                guaranteed_reservation:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Other service type explanation. Present if and only if `service_type` is
                # `other`.
                other:,
                # Purchase explanation.
                purchase_explanation:,
                # Service type.
                service_type:,
                # Timeshare explanation. Present if and only if `service_type` is `timeshare`.
                timeshare:
              )
              end

              sig do
                override.returns(
                  {
                    cardholder_cancellation:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation,
                    contracted_at: Date,
                    guaranteed_reservation:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation
                      ),
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol,
                    other:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other
                      ),
                    purchase_explanation: String,
                    service_type:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol,
                    timeshare:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare
                      )
                  }
                )
              end
              def to_hash
              end

              class CardholderCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Cancellation policy provided.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  )
                end
                attr_accessor :cancellation_policy_provided

                # Reason.
                sig { returns(String) }
                attr_accessor :reason

                # Cardholder cancellation.
                sig do
                  params(
                    canceled_at: Date,
                    cancellation_policy_provided:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
                    reason: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Canceled at.
                  canceled_at:,
                  # Cancellation policy provided.
                  cancellation_policy_provided:,
                  # Reason.
                  reason:
                )
                end

                sig do
                  override.returns(
                    {
                      canceled_at: Date,
                      cancellation_policy_provided:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol,
                      reason: String
                    }
                  )
                end
                def to_hash
                end

                # Cancellation policy provided.
                module CancellationPolicyProvided
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Not provided.
                  NOT_PROVIDED =
                    T.let(
                      :not_provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                    )

                  # Provided.
                  PROVIDED =
                    T.let(
                      :provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              class GuaranteedReservation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Explanation.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                  )
                end
                attr_accessor :explanation

                # Guaranteed reservation explanation. Present if and only if `service_type` is
                # `guaranteed_reservation`.
                sig do
                  params(
                    explanation:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::OrSymbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Explanation.
                  explanation:
                )
                end

                sig do
                  override.returns(
                    {
                      explanation:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                    }
                  )
                end
                def to_hash
                end

                # Explanation.
                module Explanation
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Cardholder canceled prior to service.
                  CARDHOLDER_CANCELED_PRIOR_TO_SERVICE =
                    T.let(
                      :cardholder_canceled_prior_to_service,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                    )

                  # Cardholder cancellation attempt within 24 hours of confirmation.
                  CARDHOLDER_CANCELLATION_ATTEMPT_WITHIN_24_HOURS_OF_CONFIRMATION =
                    T.let(
                      :cardholder_cancellation_attempt_within_24_hours_of_confirmation,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                    )

                  # Merchant billed for no-show.
                  MERCHANT_BILLED_NO_SHOW =
                    T.let(
                      :merchant_billed_no_show,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Other < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Other,
                      Increase::Internal::AnyHash
                    )
                  end

                # Other service type explanation. Present if and only if `service_type` is
                # `other`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end

              # Service type.
              module ServiceType
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Guaranteed reservation.
                GUARANTEED_RESERVATION =
                  T.let(
                    :guaranteed_reservation,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                  )

                # Timeshare.
                TIMESHARE =
                  T.let(
                    :timeshare,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Timeshare < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCanceledServices::Timeshare,
                      Increase::Internal::AnyHash
                    )
                  end

                # Timeshare explanation. Present if and only if `service_type` is `timeshare`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end
            end

            class ConsumerCounterfeitMerchandise < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCounterfeitMerchandise,
                    Increase::Internal::AnyHash
                  )
                end

              # Counterfeit explanation.
              sig { returns(String) }
              attr_accessor :counterfeit_explanation

              # Disposition explanation.
              sig { returns(String) }
              attr_accessor :disposition_explanation

              # Order explanation.
              sig { returns(String) }
              attr_accessor :order_explanation

              # Received at.
              sig { returns(Date) }
              attr_accessor :received_at

              # Counterfeit merchandise. Present if and only if `category` is
              # `consumer_counterfeit_merchandise`.
              sig do
                params(
                  counterfeit_explanation: String,
                  disposition_explanation: String,
                  order_explanation: String,
                  received_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # Counterfeit explanation.
                counterfeit_explanation:,
                # Disposition explanation.
                disposition_explanation:,
                # Order explanation.
                order_explanation:,
                # Received at.
                received_at:
              )
              end

              sig do
                override.returns(
                  {
                    counterfeit_explanation: String,
                    disposition_explanation: String,
                    order_explanation: String,
                    received_at: Date
                  }
                )
              end
              def to_hash
              end
            end

            class ConsumerCreditNotProcessed < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerCreditNotProcessed,
                    Increase::Internal::AnyHash
                  )
                end

              # Canceled or returned at.
              sig { returns(T.nilable(Date)) }
              attr_accessor :canceled_or_returned_at

              # Credit expected at.
              sig { returns(T.nilable(Date)) }
              attr_accessor :credit_expected_at

              # Credit not processed. Present if and only if `category` is
              # `consumer_credit_not_processed`.
              sig do
                params(
                  canceled_or_returned_at: T.nilable(Date),
                  credit_expected_at: T.nilable(Date)
                ).returns(T.attached_class)
              end
              def self.new(
                # Canceled or returned at.
                canceled_or_returned_at:,
                # Credit expected at.
                credit_expected_at:
              )
              end

              sig do
                override.returns(
                  {
                    canceled_or_returned_at: T.nilable(Date),
                    credit_expected_at: T.nilable(Date)
                  }
                )
              end
              def to_hash
              end
            end

            class ConsumerDamagedOrDefectiveMerchandise < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise,
                    Increase::Internal::AnyHash
                  )
                end

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Not returned. Present if and only if `return_outcome` is `not_returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned
                  )
                )
              end
              attr_reader :not_returned

              sig do
                params(
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned::OrHash
                    )
                ).void
              end
              attr_writer :not_returned

              # Order and issue explanation.
              sig { returns(String) }
              attr_accessor :order_and_issue_explanation

              # Received at.
              sig { returns(Date) }
              attr_accessor :received_at

              # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted
                  )
                )
              end
              attr_reader :return_attempted

              sig do
                params(
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::OrHash
                    )
                ).void
              end
              attr_writer :return_attempted

              # Return outcome.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                )
              end
              attr_accessor :return_outcome

              # Returned. Present if and only if `return_outcome` is `returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned
                  )
                )
              end
              attr_reader :returned

              sig do
                params(
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::OrHash
                    )
                ).void
              end
              attr_writer :returned

              # Damaged or defective merchandise. Present if and only if `category` is
              # `consumer_damaged_or_defective_merchandise`.
              sig do
                params(
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::OrSymbol,
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned::OrHash
                    ),
                  order_and_issue_explanation: String,
                  received_at: Date,
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::OrHash
                    ),
                  return_outcome:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::OrSymbol,
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::OrHash
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                not_returned:,
                # Order and issue explanation.
                order_and_issue_explanation:,
                # Received at.
                received_at:,
                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                return_attempted:,
                # Return outcome.
                return_outcome:,
                # Returned. Present if and only if `return_outcome` is `returned`.
                returned:
              )
              end

              sig do
                override.returns(
                  {
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol,
                    not_returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned
                      ),
                    order_and_issue_explanation: String,
                    received_at: Date,
                    return_attempted:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted
                      ),
                    return_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol,
                    returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned
                      )
                  }
                )
              end
              def to_hash
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class NotReturned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end

              class ReturnAttempted < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted,
                      Increase::Internal::AnyHash
                    )
                  end

                # Attempt explanation.
                sig { returns(String) }
                attr_accessor :attempt_explanation

                # Attempt reason.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )
                end
                attr_accessor :attempt_reason

                # Attempted at.
                sig { returns(Date) }
                attr_accessor :attempted_at

                # Merchandise disposition.
                sig { returns(String) }
                attr_accessor :merchandise_disposition

                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                sig do
                  params(
                    attempt_explanation: String,
                    attempt_reason:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                    attempted_at: Date,
                    merchandise_disposition: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Attempt explanation.
                  attempt_explanation:,
                  # Attempt reason.
                  attempt_reason:,
                  # Attempted at.
                  attempted_at:,
                  # Merchandise disposition.
                  merchandise_disposition:
                )
                end

                sig do
                  override.returns(
                    {
                      attempt_explanation: String,
                      attempt_reason:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol,
                      attempted_at: Date,
                      merchandise_disposition: String
                    }
                  )
                end
                def to_hash
                end

                # Attempt reason.
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING =
                    T.let(
                      :merchant_not_responding,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED =
                    T.let(
                      :no_return_authorization_provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS =
                    T.let(
                      :no_return_instructions,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN =
                    T.let(
                      :requested_not_to_return,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED =
                    T.let(
                      :return_not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Return outcome.
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not returned.
                NOT_RETURNED =
                  T.let(
                    :not_returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                  )

                # Returned.
                RETURNED =
                  T.let(
                    :returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                  )

                # Return attempted.
                RETURN_ATTEMPTED =
                  T.let(
                    :return_attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Returned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Merchant received return at.
                sig { returns(T.nilable(Date)) }
                attr_accessor :merchant_received_return_at

                # Other explanation. Required if and only if the return method is `other`.
                sig { returns(T.nilable(String)) }
                attr_accessor :other_explanation

                # Return method.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )
                end
                attr_accessor :return_method

                # Returned at.
                sig { returns(Date) }
                attr_accessor :returned_at

                # Tracking number.
                sig { returns(T.nilable(String)) }
                attr_accessor :tracking_number

                # Returned. Present if and only if `return_outcome` is `returned`.
                sig do
                  params(
                    merchant_received_return_at: T.nilable(Date),
                    other_explanation: T.nilable(String),
                    return_method:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::OrSymbol,
                    returned_at: Date,
                    tracking_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Merchant received return at.
                  merchant_received_return_at:,
                  # Other explanation. Required if and only if the return method is `other`.
                  other_explanation:,
                  # Return method.
                  return_method:,
                  # Returned at.
                  returned_at:,
                  # Tracking number.
                  tracking_number:
                )
                end

                sig do
                  override.returns(
                    {
                      merchant_received_return_at: T.nilable(Date),
                      other_explanation: T.nilable(String),
                      return_method:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol,
                      returned_at: Date,
                      tracking_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Return method.
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # DHL.
                  DHL =
                    T.let(
                      :dhl,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Face-to-face.
                  FACE_TO_FACE =
                    T.let(
                      :face_to_face,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # FedEx.
                  FEDEX =
                    T.let(
                      :fedex,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Other.
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Postal service.
                  POSTAL_SERVICE =
                    T.let(
                      :postal_service,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # UPS.
                  UPS =
                    T.let(
                      :ups,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class ConsumerMerchandiseMisrepresentation < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation,
                    Increase::Internal::AnyHash
                  )
                end

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Misrepresentation explanation.
              sig { returns(String) }
              attr_accessor :misrepresentation_explanation

              # Not returned. Present if and only if `return_outcome` is `not_returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned
                  )
                )
              end
              attr_reader :not_returned

              sig do
                params(
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned::OrHash
                    )
                ).void
              end
              attr_writer :not_returned

              # Purchase explanation.
              sig { returns(String) }
              attr_accessor :purchase_explanation

              # Received at.
              sig { returns(Date) }
              attr_accessor :received_at

              # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted
                  )
                )
              end
              attr_reader :return_attempted

              sig do
                params(
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::OrHash
                    )
                ).void
              end
              attr_writer :return_attempted

              # Return outcome.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                )
              end
              attr_accessor :return_outcome

              # Returned. Present if and only if `return_outcome` is `returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned
                  )
                )
              end
              attr_reader :returned

              sig do
                params(
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::OrHash
                    )
                ).void
              end
              attr_writer :returned

              # Merchandise misrepresentation. Present if and only if `category` is
              # `consumer_merchandise_misrepresentation`.
              sig do
                params(
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::OrSymbol,
                  misrepresentation_explanation: String,
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned::OrHash
                    ),
                  purchase_explanation: String,
                  received_at: Date,
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::OrHash
                    ),
                  return_outcome:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::OrSymbol,
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::OrHash
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Misrepresentation explanation.
                misrepresentation_explanation:,
                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                not_returned:,
                # Purchase explanation.
                purchase_explanation:,
                # Received at.
                received_at:,
                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                return_attempted:,
                # Return outcome.
                return_outcome:,
                # Returned. Present if and only if `return_outcome` is `returned`.
                returned:
              )
              end

              sig do
                override.returns(
                  {
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol,
                    misrepresentation_explanation: String,
                    not_returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned
                      ),
                    purchase_explanation: String,
                    received_at: Date,
                    return_attempted:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted
                      ),
                    return_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol,
                    returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned
                      )
                  }
                )
              end
              def to_hash
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class NotReturned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end

              class ReturnAttempted < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted,
                      Increase::Internal::AnyHash
                    )
                  end

                # Attempt explanation.
                sig { returns(String) }
                attr_accessor :attempt_explanation

                # Attempt reason.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                  )
                end
                attr_accessor :attempt_reason

                # Attempted at.
                sig { returns(Date) }
                attr_accessor :attempted_at

                # Merchandise disposition.
                sig { returns(String) }
                attr_accessor :merchandise_disposition

                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                sig do
                  params(
                    attempt_explanation: String,
                    attempt_reason:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::OrSymbol,
                    attempted_at: Date,
                    merchandise_disposition: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Attempt explanation.
                  attempt_explanation:,
                  # Attempt reason.
                  attempt_reason:,
                  # Attempted at.
                  attempted_at:,
                  # Merchandise disposition.
                  merchandise_disposition:
                )
                end

                sig do
                  override.returns(
                    {
                      attempt_explanation: String,
                      attempt_reason:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol,
                      attempted_at: Date,
                      merchandise_disposition: String
                    }
                  )
                end
                def to_hash
                end

                # Attempt reason.
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING =
                    T.let(
                      :merchant_not_responding,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED =
                    T.let(
                      :no_return_authorization_provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS =
                    T.let(
                      :no_return_instructions,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN =
                    T.let(
                      :requested_not_to_return,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED =
                    T.let(
                      :return_not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Return outcome.
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not returned.
                NOT_RETURNED =
                  T.let(
                    :not_returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                  )

                # Returned.
                RETURNED =
                  T.let(
                    :returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                  )

                # Return attempted.
                RETURN_ATTEMPTED =
                  T.let(
                    :return_attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Returned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Merchant received return at.
                sig { returns(T.nilable(Date)) }
                attr_accessor :merchant_received_return_at

                # Other explanation. Required if and only if the return method is `other`.
                sig { returns(T.nilable(String)) }
                attr_accessor :other_explanation

                # Return method.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  )
                end
                attr_accessor :return_method

                # Returned at.
                sig { returns(Date) }
                attr_accessor :returned_at

                # Tracking number.
                sig { returns(T.nilable(String)) }
                attr_accessor :tracking_number

                # Returned. Present if and only if `return_outcome` is `returned`.
                sig do
                  params(
                    merchant_received_return_at: T.nilable(Date),
                    other_explanation: T.nilable(String),
                    return_method:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::OrSymbol,
                    returned_at: Date,
                    tracking_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Merchant received return at.
                  merchant_received_return_at:,
                  # Other explanation. Required if and only if the return method is `other`.
                  other_explanation:,
                  # Return method.
                  return_method:,
                  # Returned at.
                  returned_at:,
                  # Tracking number.
                  tracking_number:
                )
                end

                sig do
                  override.returns(
                    {
                      merchant_received_return_at: T.nilable(Date),
                      other_explanation: T.nilable(String),
                      return_method:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol,
                      returned_at: Date,
                      tracking_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Return method.
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # DHL.
                  DHL =
                    T.let(
                      :dhl,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Face-to-face.
                  FACE_TO_FACE =
                    T.let(
                      :face_to_face,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                    )

                  # FedEx.
                  FEDEX =
                    T.let(
                      :fedex,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Other.
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Postal service.
                  POSTAL_SERVICE =
                    T.let(
                      :postal_service,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                    )

                  # UPS.
                  UPS =
                    T.let(
                      :ups,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class ConsumerMerchandiseNotAsDescribed < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed,
                    Increase::Internal::AnyHash
                  )
                end

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Received at.
              sig { returns(Date) }
              attr_accessor :received_at

              # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted
                  )
                )
              end
              attr_reader :return_attempted

              sig do
                params(
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::OrHash
                    )
                ).void
              end
              attr_writer :return_attempted

              # Return outcome.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
                )
              end
              attr_accessor :return_outcome

              # Returned. Present if and only if `return_outcome` is `returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned
                  )
                )
              end
              attr_reader :returned

              sig do
                params(
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::OrHash
                    )
                ).void
              end
              attr_writer :returned

              # Merchandise not as described. Present if and only if `category` is
              # `consumer_merchandise_not_as_described`.
              sig do
                params(
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
                  received_at: Date,
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::OrHash
                    ),
                  return_outcome:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::OrSymbol,
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::OrHash
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Received at.
                received_at:,
                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                return_attempted:,
                # Return outcome.
                return_outcome:,
                # Returned. Present if and only if `return_outcome` is `returned`.
                returned:
              )
              end

              sig do
                override.returns(
                  {
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol,
                    received_at: Date,
                    return_attempted:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted
                      ),
                    return_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol,
                    returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned
                      )
                  }
                )
              end
              def to_hash
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class ReturnAttempted < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted,
                      Increase::Internal::AnyHash
                    )
                  end

                # Attempt explanation.
                sig { returns(String) }
                attr_accessor :attempt_explanation

                # Attempt reason.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                  )
                end
                attr_accessor :attempt_reason

                # Attempted at.
                sig { returns(Date) }
                attr_accessor :attempted_at

                # Merchandise disposition.
                sig { returns(String) }
                attr_accessor :merchandise_disposition

                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                sig do
                  params(
                    attempt_explanation: String,
                    attempt_reason:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::OrSymbol,
                    attempted_at: Date,
                    merchandise_disposition: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Attempt explanation.
                  attempt_explanation:,
                  # Attempt reason.
                  attempt_reason:,
                  # Attempted at.
                  attempted_at:,
                  # Merchandise disposition.
                  merchandise_disposition:
                )
                end

                sig do
                  override.returns(
                    {
                      attempt_explanation: String,
                      attempt_reason:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol,
                      attempted_at: Date,
                      merchandise_disposition: String
                    }
                  )
                end
                def to_hash
                end

                # Attempt reason.
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING =
                    T.let(
                      :merchant_not_responding,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED =
                    T.let(
                      :no_return_authorization_provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS =
                    T.let(
                      :no_return_instructions,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN =
                    T.let(
                      :requested_not_to_return,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED =
                    T.let(
                      :return_not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Return outcome.
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Returned.
                RETURNED =
                  T.let(
                    :returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
                  )

                # Return attempted.
                RETURN_ATTEMPTED =
                  T.let(
                    :return_attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Returned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Merchant received return at.
                sig { returns(T.nilable(Date)) }
                attr_accessor :merchant_received_return_at

                # Other explanation. Required if and only if the return method is `other`.
                sig { returns(T.nilable(String)) }
                attr_accessor :other_explanation

                # Return method.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  )
                end
                attr_accessor :return_method

                # Returned at.
                sig { returns(Date) }
                attr_accessor :returned_at

                # Tracking number.
                sig { returns(T.nilable(String)) }
                attr_accessor :tracking_number

                # Returned. Present if and only if `return_outcome` is `returned`.
                sig do
                  params(
                    merchant_received_return_at: T.nilable(Date),
                    other_explanation: T.nilable(String),
                    return_method:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::OrSymbol,
                    returned_at: Date,
                    tracking_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Merchant received return at.
                  merchant_received_return_at:,
                  # Other explanation. Required if and only if the return method is `other`.
                  other_explanation:,
                  # Return method.
                  return_method:,
                  # Returned at.
                  returned_at:,
                  # Tracking number.
                  tracking_number:
                )
                end

                sig do
                  override.returns(
                    {
                      merchant_received_return_at: T.nilable(Date),
                      other_explanation: T.nilable(String),
                      return_method:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol,
                      returned_at: Date,
                      tracking_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Return method.
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # DHL.
                  DHL =
                    T.let(
                      :dhl,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Face-to-face.
                  FACE_TO_FACE =
                    T.let(
                      :face_to_face,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                    )

                  # FedEx.
                  FEDEX =
                    T.let(
                      :fedex,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Other.
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Postal service.
                  POSTAL_SERVICE =
                    T.let(
                      :postal_service,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                    )

                  # UPS.
                  UPS =
                    T.let(
                      :ups,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class ConsumerMerchandiseNotReceived < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived,
                    Increase::Internal::AnyHash
                  )
                end

              # Cancellation outcome.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                )
              end
              attr_accessor :cancellation_outcome

              # Cardholder cancellation prior to expected receipt. Present if and only if
              # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt
                  )
                )
              end
              attr_reader :cardholder_cancellation_prior_to_expected_receipt

              sig do
                params(
                  cardholder_cancellation_prior_to_expected_receipt:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
                    )
                ).void
              end
              attr_writer :cardholder_cancellation_prior_to_expected_receipt

              # Delayed. Present if and only if `delivery_issue` is `delayed`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed
                  )
                )
              end
              attr_reader :delayed

              sig do
                params(
                  delayed:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::OrHash
                    )
                ).void
              end
              attr_writer :delayed

              # Delivered to wrong location. Present if and only if `delivery_issue` is
              # `delivered_to_wrong_location`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation
                  )
                )
              end
              attr_reader :delivered_to_wrong_location

              sig do
                params(
                  delivered_to_wrong_location:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation::OrHash
                    )
                ).void
              end
              attr_writer :delivered_to_wrong_location

              # Delivery issue.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
                )
              end
              attr_accessor :delivery_issue

              # Last expected receipt at.
              sig { returns(Date) }
              attr_accessor :last_expected_receipt_at

              # Merchant cancellation. Present if and only if `cancellation_outcome` is
              # `merchant_cancellation`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation
                  )
                )
              end
              attr_reader :merchant_cancellation

              sig do
                params(
                  merchant_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation::OrHash
                    )
                ).void
              end
              attr_writer :merchant_cancellation

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # No cancellation. Present if and only if `cancellation_outcome` is
              # `no_cancellation`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation
                  )
                )
              end
              attr_reader :no_cancellation

              sig do
                params(
                  no_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation::OrHash
                    )
                ).void
              end
              attr_writer :no_cancellation

              # Purchase information and explanation.
              sig { returns(String) }
              attr_accessor :purchase_info_and_explanation

              # Merchandise not received. Present if and only if `category` is
              # `consumer_merchandise_not_received`.
              sig do
                params(
                  cancellation_outcome:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::OrSymbol,
                  cardholder_cancellation_prior_to_expected_receipt:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
                    ),
                  delayed:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::OrHash
                    ),
                  delivered_to_wrong_location:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation::OrHash
                    ),
                  delivery_issue:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::OrSymbol,
                  last_expected_receipt_at: Date,
                  merchant_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation::OrHash
                    ),
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::OrSymbol,
                  no_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation::OrHash
                    ),
                  purchase_info_and_explanation: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Cancellation outcome.
                cancellation_outcome:,
                # Cardholder cancellation prior to expected receipt. Present if and only if
                # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
                cardholder_cancellation_prior_to_expected_receipt:,
                # Delayed. Present if and only if `delivery_issue` is `delayed`.
                delayed:,
                # Delivered to wrong location. Present if and only if `delivery_issue` is
                # `delivered_to_wrong_location`.
                delivered_to_wrong_location:,
                # Delivery issue.
                delivery_issue:,
                # Last expected receipt at.
                last_expected_receipt_at:,
                # Merchant cancellation. Present if and only if `cancellation_outcome` is
                # `merchant_cancellation`.
                merchant_cancellation:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # No cancellation. Present if and only if `cancellation_outcome` is
                # `no_cancellation`.
                no_cancellation:,
                # Purchase information and explanation.
                purchase_info_and_explanation:
              )
              end

              sig do
                override.returns(
                  {
                    cancellation_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol,
                    cardholder_cancellation_prior_to_expected_receipt:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt
                      ),
                    delayed:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed
                      ),
                    delivered_to_wrong_location:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation
                      ),
                    delivery_issue:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol,
                    last_expected_receipt_at: Date,
                    merchant_cancellation:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation
                      ),
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol,
                    no_cancellation:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation
                      ),
                    purchase_info_and_explanation: String
                  }
                )
              end
              def to_hash
              end

              # Cancellation outcome.
              module CancellationOutcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Cardholder cancellation prior to expected receipt.
                CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT =
                  T.let(
                    :cardholder_cancellation_prior_to_expected_receipt,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                  )

                # Merchant cancellation.
                MERCHANT_CANCELLATION =
                  T.let(
                    :merchant_cancellation,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                  )

                # No cancellation.
                NO_CANCELLATION =
                  T.let(
                    :no_cancellation,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt,
                      Increase::Internal::AnyHash
                    )
                  end

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Reason.
                sig { returns(T.nilable(String)) }
                attr_accessor :reason

                # Cardholder cancellation prior to expected receipt. Present if and only if
                # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
                sig do
                  params(canceled_at: Date, reason: T.nilable(String)).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Canceled at.
                  canceled_at:,
                  # Reason.
                  reason:
                )
                end

                sig do
                  override.returns(
                    { canceled_at: Date, reason: T.nilable(String) }
                  )
                end
                def to_hash
                end
              end

              class Delayed < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed,
                      Increase::Internal::AnyHash
                    )
                  end

                # Explanation.
                sig { returns(String) }
                attr_accessor :explanation

                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                sig do
                  returns(
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned
                    )
                  )
                end
                attr_reader :not_returned

                sig do
                  params(
                    not_returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned::OrHash
                      )
                  ).void
                end
                attr_writer :not_returned

                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                sig do
                  returns(
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted
                    )
                  )
                end
                attr_reader :return_attempted

                sig do
                  params(
                    return_attempted:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted::OrHash
                      )
                  ).void
                end
                attr_writer :return_attempted

                # Return outcome.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                  )
                end
                attr_accessor :return_outcome

                # Returned. Present if and only if `return_outcome` is `returned`.
                sig do
                  returns(
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned
                    )
                  )
                end
                attr_reader :returned

                sig do
                  params(
                    returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned::OrHash
                      )
                  ).void
                end
                attr_writer :returned

                # Delayed. Present if and only if `delivery_issue` is `delayed`.
                sig do
                  params(
                    explanation: String,
                    not_returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned::OrHash
                      ),
                    return_attempted:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted::OrHash
                      ),
                    return_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::OrSymbol,
                    returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned::OrHash
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Explanation.
                  explanation:,
                  # Not returned. Present if and only if `return_outcome` is `not_returned`.
                  not_returned:,
                  # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                  return_attempted:,
                  # Return outcome.
                  return_outcome:,
                  # Returned. Present if and only if `return_outcome` is `returned`.
                  returned:
                )
                end

                sig do
                  override.returns(
                    {
                      explanation: String,
                      not_returned:
                        T.nilable(
                          Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned
                        ),
                      return_attempted:
                        T.nilable(
                          Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted
                        ),
                      return_outcome:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol,
                      returned:
                        T.nilable(
                          Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned
                        )
                    }
                  )
                end
                def to_hash
                end

                class NotReturned < Increase::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned,
                        Increase::Internal::AnyHash
                      )
                    end

                  # Not returned. Present if and only if `return_outcome` is `not_returned`.
                  sig { returns(T.attached_class) }
                  def self.new
                  end

                  sig { override.returns({}) }
                  def to_hash
                  end
                end

                class ReturnAttempted < Increase::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted,
                        Increase::Internal::AnyHash
                      )
                    end

                  # Attempted at.
                  sig { returns(Date) }
                  attr_accessor :attempted_at

                  # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                  sig { params(attempted_at: Date).returns(T.attached_class) }
                  def self.new(
                    # Attempted at.
                    attempted_at:
                  )
                  end

                  sig { override.returns({ attempted_at: Date }) }
                  def to_hash
                  end
                end

                # Return outcome.
                module ReturnOutcome
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Not returned.
                  NOT_RETURNED =
                    T.let(
                      :not_returned,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                    )

                  # Returned.
                  RETURNED =
                    T.let(
                      :returned,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                    )

                  # Return attempted.
                  RETURN_ATTEMPTED =
                    T.let(
                      :return_attempted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Returned < Increase::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned,
                        Increase::Internal::AnyHash
                      )
                    end

                  # Merchant received return at.
                  sig { returns(Date) }
                  attr_accessor :merchant_received_return_at

                  # Returned at.
                  sig { returns(Date) }
                  attr_accessor :returned_at

                  # Returned. Present if and only if `return_outcome` is `returned`.
                  sig do
                    params(
                      merchant_received_return_at: Date,
                      returned_at: Date
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Merchant received return at.
                    merchant_received_return_at:,
                    # Returned at.
                    returned_at:
                  )
                  end

                  sig do
                    override.returns(
                      { merchant_received_return_at: Date, returned_at: Date }
                    )
                  end
                  def to_hash
                  end
                end
              end

              class DeliveredToWrongLocation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Agreed location.
                sig { returns(String) }
                attr_accessor :agreed_location

                # Delivered to wrong location. Present if and only if `delivery_issue` is
                # `delivered_to_wrong_location`.
                sig do
                  params(agreed_location: String).returns(T.attached_class)
                end
                def self.new(
                  # Agreed location.
                  agreed_location:
                )
                end

                sig { override.returns({ agreed_location: String }) }
                def to_hash
                end
              end

              # Delivery issue.
              module DeliveryIssue
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Delayed.
                DELAYED =
                  T.let(
                    :delayed,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
                  )

                # Delivered to wrong location.
                DELIVERED_TO_WRONG_LOCATION =
                  T.let(
                    :delivered_to_wrong_location,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class MerchantCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Merchant cancellation. Present if and only if `cancellation_outcome` is
                # `merchant_cancellation`.
                sig { params(canceled_at: Date).returns(T.attached_class) }
                def self.new(
                  # Canceled at.
                  canceled_at:
                )
                end

                sig { override.returns({ canceled_at: Date }) }
                def to_hash
                end
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class NoCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # No cancellation. Present if and only if `cancellation_outcome` is
                # `no_cancellation`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end
            end

            class ConsumerNonReceiptOfCash < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerNonReceiptOfCash,
                    Increase::Internal::AnyHash
                  )
                end

              # Non-receipt of cash. Present if and only if `category` is
              # `consumer_non_receipt_of_cash`.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class ConsumerOriginalCreditTransactionNotAccepted < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation.
              sig { returns(String) }
              attr_accessor :explanation

              # Reason.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                )
              end
              attr_accessor :reason

              # Original Credit Transaction (OCT) not accepted. Present if and only if
              # `category` is `consumer_original_credit_transaction_not_accepted`.
              sig do
                params(
                  explanation: String,
                  reason:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Explanation.
                explanation:,
                # Reason.
                reason:
              )
              end

              sig do
                override.returns(
                  {
                    explanation: String,
                    reason:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # Reason.
              module Reason
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Prohibited by local laws or regulation.
                PROHIBITED_BY_LOCAL_LAWS_OR_REGULATION =
                  T.let(
                    :prohibited_by_local_laws_or_regulation,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                  )

                # Recipient refused.
                RECIPIENT_REFUSED =
                  T.let(
                    :recipient_refused,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class ConsumerQualityMerchandise < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise,
                    Increase::Internal::AnyHash
                  )
                end

              # Expected at.
              sig { returns(Date) }
              attr_accessor :expected_at

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Not returned. Present if and only if `return_outcome` is `not_returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned
                  )
                )
              end
              attr_reader :not_returned

              sig do
                params(
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned::OrHash
                    )
                ).void
              end
              attr_writer :not_returned

              # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations
                  )
                )
              end
              attr_reader :ongoing_negotiations

              sig do
                params(
                  ongoing_negotiations:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations::OrHash
                    )
                ).void
              end
              attr_writer :ongoing_negotiations

              # Purchase information and quality issue.
              sig { returns(String) }
              attr_accessor :purchase_info_and_quality_issue

              # Received at.
              sig { returns(Date) }
              attr_accessor :received_at

              # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted
                  )
                )
              end
              attr_reader :return_attempted

              sig do
                params(
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::OrHash
                    )
                ).void
              end
              attr_writer :return_attempted

              # Return outcome.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                )
              end
              attr_accessor :return_outcome

              # Returned. Present if and only if `return_outcome` is `returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned
                  )
                )
              end
              attr_reader :returned

              sig do
                params(
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::OrHash
                    )
                ).void
              end
              attr_writer :returned

              # Merchandise quality issue. Present if and only if `category` is
              # `consumer_quality_merchandise`.
              sig do
                params(
                  expected_at: Date,
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::OrSymbol,
                  not_returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned::OrHash
                    ),
                  ongoing_negotiations:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations::OrHash
                    ),
                  purchase_info_and_quality_issue: String,
                  received_at: Date,
                  return_attempted:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::OrHash
                    ),
                  return_outcome:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::OrSymbol,
                  returned:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::OrHash
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Expected at.
                expected_at:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                not_returned:,
                # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
                ongoing_negotiations:,
                # Purchase information and quality issue.
                purchase_info_and_quality_issue:,
                # Received at.
                received_at:,
                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                return_attempted:,
                # Return outcome.
                return_outcome:,
                # Returned. Present if and only if `return_outcome` is `returned`.
                returned:
              )
              end

              sig do
                override.returns(
                  {
                    expected_at: Date,
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol,
                    not_returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned
                      ),
                    ongoing_negotiations:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations
                      ),
                    purchase_info_and_quality_issue: String,
                    received_at: Date,
                    return_attempted:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted
                      ),
                    return_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol,
                    returned:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned
                      )
                  }
                )
              end
              def to_hash
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class NotReturned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::NotReturned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Not returned. Present if and only if `return_outcome` is `not_returned`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end

              class OngoingNegotiations < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations,
                      Increase::Internal::AnyHash
                    )
                  end

                # Explanation of the previous ongoing negotiations between the cardholder and
                # merchant.
                sig { returns(String) }
                attr_accessor :explanation

                # Date the cardholder first notified the issuer of the dispute.
                sig { returns(Date) }
                attr_accessor :issuer_first_notified_at

                # Started at.
                sig { returns(Date) }
                attr_accessor :started_at

                # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
                sig do
                  params(
                    explanation: String,
                    issuer_first_notified_at: Date,
                    started_at: Date
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Explanation of the previous ongoing negotiations between the cardholder and
                  # merchant.
                  explanation:,
                  # Date the cardholder first notified the issuer of the dispute.
                  issuer_first_notified_at:,
                  # Started at.
                  started_at:
                )
                end

                sig do
                  override.returns(
                    {
                      explanation: String,
                      issuer_first_notified_at: Date,
                      started_at: Date
                    }
                  )
                end
                def to_hash
                end
              end

              class ReturnAttempted < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted,
                      Increase::Internal::AnyHash
                    )
                  end

                # Attempt explanation.
                sig { returns(String) }
                attr_accessor :attempt_explanation

                # Attempt reason.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )
                end
                attr_accessor :attempt_reason

                # Attempted at.
                sig { returns(Date) }
                attr_accessor :attempted_at

                # Merchandise disposition.
                sig { returns(String) }
                attr_accessor :merchandise_disposition

                # Return attempted. Present if and only if `return_outcome` is `return_attempted`.
                sig do
                  params(
                    attempt_explanation: String,
                    attempt_reason:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                    attempted_at: Date,
                    merchandise_disposition: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Attempt explanation.
                  attempt_explanation:,
                  # Attempt reason.
                  attempt_reason:,
                  # Attempted at.
                  attempted_at:,
                  # Merchandise disposition.
                  merchandise_disposition:
                )
                end

                sig do
                  override.returns(
                    {
                      attempt_explanation: String,
                      attempt_reason:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol,
                      attempted_at: Date,
                      merchandise_disposition: String
                    }
                  )
                end
                def to_hash
                end

                # Attempt reason.
                module AttemptReason
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Merchant not responding.
                  MERCHANT_NOT_RESPONDING =
                    T.let(
                      :merchant_not_responding,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return authorization provided.
                  NO_RETURN_AUTHORIZATION_PROVIDED =
                    T.let(
                      :no_return_authorization_provided,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # No return instructions.
                  NO_RETURN_INSTRUCTIONS =
                    T.let(
                      :no_return_instructions,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Requested not to return.
                  REQUESTED_NOT_TO_RETURN =
                    T.let(
                      :requested_not_to_return,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  # Return not accepted.
                  RETURN_NOT_ACCEPTED =
                    T.let(
                      :return_not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Return outcome.
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not returned.
                NOT_RETURNED =
                  T.let(
                    :not_returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                  )

                # Returned.
                RETURNED =
                  T.let(
                    :returned,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                  )

                # Return attempted.
                RETURN_ATTEMPTED =
                  T.let(
                    :return_attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Returned < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned,
                      Increase::Internal::AnyHash
                    )
                  end

                # Merchant received return at.
                sig { returns(T.nilable(Date)) }
                attr_accessor :merchant_received_return_at

                # Other explanation. Required if and only if the return method is `other`.
                sig { returns(T.nilable(String)) }
                attr_accessor :other_explanation

                # Return method.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )
                end
                attr_accessor :return_method

                # Returned at.
                sig { returns(Date) }
                attr_accessor :returned_at

                # Tracking number.
                sig { returns(T.nilable(String)) }
                attr_accessor :tracking_number

                # Returned. Present if and only if `return_outcome` is `returned`.
                sig do
                  params(
                    merchant_received_return_at: T.nilable(Date),
                    other_explanation: T.nilable(String),
                    return_method:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::OrSymbol,
                    returned_at: Date,
                    tracking_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Merchant received return at.
                  merchant_received_return_at:,
                  # Other explanation. Required if and only if the return method is `other`.
                  other_explanation:,
                  # Return method.
                  return_method:,
                  # Returned at.
                  returned_at:,
                  # Tracking number.
                  tracking_number:
                )
                end

                sig do
                  override.returns(
                    {
                      merchant_received_return_at: T.nilable(Date),
                      other_explanation: T.nilable(String),
                      return_method:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol,
                      returned_at: Date,
                      tracking_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Return method.
                module ReturnMethod
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # DHL.
                  DHL =
                    T.let(
                      :dhl,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Face-to-face.
                  FACE_TO_FACE =
                    T.let(
                      :face_to_face,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # FedEx.
                  FEDEX =
                    T.let(
                      :fedex,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Other.
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # Postal service.
                  POSTAL_SERVICE =
                    T.let(
                      :postal_service,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  # UPS.
                  UPS =
                    T.let(
                      :ups,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class ConsumerQualityServices < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices,
                    Increase::Internal::AnyHash
                  )
                end

              # Cardholder cancellation.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation
                )
              end
              attr_reader :cardholder_cancellation

              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::OrHash
                ).void
              end
              attr_writer :cardholder_cancellation

              # Cardholder paid to have work redone.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                  )
                )
              end
              attr_accessor :cardholder_paid_to_have_work_redone

              # Non-fiat currency or non-fungible token related and not matching description.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
                )
              end
              attr_accessor :non_fiat_currency_or_non_fungible_token_related_and_not_matching_description

              # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations
                  )
                )
              end
              attr_reader :ongoing_negotiations

              sig do
                params(
                  ongoing_negotiations:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations::OrHash
                    )
                ).void
              end
              attr_writer :ongoing_negotiations

              # Purchase information and quality issue.
              sig { returns(String) }
              attr_accessor :purchase_info_and_quality_issue

              # Whether the dispute is related to the quality of food from an eating place or
              # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
              # or 5814.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                  )
                )
              end
              attr_accessor :restaurant_food_related

              # Services received at.
              sig { returns(Date) }
              attr_accessor :services_received_at

              # Services quality issue. Present if and only if `category` is
              # `consumer_quality_services`.
              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::OrHash,
                  cardholder_paid_to_have_work_redone:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol
                    ),
                  non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::OrSymbol,
                  ongoing_negotiations:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations::OrHash
                    ),
                  purchase_info_and_quality_issue: String,
                  restaurant_food_related:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
                    ),
                  services_received_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # Cardholder cancellation.
                cardholder_cancellation:,
                # Cardholder paid to have work redone.
                cardholder_paid_to_have_work_redone:,
                # Non-fiat currency or non-fungible token related and not matching description.
                non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:,
                # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
                ongoing_negotiations:,
                # Purchase information and quality issue.
                purchase_info_and_quality_issue:,
                # Whether the dispute is related to the quality of food from an eating place or
                # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
                # or 5814.
                restaurant_food_related:,
                # Services received at.
                services_received_at:
              )
              end

              sig do
                override.returns(
                  {
                    cardholder_cancellation:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation,
                    cardholder_paid_to_have_work_redone:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                      ),
                    non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol,
                    ongoing_negotiations:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations
                      ),
                    purchase_info_and_quality_issue: String,
                    restaurant_food_related:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                      ),
                    services_received_at: Date
                  }
                )
              end
              def to_hash
              end

              class CardholderCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Accepted by merchant.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )
                end
                attr_accessor :accepted_by_merchant

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Reason.
                sig { returns(String) }
                attr_accessor :reason

                # Cardholder cancellation.
                sig do
                  params(
                    accepted_by_merchant:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                    canceled_at: Date,
                    reason: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Accepted by merchant.
                  accepted_by_merchant:,
                  # Canceled at.
                  canceled_at:,
                  # Reason.
                  reason:
                )
                end

                sig do
                  override.returns(
                    {
                      accepted_by_merchant:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol,
                      canceled_at: Date,
                      reason: String
                    }
                  )
                end
                def to_hash
                end

                # Accepted by merchant.
                module AcceptedByMerchant
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Accepted.
                  ACCEPTED =
                    T.let(
                      :accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                    )

                  # Not accepted.
                  NOT_ACCEPTED =
                    T.let(
                      :not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Cardholder paid to have work redone.
              module CardholderPaidToHaveWorkRedone
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Cardholder did not pay to have work redone.
                DID_NOT_PAY_TO_HAVE_WORK_REDONE =
                  T.let(
                    :did_not_pay_to_have_work_redone,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                  )

                # Cardholder paid to have work redone.
                PAID_TO_HAVE_WORK_REDONE =
                  T.let(
                    :paid_to_have_work_redone,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Non-fiat currency or non-fungible token related and not matching description.
              module NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not related.
                NOT_RELATED =
                  T.let(
                    :not_related,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
                  )

                # Related.
                RELATED =
                  T.let(
                    :related,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class OngoingNegotiations < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::OngoingNegotiations,
                      Increase::Internal::AnyHash
                    )
                  end

                # Explanation of the previous ongoing negotiations between the cardholder and
                # merchant.
                sig { returns(String) }
                attr_accessor :explanation

                # Date the cardholder first notified the issuer of the dispute.
                sig { returns(Date) }
                attr_accessor :issuer_first_notified_at

                # Started at.
                sig { returns(Date) }
                attr_accessor :started_at

                # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
                sig do
                  params(
                    explanation: String,
                    issuer_first_notified_at: Date,
                    started_at: Date
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Explanation of the previous ongoing negotiations between the cardholder and
                  # merchant.
                  explanation:,
                  # Date the cardholder first notified the issuer of the dispute.
                  issuer_first_notified_at:,
                  # Started at.
                  started_at:
                )
                end

                sig do
                  override.returns(
                    {
                      explanation: String,
                      issuer_first_notified_at: Date,
                      started_at: Date
                    }
                  )
                end
                def to_hash
                end
              end

              # Whether the dispute is related to the quality of food from an eating place or
              # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
              # or 5814.
              module RestaurantFoodRelated
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not related.
                NOT_RELATED =
                  T.let(
                    :not_related,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                  )

                # Related.
                RELATED =
                  T.let(
                    :related,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class ConsumerServicesMisrepresentation < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation,
                    Increase::Internal::AnyHash
                  )
                end

              # Cardholder cancellation.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation
                )
              end
              attr_reader :cardholder_cancellation

              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::OrHash
                ).void
              end
              attr_writer :cardholder_cancellation

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Misrepresentation explanation.
              sig { returns(String) }
              attr_accessor :misrepresentation_explanation

              # Purchase explanation.
              sig { returns(String) }
              attr_accessor :purchase_explanation

              # Received at.
              sig { returns(Date) }
              attr_accessor :received_at

              # Services misrepresentation. Present if and only if `category` is
              # `consumer_services_misrepresentation`.
              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::OrHash,
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::OrSymbol,
                  misrepresentation_explanation: String,
                  purchase_explanation: String,
                  received_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # Cardholder cancellation.
                cardholder_cancellation:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Misrepresentation explanation.
                misrepresentation_explanation:,
                # Purchase explanation.
                purchase_explanation:,
                # Received at.
                received_at:
              )
              end

              sig do
                override.returns(
                  {
                    cardholder_cancellation:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation,
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol,
                    misrepresentation_explanation: String,
                    purchase_explanation: String,
                    received_at: Date
                  }
                )
              end
              def to_hash
              end

              class CardholderCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Accepted by merchant.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )
                end
                attr_accessor :accepted_by_merchant

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Reason.
                sig { returns(String) }
                attr_accessor :reason

                # Cardholder cancellation.
                sig do
                  params(
                    accepted_by_merchant:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                    canceled_at: Date,
                    reason: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Accepted by merchant.
                  accepted_by_merchant:,
                  # Canceled at.
                  canceled_at:,
                  # Reason.
                  reason:
                )
                end

                sig do
                  override.returns(
                    {
                      accepted_by_merchant:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol,
                      canceled_at: Date,
                      reason: String
                    }
                  )
                end
                def to_hash
                end

                # Accepted by merchant.
                module AcceptedByMerchant
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Accepted.
                  ACCEPTED =
                    T.let(
                      :accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                    )

                  # Not accepted.
                  NOT_ACCEPTED =
                    T.let(
                      :not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class ConsumerServicesNotAsDescribed < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed,
                    Increase::Internal::AnyHash
                  )
                end

              # Cardholder cancellation.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation
                )
              end
              attr_reader :cardholder_cancellation

              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::OrHash
                ).void
              end
              attr_writer :cardholder_cancellation

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Received at.
              sig { returns(Date) }
              attr_accessor :received_at

              # Services not as described. Present if and only if `category` is
              # `consumer_services_not_as_described`.
              sig do
                params(
                  cardholder_cancellation:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::OrHash,
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
                  received_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # Cardholder cancellation.
                cardholder_cancellation:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Received at.
                received_at:
              )
              end

              sig do
                override.returns(
                  {
                    cardholder_cancellation:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation,
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol,
                    received_at: Date
                  }
                )
              end
              def to_hash
              end

              class CardholderCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Accepted by merchant.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )
                end
                attr_accessor :accepted_by_merchant

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Reason.
                sig { returns(String) }
                attr_accessor :reason

                # Cardholder cancellation.
                sig do
                  params(
                    accepted_by_merchant:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                    canceled_at: Date,
                    reason: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Accepted by merchant.
                  accepted_by_merchant:,
                  # Canceled at.
                  canceled_at:,
                  # Reason.
                  reason:
                )
                end

                sig do
                  override.returns(
                    {
                      accepted_by_merchant:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol,
                      canceled_at: Date,
                      reason: String
                    }
                  )
                end
                def to_hash
                end

                # Accepted by merchant.
                module AcceptedByMerchant
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Accepted.
                  ACCEPTED =
                    T.let(
                      :accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                    )

                  # Not accepted.
                  NOT_ACCEPTED =
                    T.let(
                      :not_accepted,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class ConsumerServicesNotReceived < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived,
                    Increase::Internal::AnyHash
                  )
                end

              # Cancellation outcome.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                )
              end
              attr_accessor :cancellation_outcome

              # Cardholder cancellation prior to expected receipt. Present if and only if
              # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt
                  )
                )
              end
              attr_reader :cardholder_cancellation_prior_to_expected_receipt

              sig do
                params(
                  cardholder_cancellation_prior_to_expected_receipt:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
                    )
                ).void
              end
              attr_writer :cardholder_cancellation_prior_to_expected_receipt

              # Last expected receipt at.
              sig { returns(Date) }
              attr_accessor :last_expected_receipt_at

              # Merchant cancellation. Present if and only if `cancellation_outcome` is
              # `merchant_cancellation`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation
                  )
                )
              end
              attr_reader :merchant_cancellation

              sig do
                params(
                  merchant_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation::OrHash
                    )
                ).void
              end
              attr_writer :merchant_cancellation

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # No cancellation. Present if and only if `cancellation_outcome` is
              # `no_cancellation`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation
                  )
                )
              end
              attr_reader :no_cancellation

              sig do
                params(
                  no_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation::OrHash
                    )
                ).void
              end
              attr_writer :no_cancellation

              # Purchase information and explanation.
              sig { returns(String) }
              attr_accessor :purchase_info_and_explanation

              # Services not received. Present if and only if `category` is
              # `consumer_services_not_received`.
              sig do
                params(
                  cancellation_outcome:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::OrSymbol,
                  cardholder_cancellation_prior_to_expected_receipt:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
                    ),
                  last_expected_receipt_at: Date,
                  merchant_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation::OrHash
                    ),
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::OrSymbol,
                  no_cancellation:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation::OrHash
                    ),
                  purchase_info_and_explanation: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Cancellation outcome.
                cancellation_outcome:,
                # Cardholder cancellation prior to expected receipt. Present if and only if
                # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
                cardholder_cancellation_prior_to_expected_receipt:,
                # Last expected receipt at.
                last_expected_receipt_at:,
                # Merchant cancellation. Present if and only if `cancellation_outcome` is
                # `merchant_cancellation`.
                merchant_cancellation:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # No cancellation. Present if and only if `cancellation_outcome` is
                # `no_cancellation`.
                no_cancellation:,
                # Purchase information and explanation.
                purchase_info_and_explanation:
              )
              end

              sig do
                override.returns(
                  {
                    cancellation_outcome:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol,
                    cardholder_cancellation_prior_to_expected_receipt:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt
                      ),
                    last_expected_receipt_at: Date,
                    merchant_cancellation:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation
                      ),
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol,
                    no_cancellation:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation
                      ),
                    purchase_info_and_explanation: String
                  }
                )
              end
              def to_hash
              end

              # Cancellation outcome.
              module CancellationOutcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Cardholder cancellation prior to expected receipt.
                CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT =
                  T.let(
                    :cardholder_cancellation_prior_to_expected_receipt,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                  )

                # Merchant cancellation.
                MERCHANT_CANCELLATION =
                  T.let(
                    :merchant_cancellation,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                  )

                # No cancellation.
                NO_CANCELLATION =
                  T.let(
                    :no_cancellation,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt,
                      Increase::Internal::AnyHash
                    )
                  end

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Reason.
                sig { returns(T.nilable(String)) }
                attr_accessor :reason

                # Cardholder cancellation prior to expected receipt. Present if and only if
                # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
                sig do
                  params(canceled_at: Date, reason: T.nilable(String)).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Canceled at.
                  canceled_at:,
                  # Reason.
                  reason:
                )
                end

                sig do
                  override.returns(
                    { canceled_at: Date, reason: T.nilable(String) }
                  )
                end
                def to_hash
                end
              end

              class MerchantCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # Canceled at.
                sig { returns(Date) }
                attr_accessor :canceled_at

                # Merchant cancellation. Present if and only if `cancellation_outcome` is
                # `merchant_cancellation`.
                sig { params(canceled_at: Date).returns(T.attached_class) }
                def self.new(
                  # Canceled at.
                  canceled_at:
                )
                end

                sig { override.returns({ canceled_at: Date }) }
                def to_hash
                end
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class NoCancellation < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ConsumerServicesNotReceived::NoCancellation,
                      Increase::Internal::AnyHash
                    )
                  end

                # No cancellation. Present if and only if `cancellation_outcome` is
                # `no_cancellation`.
                sig { returns(T.attached_class) }
                def self.new
                end

                sig { override.returns({}) }
                def to_hash
                end
              end
            end

            class Fraud < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud,
                    Increase::Internal::AnyHash
                  )
                end

              # Fraud type.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                )
              end
              attr_accessor :fraud_type

              # Fraud. Present if and only if `category` is `fraud`.
              sig do
                params(
                  fraud_type:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Fraud type.
                fraud_type:
              )
              end

              sig do
                override.returns(
                  {
                    fraud_type:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # Fraud type.
              module FraudType
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Account or credentials takeover.
                ACCOUNT_OR_CREDENTIALS_TAKEOVER =
                  T.let(
                    :account_or_credentials_takeover,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Card not received as issued.
                CARD_NOT_RECEIVED_AS_ISSUED =
                  T.let(
                    :card_not_received_as_issued,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Fraudulent application.
                FRAUDULENT_APPLICATION =
                  T.let(
                    :fraudulent_application,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Fraudulent use of account number.
                FRAUDULENT_USE_OF_ACCOUNT_NUMBER =
                  T.let(
                    :fraudulent_use_of_account_number,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Incorrect processing.
                INCORRECT_PROCESSING =
                  T.let(
                    :incorrect_processing,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Issuer reported counterfeit.
                ISSUER_REPORTED_COUNTERFEIT =
                  T.let(
                    :issuer_reported_counterfeit,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Lost.
                LOST =
                  T.let(
                    :lost,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Manipulation of account holder.
                MANIPULATION_OF_ACCOUNT_HOLDER =
                  T.let(
                    :manipulation_of_account_holder,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Merchant misrepresentation.
                MERCHANT_MISREPRESENTATION =
                  T.let(
                    :merchant_misrepresentation,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Miscellaneous.
                MISCELLANEOUS =
                  T.let(
                    :miscellaneous,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                # Stolen.
                STOLEN =
                  T.let(
                    :stolen,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::Fraud::FraudType::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class ProcessingError < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError,
                    Increase::Internal::AnyHash
                  )
                end

              # Duplicate transaction. Present if and only if `error_reason` is
              # `duplicate_transaction`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction
                  )
                )
              end
              attr_reader :duplicate_transaction

              sig do
                params(
                  duplicate_transaction:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction::OrHash
                    )
                ).void
              end
              attr_writer :duplicate_transaction

              # Error reason.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                )
              end
              attr_accessor :error_reason

              # Incorrect amount. Present if and only if `error_reason` is `incorrect_amount`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount
                  )
                )
              end
              attr_reader :incorrect_amount

              sig do
                params(
                  incorrect_amount:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount::OrHash
                    )
                ).void
              end
              attr_writer :incorrect_amount

              # Merchant resolution attempted.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
                )
              end
              attr_accessor :merchant_resolution_attempted

              # Paid by other means. Present if and only if `error_reason` is
              # `paid_by_other_means`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans
                  )
                )
              end
              attr_reader :paid_by_other_means

              sig do
                params(
                  paid_by_other_means:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OrHash
                    )
                ).void
              end
              attr_writer :paid_by_other_means

              # Processing error. Present if and only if `category` is `processing_error`.
              sig do
                params(
                  duplicate_transaction:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction::OrHash
                    ),
                  error_reason:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason::OrSymbol,
                  incorrect_amount:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount::OrHash
                    ),
                  merchant_resolution_attempted:
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted::OrSymbol,
                  paid_by_other_means:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OrHash
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Duplicate transaction. Present if and only if `error_reason` is
                # `duplicate_transaction`.
                duplicate_transaction:,
                # Error reason.
                error_reason:,
                # Incorrect amount. Present if and only if `error_reason` is `incorrect_amount`.
                incorrect_amount:,
                # Merchant resolution attempted.
                merchant_resolution_attempted:,
                # Paid by other means. Present if and only if `error_reason` is
                # `paid_by_other_means`.
                paid_by_other_means:
              )
              end

              sig do
                override.returns(
                  {
                    duplicate_transaction:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction
                      ),
                    error_reason:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason::TaggedSymbol,
                    incorrect_amount:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount
                      ),
                    merchant_resolution_attempted:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol,
                    paid_by_other_means:
                      T.nilable(
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans
                      )
                  }
                )
              end
              def to_hash
              end

              class DuplicateTransaction < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::DuplicateTransaction,
                      Increase::Internal::AnyHash
                    )
                  end

                # Other transaction ID.
                sig { returns(String) }
                attr_accessor :other_transaction_id

                # Duplicate transaction. Present if and only if `error_reason` is
                # `duplicate_transaction`.
                sig do
                  params(other_transaction_id: String).returns(T.attached_class)
                end
                def self.new(
                  # Other transaction ID.
                  other_transaction_id:
                )
                end

                sig { override.returns({ other_transaction_id: String }) }
                def to_hash
                end
              end

              # Error reason.
              module ErrorReason
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Duplicate transaction.
                DUPLICATE_TRANSACTION =
                  T.let(
                    :duplicate_transaction,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                  )

                # Incorrect amount.
                INCORRECT_AMOUNT =
                  T.let(
                    :incorrect_amount,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                  )

                # Paid by other means.
                PAID_BY_OTHER_MEANS =
                  T.let(
                    :paid_by_other_means,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class IncorrectAmount < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::IncorrectAmount,
                      Increase::Internal::AnyHash
                    )
                  end

                # Expected amount.
                sig { returns(Integer) }
                attr_accessor :expected_amount

                # Incorrect amount. Present if and only if `error_reason` is `incorrect_amount`.
                sig do
                  params(expected_amount: Integer).returns(T.attached_class)
                end
                def self.new(
                  # Expected amount.
                  expected_amount:
                )
                end

                sig { override.returns({ expected_amount: Integer }) }
                def to_hash
                end
              end

              # Merchant resolution attempted.
              module MerchantResolutionAttempted
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Attempted.
                ATTEMPTED =
                  T.let(
                    :attempted,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
                  )

                # Prohibited by local law.
                PROHIBITED_BY_LOCAL_LAW =
                  T.let(
                    :prohibited_by_local_law,
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class PaidByOtherMeans < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans,
                      Increase::Internal::AnyHash
                    )
                  end

                # Other form of payment evidence.
                sig do
                  returns(
                    Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  )
                end
                attr_accessor :other_form_of_payment_evidence

                # Other transaction ID.
                sig { returns(T.nilable(String)) }
                attr_accessor :other_transaction_id

                # Paid by other means. Present if and only if `error_reason` is
                # `paid_by_other_means`.
                sig do
                  params(
                    other_form_of_payment_evidence:
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::OrSymbol,
                    other_transaction_id: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Other form of payment evidence.
                  other_form_of_payment_evidence:,
                  # Other transaction ID.
                  other_transaction_id:
                )
                end

                sig do
                  override.returns(
                    {
                      other_form_of_payment_evidence:
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol,
                      other_transaction_id: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Other form of payment evidence.
                module OtherFormOfPaymentEvidence
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # Canceled check.
                  CANCELED_CHECK =
                    T.let(
                      :canceled_check,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                    )

                  # Card transaction.
                  CARD_TRANSACTION =
                    T.let(
                      :card_transaction,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                    )

                  # Cash receipt.
                  CASH_RECEIPT =
                    T.let(
                      :cash_receipt,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                    )

                  # Other.
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                    )

                  # Statement.
                  STATEMENT =
                    T.let(
                      :statement,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                    )

                  # Voucher.
                  VOUCHER =
                    T.let(
                      :voucher,
                      Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardDispute::Visa::UserSubmission::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end
          end

          class MerchantPrearbitrationDecline < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::UserSubmission::MerchantPrearbitrationDecline,
                  Increase::Internal::AnyHash
                )
              end

            # The reason the user declined the merchant's request for pre-arbitration in their
            # favor.
            sig { returns(String) }
            attr_accessor :reason

            # A Visa Card Dispute Merchant Pre-Arbitration Decline User Submission object.
            # This field will be present in the JSON response if and only if `category` is
            # equal to `merchant_prearbitration_decline`. Contains the details specific to a
            # merchant prearbitration decline Visa Card Dispute User Submission.
            sig { params(reason: String).returns(T.attached_class) }
            def self.new(
              # The reason the user declined the merchant's request for pre-arbitration in their
              # favor.
              reason:
            )
            end

            sig { override.returns({ reason: String }) }
            def to_hash
            end
          end

          # The status of the Visa Card Dispute User Submission.
          module Status
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDispute::Visa::UserSubmission::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The User Submission was abandoned.
            ABANDONED =
              T.let(
                :abandoned,
                Increase::CardDispute::Visa::UserSubmission::Status::TaggedSymbol
              )

            # The User Submission was accepted.
            ACCEPTED =
              T.let(
                :accepted,
                Increase::CardDispute::Visa::UserSubmission::Status::TaggedSymbol
              )

            # Further information is requested, please resubmit with the requested information.
            FURTHER_INFORMATION_REQUESTED =
              T.let(
                :further_information_requested,
                Increase::CardDispute::Visa::UserSubmission::Status::TaggedSymbol
              )

            # The User Submission is pending review.
            PENDING_REVIEWING =
              T.let(
                :pending_reviewing,
                Increase::CardDispute::Visa::UserSubmission::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDispute::Visa::UserSubmission::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class UserPrearbitration < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDispute::Visa::UserSubmission::UserPrearbitration,
                  Increase::Internal::AnyHash
                )
              end

            # Category change details for the pre-arbitration request, if requested.
            sig do
              returns(
                T.nilable(
                  Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange
                )
              )
            end
            attr_reader :category_change

            sig do
              params(
                category_change:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::OrHash
                  )
              ).void
            end
            attr_writer :category_change

            # The reason for the pre-arbitration request.
            sig { returns(String) }
            attr_accessor :reason

            # A Visa Card Dispute User-Initiated Pre-Arbitration User Submission object. This
            # field will be present in the JSON response if and only if `category` is equal to
            # `user_prearbitration`. Contains the details specific to a user-initiated
            # pre-arbitration Visa Card Dispute User Submission.
            sig do
              params(
                category_change:
                  T.nilable(
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::OrHash
                  ),
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Category change details for the pre-arbitration request, if requested.
              category_change:,
              # The reason for the pre-arbitration request.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  category_change:
                    T.nilable(
                      Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange
                    ),
                  reason: String
                }
              )
            end
            def to_hash
            end

            class CategoryChange < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange,
                    Increase::Internal::AnyHash
                  )
                end

              # The category the dispute is being changed to.
              sig do
                returns(
                  Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )
              end
              attr_accessor :category

              # The reason for the pre-arbitration request.
              sig { returns(String) }
              attr_accessor :reason

              # Category change details for the pre-arbitration request, if requested.
              sig do
                params(
                  category:
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::OrSymbol,
                  reason: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The category the dispute is being changed to.
                category:,
                # The reason for the pre-arbitration request.
                reason:
              )
              end

              sig do
                override.returns(
                  {
                    category:
                      Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol,
                    reason: String
                  }
                )
              end
              def to_hash
              end

              # The category the dispute is being changed to.
              module Category
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Authorization.
                AUTHORIZATION =
                  T.let(
                    :authorization,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: canceled merchandise.
                CONSUMER_CANCELED_MERCHANDISE =
                  T.let(
                    :consumer_canceled_merchandise,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: canceled recurring transaction.
                CONSUMER_CANCELED_RECURRING_TRANSACTION =
                  T.let(
                    :consumer_canceled_recurring_transaction,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: canceled services.
                CONSUMER_CANCELED_SERVICES =
                  T.let(
                    :consumer_canceled_services,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: counterfeit merchandise.
                CONSUMER_COUNTERFEIT_MERCHANDISE =
                  T.let(
                    :consumer_counterfeit_merchandise,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: credit not processed.
                CONSUMER_CREDIT_NOT_PROCESSED =
                  T.let(
                    :consumer_credit_not_processed,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: damaged or defective merchandise.
                CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE =
                  T.let(
                    :consumer_damaged_or_defective_merchandise,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: merchandise misrepresentation.
                CONSUMER_MERCHANDISE_MISREPRESENTATION =
                  T.let(
                    :consumer_merchandise_misrepresentation,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: merchandise not as described.
                CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED =
                  T.let(
                    :consumer_merchandise_not_as_described,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: merchandise not received.
                CONSUMER_MERCHANDISE_NOT_RECEIVED =
                  T.let(
                    :consumer_merchandise_not_received,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: non-receipt of cash.
                CONSUMER_NON_RECEIPT_OF_CASH =
                  T.let(
                    :consumer_non_receipt_of_cash,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: Original Credit Transaction (OCT) not accepted.
                CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED =
                  T.let(
                    :consumer_original_credit_transaction_not_accepted,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: merchandise quality issue.
                CONSUMER_QUALITY_MERCHANDISE =
                  T.let(
                    :consumer_quality_merchandise,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: services quality issue.
                CONSUMER_QUALITY_SERVICES =
                  T.let(
                    :consumer_quality_services,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: services misrepresentation.
                CONSUMER_SERVICES_MISREPRESENTATION =
                  T.let(
                    :consumer_services_misrepresentation,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: services not as described.
                CONSUMER_SERVICES_NOT_AS_DESCRIBED =
                  T.let(
                    :consumer_services_not_as_described,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Consumer: services not received.
                CONSUMER_SERVICES_NOT_RECEIVED =
                  T.let(
                    :consumer_services_not_received,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Fraud.
                FRAUD =
                  T.let(
                    :fraud,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                # Processing error.
                PROCESSING_ERROR =
                  T.let(
                    :processing_error,
                    Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDispute::Visa::UserSubmission::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end
      end

      class Win < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::CardDispute::Win, Increase::Internal::AnyHash)
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Card Dispute was won.
        sig { returns(Time) }
        attr_accessor :won_at

        # If the Card Dispute's status is `won`, this will contain details of the won
        # dispute.
        sig { params(won_at: Time).returns(T.attached_class) }
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Card Dispute was won.
          won_at:
        )
        end

        sig { override.returns({ won_at: Time }) }
        def to_hash
        end
      end
    end
  end
end
