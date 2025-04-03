# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Documents#list
    class DocumentListParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] category
      #
      #   @return [Increase::Models::DocumentListParams::Category, nil]
      optional :category, -> { Increase::Models::DocumentListParams::Category }

      # @!parse
      #   # @return [Increase::Models::DocumentListParams::Category]
      #   attr_writer :category

      # @!attribute [r] created_at
      #
      #   @return [Increase::Models::DocumentListParams::CreatedAt, nil]
      optional :created_at, -> { Increase::Models::DocumentListParams::CreatedAt }

      # @!parse
      #   # @return [Increase::Models::DocumentListParams::CreatedAt]
      #   attr_writer :created_at

      # @!attribute [r] cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!parse
      #   # @return [String]
      #   attr_writer :cursor

      # @!attribute [r] entity_id
      #   Filter Documents to ones belonging to the specified Entity.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :entity_id

      # @!attribute [r] limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :limit

      # @!parse
      #   # @param category [Increase::Models::DocumentListParams::Category]
      #   # @param created_at [Increase::Models::DocumentListParams::CreatedAt]
      #   # @param cursor [String]
      #   # @param entity_id [String]
      #   # @param limit [Integer]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(category: nil, created_at: nil, cursor: nil, entity_id: nil, limit: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class Category < Increase::Internal::Type::BaseModel
        # @!attribute [r] in_
        #   Filter Documents for those with the specified category or categories. For GET
        #     requests, this should be encoded as a comma-delimited string, such as
        #     `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::Models::DocumentListParams::Category::In>, nil]
        optional :in_,
                 -> { Increase::Internal::Type::ArrayOf[enum: Increase::Models::DocumentListParams::Category::In] },
                 api_name: :in

        # @!parse
        #   # @return [Array<Symbol, Increase::Models::DocumentListParams::Category::In>]
        #   attr_writer :in_

        # @!parse
        #   # @param in_ [Array<Symbol, Increase::Models::DocumentListParams::Category::In>]
        #   #
        #   def initialize(in_: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # @!attribute [r] after
        #   Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #     timestamp.
        #
        #   @return [Time, nil]
        optional :after, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :after

        # @!attribute [r] before
        #   Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #     timestamp.
        #
        #   @return [Time, nil]
        optional :before, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :before

        # @!attribute [r] on_or_after
        #   Return results on or after this
        #     [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_after, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :on_or_after

        # @!attribute [r] on_or_before
        #   Return results on or before this
        #     [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        #
        #   @return [Time, nil]
        optional :on_or_before, Time

        # @!parse
        #   # @return [Time]
        #   attr_writer :on_or_before

        # @!parse
        #   # @param after [Time]
        #   # @param before [Time]
        #   # @param on_or_after [Time]
        #   # @param on_or_before [Time]
        #   #
        #   def initialize(after: nil, before: nil, on_or_after: nil, on_or_before: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end
    end
  end
end
