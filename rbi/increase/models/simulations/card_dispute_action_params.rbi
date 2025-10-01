# typed: strong

module Increase
  module Models
    module Simulations
      class CardDisputeActionParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardDisputeActionParams,
              Increase::Internal::AnyHash
            )
          end

        # The network of the Card Dispute. Details specific to the network are required
        # under the sub-object with the same identifier as the network.
        sig do
          returns(
            Increase::Simulations::CardDisputeActionParams::Network::OrSymbol
          )
        end
        attr_accessor :network

        # The Visa-specific parameters for the taking action on the dispute. Required if
        # and only if `network` is `visa`.
        sig do
          returns(
            T.nilable(Increase::Simulations::CardDisputeActionParams::Visa)
          )
        end
        attr_reader :visa

        sig do
          params(
            visa: Increase::Simulations::CardDisputeActionParams::Visa::OrHash
          ).void
        end
        attr_writer :visa

        sig do
          params(
            network:
              Increase::Simulations::CardDisputeActionParams::Network::OrSymbol,
            visa: Increase::Simulations::CardDisputeActionParams::Visa::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The network of the Card Dispute. Details specific to the network are required
          # under the sub-object with the same identifier as the network.
          network:,
          # The Visa-specific parameters for the taking action on the dispute. Required if
          # and only if `network` is `visa`.
          visa: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              network:
                Increase::Simulations::CardDisputeActionParams::Network::OrSymbol,
              visa: Increase::Simulations::CardDisputeActionParams::Visa,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The network of the Card Dispute. Details specific to the network are required
        # under the sub-object with the same identifier as the network.
        module Network
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::CardDisputeActionParams::Network
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Visa
          VISA =
            T.let(
              :visa,
              Increase::Simulations::CardDisputeActionParams::Network::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::CardDisputeActionParams::Network::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Visa < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::CardDisputeActionParams::Visa,
                Increase::Internal::AnyHash
              )
            end

          # The action to take. Details specific to the action are required under the
          # sub-object with the same identifier as the action.
          sig do
            returns(
              Increase::Simulations::CardDisputeActionParams::Visa::Action::OrSymbol
            )
          end
          attr_accessor :action

          # The parameters for accepting the chargeback. Required if and only if `action` is
          # `accept_chargeback`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :accept_chargeback

          sig { params(accept_chargeback: T.anything).void }
          attr_writer :accept_chargeback

          # The parameters for accepting the user submission. Required if and only if
          # `action` is `accept_user_submission`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :accept_user_submission

          sig { params(accept_user_submission: T.anything).void }
          attr_writer :accept_user_submission

          # The parameters for declining the prearbitration. Required if and only if
          # `action` is `decline_user_prearbitration`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :decline_user_prearbitration

          sig { params(decline_user_prearbitration: T.anything).void }
          attr_writer :decline_user_prearbitration

          # The parameters for receiving the prearbitration. Required if and only if
          # `action` is `receive_merchant_prearbitration`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :receive_merchant_prearbitration

          sig { params(receive_merchant_prearbitration: T.anything).void }
          attr_writer :receive_merchant_prearbitration

          # The parameters for re-presenting the dispute. Required if and only if `action`
          # is `represent`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :represent

          sig { params(represent: T.anything).void }
          attr_writer :represent

          # The parameters for requesting further information from the user. Required if and
          # only if `action` is `request_further_information`.
          sig do
            returns(
              T.nilable(
                Increase::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation
              )
            )
          end
          attr_reader :request_further_information

          sig do
            params(
              request_further_information:
                Increase::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation::OrHash
            ).void
          end
          attr_writer :request_further_information

          # The parameters for timing out the chargeback. Required if and only if `action`
          # is `time_out_chargeback`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :time_out_chargeback

          sig { params(time_out_chargeback: T.anything).void }
          attr_writer :time_out_chargeback

          # The parameters for timing out the merchant prearbitration. Required if and only
          # if `action` is `time_out_merchant_prearbitration`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :time_out_merchant_prearbitration

          sig { params(time_out_merchant_prearbitration: T.anything).void }
          attr_writer :time_out_merchant_prearbitration

          # The parameters for timing out the re-presentment. Required if and only if
          # `action` is `time_out_representment`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :time_out_representment

          sig { params(time_out_representment: T.anything).void }
          attr_writer :time_out_representment

          # The parameters for timing out the user prearbitration. Required if and only if
          # `action` is `time_out_user_prearbitration`.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :time_out_user_prearbitration

          sig { params(time_out_user_prearbitration: T.anything).void }
          attr_writer :time_out_user_prearbitration

          # The Visa-specific parameters for the taking action on the dispute. Required if
          # and only if `network` is `visa`.
          sig do
            params(
              action:
                Increase::Simulations::CardDisputeActionParams::Visa::Action::OrSymbol,
              accept_chargeback: T.anything,
              accept_user_submission: T.anything,
              decline_user_prearbitration: T.anything,
              receive_merchant_prearbitration: T.anything,
              represent: T.anything,
              request_further_information:
                Increase::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation::OrHash,
              time_out_chargeback: T.anything,
              time_out_merchant_prearbitration: T.anything,
              time_out_representment: T.anything,
              time_out_user_prearbitration: T.anything
            ).returns(T.attached_class)
          end
          def self.new(
            # The action to take. Details specific to the action are required under the
            # sub-object with the same identifier as the action.
            action:,
            # The parameters for accepting the chargeback. Required if and only if `action` is
            # `accept_chargeback`.
            accept_chargeback: nil,
            # The parameters for accepting the user submission. Required if and only if
            # `action` is `accept_user_submission`.
            accept_user_submission: nil,
            # The parameters for declining the prearbitration. Required if and only if
            # `action` is `decline_user_prearbitration`.
            decline_user_prearbitration: nil,
            # The parameters for receiving the prearbitration. Required if and only if
            # `action` is `receive_merchant_prearbitration`.
            receive_merchant_prearbitration: nil,
            # The parameters for re-presenting the dispute. Required if and only if `action`
            # is `represent`.
            represent: nil,
            # The parameters for requesting further information from the user. Required if and
            # only if `action` is `request_further_information`.
            request_further_information: nil,
            # The parameters for timing out the chargeback. Required if and only if `action`
            # is `time_out_chargeback`.
            time_out_chargeback: nil,
            # The parameters for timing out the merchant prearbitration. Required if and only
            # if `action` is `time_out_merchant_prearbitration`.
            time_out_merchant_prearbitration: nil,
            # The parameters for timing out the re-presentment. Required if and only if
            # `action` is `time_out_representment`.
            time_out_representment: nil,
            # The parameters for timing out the user prearbitration. Required if and only if
            # `action` is `time_out_user_prearbitration`.
            time_out_user_prearbitration: nil
          )
          end

          sig do
            override.returns(
              {
                action:
                  Increase::Simulations::CardDisputeActionParams::Visa::Action::OrSymbol,
                accept_chargeback: T.anything,
                accept_user_submission: T.anything,
                decline_user_prearbitration: T.anything,
                receive_merchant_prearbitration: T.anything,
                represent: T.anything,
                request_further_information:
                  Increase::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation,
                time_out_chargeback: T.anything,
                time_out_merchant_prearbitration: T.anything,
                time_out_representment: T.anything,
                time_out_user_prearbitration: T.anything
              }
            )
          end
          def to_hash
          end

          # The action to take. Details specific to the action are required under the
          # sub-object with the same identifier as the action.
          module Action
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardDisputeActionParams::Visa::Action
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Simulate the merchant accepting the chargeback. This will move the dispute to a `won` state.
            ACCEPT_CHARGEBACK =
              T.let(
                :accept_chargeback,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Accept the user's submission and transmit it to the network. This will move the dispute to a `pending_response` state.
            ACCEPT_USER_SUBMISSION =
              T.let(
                :accept_user_submission,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate the merchant declining the user's pre-arbitration. This will move the dispute to a `lost` state.
            DECLINE_USER_PREARBITRATION =
              T.let(
                :decline_user_prearbitration,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate the merchant issuing pre-arbitration. This will move the dispute to a `user_submission_required` state.
            RECEIVE_MERCHANT_PREARBITRATION =
              T.let(
                :receive_merchant_prearbitration,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate the merchant re-presenting the dispute. This will move the dispute to a `user_submission_required` state.
            REPRESENT =
              T.let(
                :represent,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate further information being requested from the user. This will move the dispute to a `user_submission_required` state.
            REQUEST_FURTHER_INFORMATION =
              T.let(
                :request_further_information,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate the merchant timing out responding to the chargeback. This will move the dispute to a `won` state.
            TIME_OUT_CHARGEBACK =
              T.let(
                :time_out_chargeback,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate the user timing out responding to a merchant pre-arbitration. This will move the dispute to a `lost` state.
            TIME_OUT_MERCHANT_PREARBITRATION =
              T.let(
                :time_out_merchant_prearbitration,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate the user timing out responding to a merchant re-presentment. This will move the dispute to a `lost` state.
            TIME_OUT_REPRESENTMENT =
              T.let(
                :time_out_representment,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            # Simulate the merchant timing out responding to a user pre-arbitration. This will move the dispute to a `win` state.
            TIME_OUT_USER_PREARBITRATION =
              T.let(
                :time_out_user_prearbitration,
                Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardDisputeActionParams::Visa::Action::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class RequestFurtherInformation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Simulations::CardDisputeActionParams::Visa::RequestFurtherInformation,
                  Increase::Internal::AnyHash
                )
              end

            # The reason for requesting further information from the user.
            sig { returns(String) }
            attr_accessor :reason

            # The parameters for requesting further information from the user. Required if and
            # only if `action` is `request_further_information`.
            sig { params(reason: String).returns(T.attached_class) }
            def self.new(
              # The reason for requesting further information from the user.
              reason:
            )
            end

            sig { override.returns({ reason: String }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
