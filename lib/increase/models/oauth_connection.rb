# frozen_string_literal: true

module Increase
  module Models
    # @example
    # ```ruby
    # oauth_connection => {
    #   id: String,
    #   created_at: Time,
    #   deleted_at: Time,
    #   group_id: String,
    #   oauth_application_id: String,
    #   **_
    # }
    # ```
    class OAuthConnection < Increase::BaseModel
      # @!attribute id
      #   The OAuth Connection's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth Connection was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute deleted_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth Connection was deleted.
      #
      #   @return [Time, nil]
      required :deleted_at, Time

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
      #   A constant representing the object's type. For this resource it will always be `oauth_connection`.
      #
      #   @return [Symbol, Increase::Models::OAuthConnection::Type]
      required :type, enum: -> { Increase::Models::OAuthConnection::Type }

      # @!parse
      #   # When a user authorizes your OAuth application, an OAuth Connection object is
      #   #   created. Learn more about OAuth
      #   #   [here](https://increase.com/documentation/oauth).
      #   #
      #   # @param id [String] The OAuth Connection's identifier.
      #   #
      #   # @param created_at [String] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #   #   Connection was created.
      #   #
      #   # @param deleted_at [String, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #   #   Connection was deleted.
      #   #
      #   # @param group_id [String] The identifier of the Group that has authorized your OAuth application.
      #   #
      #   # @param oauth_application_id [String] The identifier of the OAuth application this connection is for.
      #   #
      #   # @param status [String] Whether the connection is active.
      #   #
      #   # @param type [String] A constant representing the object's type. For this resource it will always be
      #   #   `oauth_connection`.
      #   #
      #   def initialize(id:, created_at:, deleted_at:, group_id:, oauth_application_id:, status:, type:, **) = super

      # def initialize: (Hash | Increase::BaseModel) -> void

      # Whether the connection is active.
      #
      # @example
      # ```ruby
      # case status
      # in :active
      #   # ...
      # in :inactive
      #   # ...
      # end
      # ```
      class Status < Increase::Enum
        # The OAuth connection is active.
        ACTIVE = :active

        # The OAuth connection is permanently deactivated.
        INACTIVE = :inactive

        finalize!
      end

      # A constant representing the object's type. For this resource it will always be `oauth_connection`.
      #
      # @example
      # ```ruby
      # case type
      # in :oauth_connection
      #   # ...
      # end
      # ```
      class Type < Increase::Enum
        OAUTH_CONNECTION = :oauth_connection

        finalize!
      end
    end
  end
end
