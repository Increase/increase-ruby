# typed: strong

module Increase
  module Models
    class PhysicalCardProfileCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The identifier of the File containing the physical card's carrier image.
      sig { returns(String) }
      attr_accessor :carrier_image_file_id

      # A phone number the user can contact to receive support for their card.
      sig { returns(String) }
      attr_accessor :contact_phone

      # A description you can use to identify the Card Profile.
      sig { returns(String) }
      attr_accessor :description

      # The identifier of the File containing the physical card's front image.
      sig { returns(String) }
      attr_accessor :front_image_file_id

      sig do
        params(
          carrier_image_file_id: String,
          contact_phone: String,
          description: String,
          front_image_file_id: String,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        carrier_image_file_id:,
        contact_phone:,
        description:,
        front_image_file_id:,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              carrier_image_file_id: String,
              contact_phone: String,
              description: String,
              front_image_file_id: String,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
