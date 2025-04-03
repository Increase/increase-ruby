# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::OAuthConnections#retrieve
    class OAuthConnection < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The OAuth Connection's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #     Connection was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute deleted_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #     Connection was deleted.
      #
      #   @return [Time, nil]
      required :deleted_at, Time, nil?: true

      # @!attribute group_id
      #   The identifier of the Group that has authorized your OAuth application.
      #
      #   @return [String]
      required :group_id, String

      # @!attribute oauth_application_id
      #   The identifier of the OAuth application this connection is for.
      #
      #   @return [String]
      required :oauth_application_id, String

      # @!attribute status
      #   Whether the connection is active.
      #
      #   @return [Symbol, Increase::Models::OAuthConnection::Status]
      required :status, enum: -> { Increase::Models::OAuthConnection::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `oauth_connection`.
      #
      #   @return [Symbol, Increase::Models::OAuthConnection::Type]
      required :type, enum: -> { Increase::Models::OAuthConnection::Type }

      # @!parse
      #   # When a user authorizes your OAuth application, an OAuth Connection object is
      #   #   created. Learn more about OAuth
      #   #   [here](https://increase.com/documentation/oauth).
      #   #
      #   # @param id [String]
      #   # @param created_at [Time]
      #   # @param deleted_at [Time, nil]
      #   # @param group_id [String]
      #   # @param oauth_application_id [String]
      #   # @param status [Symbol, Increase::Models::OAuthConnection::Status]
      #   # @param type [Symbol, Increase::Models::OAuthConnection::Type]
      #   #
      #   def initialize(id:, created_at:, deleted_at:, group_id:, oauth_application_id:, status:, type:, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # Whether the connection is active.
      #
      # @see Increase::Models::OAuthConnection#status
      module Status
        extend Increase::Internal::Type::Enum

        # The OAuth connection is active.
        ACTIVE = :active

        # The OAuth connection is permanently deactivated.
        INACTIVE = :inactive

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `oauth_connection`.
      #
      # @see Increase::Models::OAuthConnection#type
      module Type
        extend Increase::Internal::Type::Enum

        OAUTH_CONNECTION = :oauth_connection

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
