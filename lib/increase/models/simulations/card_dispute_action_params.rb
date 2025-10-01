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
          #   @return [Object, nil]
          optional :accept_chargeback, Increase::Internal::Type::Unknown

          # @!attribute accept_user_submission
          #   The parameters for accepting the user submission. Required if and only if
          #   `action` is `accept_user_submission`.
          #
          #   @return [Object, nil]
          optional :accept_user_submission, Increase::Internal::Type::Unknown

          # @!attribute decline_user_prearbitration
          #   The parameters for declining the prearbitration. Required if and only if
          #   `action` is `decline_user_prearbitration`.
          #
          #   @return [Object, nil]
          optional :decline_user_prearbitration, Increase::Internal::Type::Unknown

          # @!attribute receive_merchant_prearbitration
          #   The parameters for receiving the prearbitration. Required if and only if
          #   `action` is `receive_merchant_prearbitration`.
          #
          #   @return [Object, nil]
          optional :receive_merchant_prearbitration, Increase::Internal::Type::Unknown

          # @!attribute represent
          #   The parameters for re-presenting the dispute. Required if and only if `action`
          #   is `represent`.
          #
          #   @return [Object, nil]
          optional :represent, Increase::Internal::Type::Unknown

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
          #   @return [Object, nil]
          optional :time_out_chargeback, Increase::Internal::Type::Unknown

          # @!attribute time_out_merchant_prearbitration
          #   The parameters for timing out the merchant prearbitration. Required if and only
          #   if `action` is `time_out_merchant_prearbitration`.
          #
          #   @return [Object, nil]
          optional :time_out_merchant_prearbitration, Increase::Internal::Type::Unknown

          # @!attribute time_out_representment
          #   The parameters for timing out the re-presentment. Required if and only if
          #   `action` is `time_out_representment`.
          #
          #   @return [Object, nil]
          optional :time_out_representment, Increase::Internal::Type::Unknown

          # @!attribute time_out_user_prearbitration
          #   The parameters for timing out the user prearbitration. Required if and only if
          #   `action` is `time_out_user_prearbitration`.
          #
          #   @return [Object, nil]
          optional :time_out_user_prearbitration, Increase::Internal::Type::Unknown

          # @!method initialize(action:, accept_chargeback: nil, accept_user_submission: nil, decline_user_prearbitration: nil, receive_merchant_prearbitration: nil, represent: nil, request_further_information: nil, time_out_chargeback: nil, time_out_merchant_prearbitration: nil, time_out_representment: nil, time_out_user_prearbitration: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Simulations::CardDisputeActionParams::Visa} for more details.
          #
          #   The Visa-specific parameters for the taking action on the dispute. Required if
          #   and only if `network` is `visa`.
          #
          #   @param action [Symbol, Increase::Models::Simulations::CardDisputeActionParams::Visa::Action] The action to take. Details specific to the action are required under the sub-ob
          #
          #   @param accept_chargeback [Object] The parameters for accepting the chargeback. Required if and only if `action` is
          #
          #   @param accept_user_submission [Object] The parameters for accepting the user submission. Required if and only if `actio
          #
          #   @param decline_user_prearbitration [Object] The parameters for declining the prearbitration. Required if and only if `action
          #
          #   @param receive_merchant_prearbitration [Object] The parameters for receiving the prearbitration. Required if and only if `action
          #
          #   @param represent [Object] The parameters for re-presenting the dispute. Required if and only if `action` i
          #
          #   @param request_further_information [Increase::Models::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation] The parameters for requesting further information from the user. Required if and
          #
          #   @param time_out_chargeback [Object] The parameters for timing out the chargeback. Required if and only if `action` i
          #
          #   @param time_out_merchant_prearbitration [Object] The parameters for timing out the merchant prearbitration. Required if and only
          #
          #   @param time_out_representment [Object] The parameters for timing out the re-presentment. Required if and only if `actio
          #
          #   @param time_out_user_prearbitration [Object] The parameters for timing out the user prearbitration. Required if and only if `

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
        end
      end
    end
  end
end
