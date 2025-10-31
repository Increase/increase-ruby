# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardDisputes#action
      class CardDisputeActionParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute network
        #   The network of the Card Dispute. Details specific to the network are required
        #   under the sub-object with the same identifier as the network.
        #
        #   @return [Symbol, Increase::Models::Simulations::CardDisputeActionParams::Network]
        required :network, enum: -> { Increase::Simulations::CardDisputeActionParams::Network }

        # @!attribute visa
        #   The Visa-specific parameters for the taking action on the dispute. Required if
        #   and only if `network` is `visa`.
        #
        #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa, nil]
        optional :visa, -> { Increase::Simulations::CardDisputeActionParams::Visa }

        # @!method initialize(network:, visa: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::CardDisputeActionParams} for more details.
        #
        #   @param network [Symbol, Increase::Models::Simulations::CardDisputeActionParams::Network] The network of the Card Dispute. Details specific to the network are required un
        #
        #   @param visa [Increase::Models::Simulations::CardDisputeActionParams::Visa] The Visa-specific parameters for the taking action on the dispute. Required if a
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The network of the Card Dispute. Details specific to the network are required
        # under the sub-object with the same identifier as the network.
        module Network
          extend Increase::Internal::Type::Enum

          # Visa
          VISA = :visa

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Visa < Increase::Internal::Type::BaseModel
          # @!attribute action
          #   The action to take. Details specific to the action are required under the
          #   sub-object with the same identifier as the action.
          #
          #   @return [Symbol, Increase::Models::Simulations::CardDisputeActionParams::Visa::Action]
          required :action, enum: -> { Increase::Simulations::CardDisputeActionParams::Visa::Action }

          # @!attribute accept_chargeback
          #   The parameters for accepting the chargeback. Required if and only if `action` is
          #   `accept_chargeback`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::AcceptChargeback, nil]
          optional :accept_chargeback, -> { Increase::Simulations::CardDisputeActionParams::Visa::AcceptChargeback }

          # @!attribute accept_user_submission
          #   The parameters for accepting the user submission. Required if and only if
          #   `action` is `accept_user_submission`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::AcceptUserSubmission, nil]
          optional :accept_user_submission,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::AcceptUserSubmission }

          # @!attribute decline_user_prearbitration
          #   The parameters for declining the prearbitration. Required if and only if
          #   `action` is `decline_user_prearbitration`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::DeclineUserPrearbitration, nil]
          optional :decline_user_prearbitration,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::DeclineUserPrearbitration }

          # @!attribute receive_merchant_prearbitration
          #   The parameters for receiving the prearbitration. Required if and only if
          #   `action` is `receive_merchant_prearbitration`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::ReceiveMerchantPrearbitration, nil]
          optional :receive_merchant_prearbitration,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::ReceiveMerchantPrearbitration }

          # @!attribute represent
          #   The parameters for re-presenting the dispute. Required if and only if `action`
          #   is `represent`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::Represent, nil]
          optional :represent, -> { Increase::Simulations::CardDisputeActionParams::Visa::Represent }

          # @!attribute request_further_information
          #   The parameters for requesting further information from the user. Required if and
          #   only if `action` is `request_further_information`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation, nil]
          optional :request_further_information,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation }

          # @!attribute time_out_chargeback
          #   The parameters for timing out the chargeback. Required if and only if `action`
          #   is `time_out_chargeback`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutChargeback, nil]
          optional :time_out_chargeback,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::TimeOutChargeback }

          # @!attribute time_out_merchant_prearbitration
          #   The parameters for timing out the merchant prearbitration. Required if and only
          #   if `action` is `time_out_merchant_prearbitration`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutMerchantPrearbitration, nil]
          optional :time_out_merchant_prearbitration,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::TimeOutMerchantPrearbitration }

          # @!attribute time_out_representment
          #   The parameters for timing out the re-presentment. Required if and only if
          #   `action` is `time_out_representment`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutRepresentment, nil]
          optional :time_out_representment,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::TimeOutRepresentment }

          # @!attribute time_out_user_prearbitration
          #   The parameters for timing out the user prearbitration. Required if and only if
          #   `action` is `time_out_user_prearbitration`.
          #
          #   @return [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutUserPrearbitration, nil]
          optional :time_out_user_prearbitration,
                   -> { Increase::Simulations::CardDisputeActionParams::Visa::TimeOutUserPrearbitration }

          # @!method initialize(action:, accept_chargeback: nil, accept_user_submission: nil, decline_user_prearbitration: nil, receive_merchant_prearbitration: nil, represent: nil, request_further_information: nil, time_out_chargeback: nil, time_out_merchant_prearbitration: nil, time_out_representment: nil, time_out_user_prearbitration: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Simulations::CardDisputeActionParams::Visa} for more details.
          #
          #   The Visa-specific parameters for the taking action on the dispute. Required if
          #   and only if `network` is `visa`.
          #
          #   @param action [Symbol, Increase::Models::Simulations::CardDisputeActionParams::Visa::Action] The action to take. Details specific to the action are required under the sub-ob
          #
          #   @param accept_chargeback [Increase::Models::Simulations::CardDisputeActionParams::Visa::AcceptChargeback] The parameters for accepting the chargeback. Required if and only if `action` is
          #
          #   @param accept_user_submission [Increase::Models::Simulations::CardDisputeActionParams::Visa::AcceptUserSubmission] The parameters for accepting the user submission. Required if and only if `actio
          #
          #   @param decline_user_prearbitration [Increase::Models::Simulations::CardDisputeActionParams::Visa::DeclineUserPrearbitration] The parameters for declining the prearbitration. Required if and only if `action
          #
          #   @param receive_merchant_prearbitration [Increase::Models::Simulations::CardDisputeActionParams::Visa::ReceiveMerchantPrearbitration] The parameters for receiving the prearbitration. Required if and only if `action
          #
          #   @param represent [Increase::Models::Simulations::CardDisputeActionParams::Visa::Represent] The parameters for re-presenting the dispute. Required if and only if `action` i
          #
          #   @param request_further_information [Increase::Models::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation] The parameters for requesting further information from the user. Required if and
          #
          #   @param time_out_chargeback [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutChargeback] The parameters for timing out the chargeback. Required if and only if `action` i
          #
          #   @param time_out_merchant_prearbitration [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutMerchantPrearbitration] The parameters for timing out the merchant prearbitration. Required if and only
          #
          #   @param time_out_representment [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutRepresentment] The parameters for timing out the re-presentment. Required if and only if `actio
          #
          #   @param time_out_user_prearbitration [Increase::Models::Simulations::CardDisputeActionParams::Visa::TimeOutUserPrearbitration] The parameters for timing out the user prearbitration. Required if and only if `

          # The action to take. Details specific to the action are required under the
          # sub-object with the same identifier as the action.
          #
          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#action
          module Action
            extend Increase::Internal::Type::Enum

            # Simulate the merchant accepting the chargeback. This will move the dispute to a `won` state.
            ACCEPT_CHARGEBACK = :accept_chargeback

            # Accept the user's submission and transmit it to the network. This will move the dispute to a `pending_response` state.
            ACCEPT_USER_SUBMISSION = :accept_user_submission

            # Simulate the merchant declining the user's pre-arbitration. This will move the dispute to a `lost` state.
            DECLINE_USER_PREARBITRATION = :decline_user_prearbitration

            # Simulate the merchant issuing pre-arbitration. This will move the dispute to a `user_submission_required` state.
            RECEIVE_MERCHANT_PREARBITRATION = :receive_merchant_prearbitration

            # Simulate the merchant re-presenting the dispute. This will move the dispute to a `user_submission_required` state.
            REPRESENT = :represent

            # Simulate further information being requested from the user. This will move the dispute to a `user_submission_required` state.
            REQUEST_FURTHER_INFORMATION = :request_further_information

            # Simulate the merchant timing out responding to the chargeback. This will move the dispute to a `won` state.
            TIME_OUT_CHARGEBACK = :time_out_chargeback

            # Simulate the user timing out responding to a merchant pre-arbitration. This will move the dispute to a `lost` state.
            TIME_OUT_MERCHANT_PREARBITRATION = :time_out_merchant_prearbitration

            # Simulate the user timing out responding to a merchant re-presentment. This will move the dispute to a `lost` state.
            TIME_OUT_REPRESENTMENT = :time_out_representment

            # Simulate the merchant timing out responding to a user pre-arbitration. This will move the dispute to a `win` state.
            TIME_OUT_USER_PREARBITRATION = :time_out_user_prearbitration

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#accept_chargeback
          class AcceptChargeback < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for accepting the chargeback. Required if and only if `action` is
            #   `accept_chargeback`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#accept_user_submission
          class AcceptUserSubmission < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for accepting the user submission. Required if and only if
            #   `action` is `accept_user_submission`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#decline_user_prearbitration
          class DeclineUserPrearbitration < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for declining the prearbitration. Required if and only if
            #   `action` is `decline_user_prearbitration`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#receive_merchant_prearbitration
          class ReceiveMerchantPrearbitration < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for receiving the prearbitration. Required if and only if
            #   `action` is `receive_merchant_prearbitration`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#represent
          class Represent < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for re-presenting the dispute. Required if and only if `action`
            #   is `represent`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#request_further_information
          class RequestFurtherInformation < Increase::Internal::Type::BaseModel
            # @!attribute reason
            #   The reason for requesting further information from the user.
            #
            #   @return [String]
            required :reason, String

            # @!method initialize(reason:)
            #   The parameters for requesting further information from the user. Required if and
            #   only if `action` is `request_further_information`.
            #
            #   @param reason [String] The reason for requesting further information from the user.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#time_out_chargeback
          class TimeOutChargeback < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for timing out the chargeback. Required if and only if `action`
            #   is `time_out_chargeback`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#time_out_merchant_prearbitration
          class TimeOutMerchantPrearbitration < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for timing out the merchant prearbitration. Required if and only
            #   if `action` is `time_out_merchant_prearbitration`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#time_out_representment
          class TimeOutRepresentment < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for timing out the re-presentment. Required if and only if
            #   `action` is `time_out_representment`.
          end

          # @see Increase::Models::Simulations::CardDisputeActionParams::Visa#time_out_user_prearbitration
          class TimeOutUserPrearbitration < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   The parameters for timing out the user prearbitration. Required if and only if
            #   `action` is `time_out_user_prearbitration`.
          end
        end
      end
    end
  end
end
