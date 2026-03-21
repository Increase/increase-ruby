# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundMailItems#action
    class InboundMailItemActionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute inbound_mail_item_id
      #   The identifier of the Inbound Mail Item to action.
      #
      #   @return [String]
      required :inbound_mail_item_id, String

      # @!attribute checks
      #   The actions to perform on the Inbound Mail Item.
      #
      #   @return [Array<Increase::Models::InboundMailItemActionParams::Check>]
      required :checks, -> { Increase::Internal::Type::ArrayOf[Increase::InboundMailItemActionParams::Check] }

      # @!method initialize(inbound_mail_item_id:, checks:, request_options: {})
      #   @param inbound_mail_item_id [String] The identifier of the Inbound Mail Item to action.
      #
      #   @param checks [Array<Increase::Models::InboundMailItemActionParams::Check>] The actions to perform on the Inbound Mail Item.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Check < Increase::Internal::Type::BaseModel
        # @!attribute action
        #   The action to perform on the Inbound Mail Item.
        #
        #   @return [Symbol, Increase::Models::InboundMailItemActionParams::Check::Action]
        required :action, enum: -> { Increase::InboundMailItemActionParams::Check::Action }

        # @!attribute account_id
        #   The identifier of the Account to deposit the check into. If not provided, the
        #   check will be deposited into the Account associated with the Lockbox.
        #
        #   @return [String, nil]
        optional :account_id, String

        # @!method initialize(action:, account_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::InboundMailItemActionParams::Check} for more details.
        #
        #   @param action [Symbol, Increase::Models::InboundMailItemActionParams::Check::Action] The action to perform on the Inbound Mail Item.
        #
        #   @param account_id [String] The identifier of the Account to deposit the check into. If not provided, the ch

        # The action to perform on the Inbound Mail Item.
        #
        # @see Increase::Models::InboundMailItemActionParams::Check#action
        module Action
          extend Increase::Internal::Type::Enum

          # The check will be deposited.
          DEPOSIT = :deposit

          # The check will be ignored.
          IGNORE = :ignore

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
