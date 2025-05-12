# typed: strong

module Increase
  module Models
    class PhysicalCardProfileCloneParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::PhysicalCardProfileCloneParams,
            Increase::Internal::AnyHash
          )
        end

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
      # [support@increase.com](mailto:support@increase.com) for more information.
      sig do
        returns(T.nilable(Increase::PhysicalCardProfileCloneParams::FrontText))
      end
      attr_reader :front_text

      sig do
        params(
          front_text:
            Increase::PhysicalCardProfileCloneParams::FrontText::OrHash
        ).void
      end
      attr_writer :front_text

      sig do
        params(
          carrier_image_file_id: String,
          contact_phone: String,
          description: String,
          front_image_file_id: String,
          front_text:
            Increase::PhysicalCardProfileCloneParams::FrontText::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the File containing the physical card's carrier image.
        carrier_image_file_id: nil,
        # A phone number the user can contact to receive support for their card.
        contact_phone: nil,
        # A description you can use to identify the Card Profile.
        description: nil,
        # The identifier of the File containing the physical card's front image.
        front_image_file_id: nil,
        # Text printed on the front of the card. Reach out to
        # [support@increase.com](mailto:support@increase.com) for more information.
        front_text: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            carrier_image_file_id: String,
            contact_phone: String,
            description: String,
            front_image_file_id: String,
            front_text: Increase::PhysicalCardProfileCloneParams::FrontText,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class FrontText < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PhysicalCardProfileCloneParams::FrontText,
              Increase::Internal::AnyHash
            )
          end

        # The first line of text on the front of the card.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of text on the front of the card. Providing a second line moves
        # the first line slightly higher and prints the second line in the spot where the
        # first line would have otherwise been printed.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # Text printed on the front of the card. Reach out to
        # [support@increase.com](mailto:support@increase.com) for more information.
        sig { params(line1: String, line2: String).returns(T.attached_class) }
        def self.new(
          # The first line of text on the front of the card.
          line1:,
          # The second line of text on the front of the card. Providing a second line moves
          # the first line slightly higher and prints the second line in the spot where the
          # first line would have otherwise been printed.
          line2: nil
        )
        end

        sig { override.returns({ line1: String, line2: String }) }
        def to_hash
        end
      end
    end
  end
end
