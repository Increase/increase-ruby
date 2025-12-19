# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::Exports#create
      class ExportCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute category
        #   The type of Export to create.
        #
        #   @return [Symbol, Increase::Models::Simulations::ExportCreateParams::Category]
        required :category, enum: -> { Increase::Simulations::ExportCreateParams::Category }

        # @!attribute form_1099_int
        #   Options for the created export. Required if `category` is equal to
        #   `form_1099_int`.
        #
        #   @return [Increase::Models::Simulations::ExportCreateParams::Form1099Int, nil]
        optional :form_1099_int, -> { Increase::Simulations::ExportCreateParams::Form1099Int }

        # @!method initialize(category:, form_1099_int: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Simulations::ExportCreateParams} for more details.
        #
        #   @param category [Symbol, Increase::Models::Simulations::ExportCreateParams::Category] The type of Export to create.
        #
        #   @param form_1099_int [Increase::Models::Simulations::ExportCreateParams::Form1099Int] Options for the created export. Required if `category` is equal to `form_1099_in
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The type of Export to create.
        module Category
          extend Increase::Internal::Type::Enum

          # A PDF of an Internal Revenue Service Form 1099-INT.
          FORM_1099_INT = :form_1099_int

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Form1099Int < Increase::Internal::Type::BaseModel
          # @!attribute account_id
          #   The identifier of the Account the tax document is for.
          #
          #   @return [String]
          required :account_id, String

          # @!method initialize(account_id:)
          #   Options for the created export. Required if `category` is equal to
          #   `form_1099_int`.
          #
          #   @param account_id [String] The identifier of the Account the tax document is for.
        end
      end
    end
  end
end
