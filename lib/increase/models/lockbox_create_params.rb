# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Lockboxes#create
    class LockboxCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account checks sent to this Lockbox should be deposited into.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute [r] description
      #   The description you choose for the Lockbox, for display purposes.
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!attribute [r] recipient_name
      #   The name of the recipient that will receive mail at this location.
      #
      #   @return [String, nil]
      optional :recipient_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :recipient_name

      # @!parse
      #   # @param account_id [String]
      #   # @param description [String]
      #   # @param recipient_name [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(account_id:, description: nil, recipient_name: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
