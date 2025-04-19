# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Lockboxes#create
    class LockboxCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account checks sent to this Lockbox should be deposited into.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute description
      #   The description you choose for the Lockbox, for display purposes.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute recipient_name
      #   The name of the recipient that will receive mail at this location.
      #
      #   @return [String, nil]
      optional :recipient_name, String

      # @!method initialize(account_id:, description: nil, recipient_name: nil, request_options: {})
      #   @param account_id [String]
      #   @param description [String]
      #   @param recipient_name [String]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
