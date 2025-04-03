# typed: strong

module Increase
  module Models
    class FileLinkCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The File to create a File Link for.
      sig { returns(String) }
      attr_accessor :file_id

      # The time at which the File Link will expire. The default is 1 hour from the time
      #   of the request. The maxiumum is 1 day from the time of the request.
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      sig do
        params(
          file_id: String,
          expires_at: Time,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(file_id:, expires_at: nil, request_options: {})
      end

      sig { override.returns({file_id: String, expires_at: Time, request_options: Increase::RequestOptions}) }
      def to_hash
      end
    end
  end
end
