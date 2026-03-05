# typed: strong

module Increase
  module Models
    class DigitalCardProfileArchiveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::DigitalCardProfileArchiveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Digital Card Profile to archive.
      sig { returns(String) }
      attr_accessor :digital_card_profile_id

      sig do
        params(
          digital_card_profile_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Digital Card Profile to archive.
        digital_card_profile_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            digital_card_profile_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
