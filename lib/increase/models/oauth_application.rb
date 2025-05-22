# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::OAuthApplications#retrieve
    class OAuthApplication < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The OAuth Application's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute client_id
      #   The OAuth Application's client_id. Use this to authenticate with the OAuth
      #   Application.
      #
      #   @return [String]
      required :client_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #   Application was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute deleted_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #   Application was deleted.
      #
      #   @return [Time, nil]
      required :deleted_at, Time, nil?: true

      # @!attribute name
      #   The name you chose for this OAuth Application.
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute status
      #   Whether the application is active.
      #
      #   @return [Symbol, Increase::Models::OAuthApplication::Status]
      required :status, enum: -> { Increase::OAuthApplication::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `oauth_application`.
      #
      #   @return [Symbol, Increase::Models::OAuthApplication::Type]
      required :type, enum: -> { Increase::OAuthApplication::Type }

      # @!method initialize(id:, client_id:, created_at:, deleted_at:, name:, status:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::OAuthApplication} for more details.
      #
      #   An OAuth Application lets you build an application for others to use with their
      #   Increase data. You can create an OAuth Application via the Dashboard and read
      #   information about it with the API. Learn more about OAuth
      #   [here](https://increase.com/documentation/oauth).
      #
      #   @param id [String] The OAuth Application's identifier.
      #
      #   @param client_id [String] The OAuth Application's client_id. Use this to authenticate with the OAuth Appli
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #
      #   @param deleted_at [Time, nil] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp when the OAuth
      #
      #   @param name [String, nil] The name you chose for this OAuth Application.
      #
      #   @param status [Symbol, Increase::Models::OAuthApplication::Status] Whether the application is active.
      #
      #   @param type [Symbol, Increase::Models::OAuthApplication::Type] A constant representing the object's type. For this resource it will always be `

      # Whether the application is active.
      #
      # @see Increase::Models::OAuthApplication#status
      module Status
        extend Increase::Internal::Type::Enum

        # The application is active and can be used by your users.
        ACTIVE = :active

        # The application is deleted.
        DELETED = :deleted

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `oauth_application`.
      #
      # @see Increase::Models::OAuthApplication#type
      module Type
        extend Increase::Internal::Type::Enum

        OAUTH_APPLICATION = :oauth_application

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
