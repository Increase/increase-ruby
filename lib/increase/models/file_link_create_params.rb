# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::FileLinks#create
    class FileLinkCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute file_id
      #   The File to create a File Link for.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute expires_at
      #   The time at which the File Link will expire. The default is 1 hour from the time
      #   of the request. The maxiumum is 1 day from the time of the request.
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!method initialize(file_id:, expires_at: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::FileLinkCreateParams} for more details.
      #
      #   @param file_id [String] The File to create a File Link for.
      #
      #   @param expires_at [Time] The time at which the File Link will expire. The default is 1 hour from the time
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
