# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::Programs#create
      class ProgramCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute name
        #   The name of the program being added.
        #
        #   @return [String]
        required :name, String

        # @!attribute bank
        #   The bank for the program's accounts, defaults to First Internet Bank.
        #
        #   @return [Symbol, Increase::Models::Simulations::ProgramCreateParams::Bank, nil]
        optional :bank, enum: -> { Increase::Simulations::ProgramCreateParams::Bank }

        # @!attribute lending_maximum_extendable_credit
        #   The maximum extendable credit of the program being added.
        #
        #   @return [Integer, nil]
        optional :lending_maximum_extendable_credit, Integer

        # @!attribute reserve_account_id
        #   The identifier of the Account the Program should be added to is for.
        #
        #   @return [String, nil]
        optional :reserve_account_id, String

        # @!method initialize(name:, bank: nil, lending_maximum_extendable_credit: nil, reserve_account_id: nil, request_options: {})
        #   @param name [String] The name of the program being added.
        #
        #   @param bank [Symbol, Increase::Models::Simulations::ProgramCreateParams::Bank] The bank for the program's accounts, defaults to First Internet Bank.
        #
        #   @param lending_maximum_extendable_credit [Integer] The maximum extendable credit of the program being added.
        #
        #   @param reserve_account_id [String] The identifier of the Account the Program should be added to is for.
        #
        #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

        # The bank for the program's accounts, defaults to First Internet Bank.
        module Bank
          extend Increase::Internal::Type::Enum

          # Blue Ridge Bank, N.A.
          BLUE_RIDGE_BANK = :blue_ridge_bank

          # Core Bank
          CORE_BANK = :core_bank

          # First Internet Bank of Indiana
          FIRST_INTERNET_BANK = :first_internet_bank

          # Global Innovations Bank
          GLOBAL_INNOVATIONS_BANK = :global_innovations_bank

          # Grasshopper Bank
          GRASSHOPPER_BANK = :grasshopper_bank

          # Twin City Bank
          TWIN_CITY_BANK = :twin_city_bank

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
