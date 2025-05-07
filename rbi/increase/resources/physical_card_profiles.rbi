# typed: strong

module Increase
  module Resources
    class PhysicalCardProfiles
      # Create a Physical Card Profile
      sig do
        params(
          carrier_image_file_id: String,
          contact_phone: String,
          description: String,
          front_image_file_id: String,
          program_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCardProfile)
      end
      def create(
        # The identifier of the File containing the physical card's carrier image.
        carrier_image_file_id:,
        # A phone number the user can contact to receive support for their card.
        contact_phone:,
        # A description you can use to identify the Card Profile.
        description:,
        # The identifier of the File containing the physical card's front image.
        front_image_file_id:,
        # The identifier for the Program that this Physical Card Profile falls under.
        program_id:,
        request_options: {}
      )
      end

      # Retrieve a Card Profile
      sig do
        params(
          physical_card_profile_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCardProfile)
      end
      def retrieve(
        # The identifier of the Card Profile.
        physical_card_profile_id,
        request_options: {}
      )
      end

      # List Physical Card Profiles
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::PhysicalCardProfileListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::PhysicalCardProfile])
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # Archive a Physical Card Profile
      sig do
        params(
          physical_card_profile_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCardProfile)
      end
      def archive(
        # The identifier of the Physical Card Profile to archive.
        physical_card_profile_id,
        request_options: {}
      )
      end

      # Clone a Physical Card Profile
      sig do
        params(
          physical_card_profile_id: String,
          carrier_image_file_id: String,
          contact_phone: String,
          description: String,
          front_image_file_id: String,
          front_text:
            Increase::PhysicalCardProfileCloneParams::FrontText::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCardProfile)
      end
      def clone_(
        # The identifier of the Physical Card Profile to clone.
        physical_card_profile_id,
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

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
