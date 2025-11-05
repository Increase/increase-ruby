# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Lockboxes#update
    class LockboxUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute check_deposit_behavior
      #   This indicates if checks mailed to this lockbox will be deposited.
      #
      #   @return [Symbol, Increase::Models::LockboxUpdateParams::CheckDepositBehavior, nil]
      optional :check_deposit_behavior, enum: -> { Increase::LockboxUpdateParams::CheckDepositBehavior }

      # @!attribute description
      #   The description you choose for the Lockbox.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute recipient_name
      #   The recipient name you choose for the Lockbox.
      #
      #   @return [String, nil]
      optional :recipient_name, String

      # @!method initialize(check_deposit_behavior: nil, description: nil, recipient_name: nil, request_options: {})
      #   @param check_deposit_behavior [Symbol, Increase::Models::LockboxUpdateParams::CheckDepositBehavior] This indicates if checks mailed to this lockbox will be deposited.
      #
      #   @param description [String] The description you choose for the Lockbox.
      #
      #   @param recipient_name [String] The recipient name you choose for the Lockbox.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # This indicates if checks mailed to this lockbox will be deposited.
      module CheckDepositBehavior
        extend Increase::Internal::Type::Enum

        # Checks mailed to this Lockbox will be deposited.
        ENABLED = :enabled

        # Checks mailed to this Lockbox will not be deposited.
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
