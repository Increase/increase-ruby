# typed: strong

module Increase
  module Resources
    class DigitalCardProfiles
      # Create a Digital Card Profile
      sig do
        params(
          app_icon_file_id: String,
          background_image_file_id: String,
          card_description: String,
          description: String,
          issuer_name: String,
          contact_email: String,
          contact_phone: String,
          contact_website: String,
          text_color:
            Increase::DigitalCardProfileCreateParams::TextColor::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::DigitalCardProfile)
      end
      def create(
        # The identifier of the File containing the card's icon image.
        app_icon_file_id:,
        # The identifier of the File containing the card's front image.
        background_image_file_id:,
        # A user-facing description for the card itself.
        card_description:,
        # A description you can use to identify the Card Profile.
        description:,
        # A user-facing description for whoever is issuing the card.
        issuer_name:,
        # An email address the user can contact to receive support for their card.
        contact_email: nil,
        # A phone number the user can contact to receive support for their card.
        contact_phone: nil,
        # A website the user can visit to view and receive support for their card.
        contact_website: nil,
        # The Card's text color, specified as an RGB triple. The default is white.
        text_color: nil,
        request_options: {}
      )
      end

      # Retrieve a Digital Card Profile
      sig do
        params(
          digital_card_profile_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::DigitalCardProfile)
      end
      def retrieve(
        # The identifier of the Digital Card Profile.
        digital_card_profile_id,
        request_options: {}
      )
      end

      # List Card Profiles
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::DigitalCardProfileListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::DigitalCardProfileListResponse)
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

      # Archive a Digital Card Profile
      sig do
        params(
          digital_card_profile_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::DigitalCardProfile)
      end
      def archive(
        # The identifier of the Digital Card Profile to archive.
        digital_card_profile_id,
        request_options: {}
      )
      end

      # Clones a Digital Card Profile
      sig do
        params(
          digital_card_profile_id: String,
          app_icon_file_id: String,
          background_image_file_id: String,
          card_description: String,
          contact_email: String,
          contact_phone: String,
          contact_website: String,
          description: String,
          issuer_name: String,
          text_color:
            Increase::DigitalCardProfileCloneParams::TextColor::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::DigitalCardProfile)
      end
      def clone_(
        # The identifier of the Digital Card Profile to clone.
        digital_card_profile_id,
        # The identifier of the File containing the card's icon image.
        app_icon_file_id: nil,
        # The identifier of the File containing the card's front image.
        background_image_file_id: nil,
        # A user-facing description for the card itself.
        card_description: nil,
        # An email address the user can contact to receive support for their card.
        contact_email: nil,
        # A phone number the user can contact to receive support for their card.
        contact_phone: nil,
        # A website the user can visit to view and receive support for their card.
        contact_website: nil,
        # A description you can use to identify the Card Profile.
        description: nil,
        # A user-facing description for whoever is issuing the card.
        issuer_name: nil,
        # The Card's text color, specified as an RGB triple. The default is white.
        text_color: nil,
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
