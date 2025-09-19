# typed: strong

module Increase
  module Resources
    class CardDetails
      # Update a Card's PIN
      sig do
        params(
          card_id: String,
          pin: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardDetailsAPI)
      end
      def update(
        # The card identifier.
        card_id,
        # The 4-digit PIN for the card, for use with ATMs.
        pin:,
        request_options: {}
      )
      end

      # Create an iframe URL for a Card to display the card details. More details about
      # styling and usage can be found in the
      # [documentation](/documentation/embedded-card-component).
      sig do
        params(
          card_id: String,
          physical_card_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardIframeURL)
      end
      def create_details_iframe(
        # The identifier of the Card to retrieve details for.
        card_id,
        # The identifier of the Physical Card to retrieve details for.
        physical_card_id: nil,
        request_options: {}
      )
      end

      # Sensitive details for a Card include the primary account number, expiry, card
      # verification code, and PIN.
      sig do
        params(
          card_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardDetailsAPI)
      end
      def details(
        # The identifier of the Card to retrieve details for.
        card_id,
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
