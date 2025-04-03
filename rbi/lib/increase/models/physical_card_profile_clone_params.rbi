# typed: strong

module Increase
  module Models
    class PhysicalCardProfileCloneParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The identifier of the File containing the physical card's carrier image.
      sig { returns(T.nilable(String)) }
      attr_reader :carrier_image_file_id

      sig { params(carrier_image_file_id: String).void }
      attr_writer :carrier_image_file_id

      # A phone number the user can contact to receive support for their card.
      sig { returns(T.nilable(String)) }
      attr_reader :contact_phone

      sig { params(contact_phone: String).void }
      attr_writer :contact_phone

      # A description you can use to identify the Card Profile.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The identifier of the File containing the physical card's front image.
      sig { returns(T.nilable(String)) }
      attr_reader :front_image_file_id

      sig { params(front_image_file_id: String).void }
      attr_writer :front_image_file_id

      # Text printed on the front of the card. Reach out to
      #   [support@increase.com](mailto:support@increase.com) for more information.
      sig { returns(T.nilable(Increase::Models::PhysicalCardProfileCloneParams::FrontText)) }
      attr_reader :front_text

      sig do
        params(
          front_text: T.any(Increase::Models::PhysicalCardProfileCloneParams::FrontText, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :front_text

      sig do
        params(
          carrier_image_file_id: String,
          contact_phone: String,
          description: String,
          front_image_file_id: String,
          front_text: T.any(Increase::Models::PhysicalCardProfileCloneParams::FrontText, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        carrier_image_file_id: nil,
        contact_phone: nil,
        description: nil,
        front_image_file_id: nil,
        front_text: nil,
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
              front_text: Increase::Models::PhysicalCardProfileCloneParams::FrontText,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class FrontText < Increase::Internal::Type::BaseModel
        # The first line of text on the front of the card.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of text on the front of the card. Providing a second line moves
        #   the first line slightly higher and prints the second line in the spot where the
        #   first line would have otherwise been printed.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # Text printed on the front of the card. Reach out to
        #   [support@increase.com](mailto:support@increase.com) for more information.
        sig { params(line1: String, line2: String).returns(T.attached_class) }
        def self.new(line1:, line2: nil)
        end

        sig { override.returns({line1: String, line2: String}) }
        def to_hash
        end
      end
    end
  end
end
