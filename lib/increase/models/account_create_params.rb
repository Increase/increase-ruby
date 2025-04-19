# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#create
    class AccountCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute name
      #   The name you choose for the Account.
      #
      #   @return [String]
      required :name, String

      # @!attribute entity_id
      #   The identifier for the Entity that will own the Account.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!attribute informational_entity_id
      #   The identifier of an Entity that, while not owning the Account, is associated
      #   with its activity. Its relationship to your group must be `informational`.
      #
      #   @return [String, nil]
      optional :informational_entity_id, String

      # @!attribute program_id
      #   The identifier for the Program that this Account falls under. Required if you
      #   operate more than one Program.
      #
      #   @return [String, nil]
      optional :program_id, String

      # @!method initialize(name:, entity_id: nil, informational_entity_id: nil, program_id: nil, request_options: {})
      #   @param name [String]
      #   @param entity_id [String]
      #   @param informational_entity_id [String]
      #   @param program_id [String]
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
