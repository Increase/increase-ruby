# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::FileLinks#create
    class FileLink < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The File Link identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File
      #   Link was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute expires_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File
      #   Link will expire.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute file_id
      #   The identifier of the File the File Link points to.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `file_link`.
      #
      #   @return [Symbol, Increase::Models::FileLink::Type]
      required :type, enum: -> { Increase::FileLink::Type }

      # @!attribute unauthenticated_url
      #   A URL where the File can be downloaded. The URL will expire after the
      #   `expires_at` time. This URL is unauthenticated and can be used to download the
      #   File without an Increase API key.
      #
      #   @return [String]
      required :unauthenticated_url, String

      # @!method initialize(id:, created_at:, expires_at:, file_id:, idempotency_key:, type:, unauthenticated_url:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::FileLink} for more details.
      #
      #   File Links let you generate a URL that can be used to download a File.
      #
      #   @param id [String] The File Link identifier.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File Li
      #
      #   @param expires_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the File Li
      #
      #   @param file_id [String] The identifier of the File the File Link points to.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param type [Symbol, Increase::Models::FileLink::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param unauthenticated_url [String] A URL where the File can be downloaded. The URL will expire after the `expires_a

      # A constant representing the object's type. For this resource it will always be
      # `file_link`.
      #
      # @see Increase::Models::FileLink#type
      module Type
        extend Increase::Internal::Type::Enum

        FILE_LINK = :file_link

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
