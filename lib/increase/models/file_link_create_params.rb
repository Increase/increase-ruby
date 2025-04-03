# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::FileLinks#create
    class FileLinkCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute file_id
      #   The File to create a File Link for.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute [r] expires_at
      #   The time at which the File Link will expire. The default is 1 hour from the time
      #     of the request. The maxiumum is 1 day from the time of the request.
      #
      #   @return [Time, nil]
      optional :expires_at, Time

      # @!parse
      #   # @return [Time]
      #   attr_writer :expires_at

      # @!parse
      #   # @param file_id [String]
      #   # @param expires_at [Time]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(file_id:, expires_at: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
