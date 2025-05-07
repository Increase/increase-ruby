# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Documents#list
    class DocumentListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute category
      #
      #   @return [Increase::DocumentListParams::Category, nil]
      optional :category, -> { Increase::DocumentListParams::Category }

      # @!attribute created_at
      #
      #   @return [Increase::DocumentListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::DocumentListParams::CreatedAt }

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute entity_id
      #   Filter Documents to ones belonging to the specified Entity.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(category: nil, created_at: nil, cursor: nil, entity_id: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::DocumentListParams} for more details.
      #
      #   @param category [Increase::DocumentListParams::Category]
      #
      #   @param created_at [Increase::DocumentListParams::CreatedAt]
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param entity_id [String] Filter Documents to ones belonging to the specified Entity.
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Category < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter Documents for those with the specified category or categories. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::DocumentListParams::Category::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::DocumentListParams::Category::In] },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::DocumentListParams::Category} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::DocumentListParams::Category::In>] Filter Documents for those with the specified category or categories. For GET re

        module In
          extend Increase::Internal::Type::Enum

          # Internal Revenue Service Form 1099-INT.
          FORM_1099_INT = :form_1099_int

          # Internal Revenue Service Form 1099-MISC.
          FORM_1099_MISC = :form_1099_misc

          # A document submitted in response to a proof of authorization request for an ACH transfer.
          PROOF_OF_AUTHORIZATION = :proof_of_authorization

          # Company information, such a policies or procedures, typically submitted during our due diligence process.
          COMPANY_INFORMATION = :company_information

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # @!attribute after
        #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        #
        #   @return [Time, nil]
        optional :after, Time

        # @!attribute before
        #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        #
        #   @return [Time, nil]
        optional :before, Time

        # @!attribute on_or_after
        #   Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_after, Time

        # @!attribute on_or_before
        #   Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_before, Time

        # @!method initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::DocumentListParams::CreatedAt} for more details.
        #
        #   @param after [Time] Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) tim
        #
        #   @param before [Time] Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ti
        #
        #   @param on_or_after [Time] Return results on or after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_860
        #
        #   @param on_or_before [Time] Return results on or before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_86
      end
    end
  end
end
