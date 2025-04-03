# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Programs#retrieve
    class Program < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Program identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute bank
      #   The Bank the Program is with.
      #
      #   @return [Symbol, Increase::Models::Program::Bank]
      required :bank, enum: -> { Increase::Models::Program::Bank }

      # @!attribute billing_account_id
      #   The Program billing account.
      #
      #   @return [String, nil]
      required :billing_account_id, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
      #     was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute default_digital_card_profile_id
      #   The default configuration for digital cards attached to this Program.
      #
      #   @return [String, nil]
      required :default_digital_card_profile_id, String, nil?: true

      # @!attribute interest_rate
      #   The Interest Rate currently being earned on the accounts in this program, as a
      #     string containing a decimal number. For example, a 1% interest rate would be
      #     represented as "0.01".
      #
      #   @return [String]
      required :interest_rate, String

      # @!attribute name
      #   The name of the Program.
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #     `program`.
      #
      #   @return [Symbol, Increase::Models::Program::Type]
      required :type, enum: -> { Increase::Models::Program::Type }

      # @!attribute updated_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
      #     was last updated.
      #
      #   @return [Time]
      required :updated_at, Time

      # @!parse
      #   # Programs determine the compliance and commercial terms of Accounts. By default,
      #   #   you have a Commercial Banking program for managing your own funds. If you are
      #   #   lending or managing funds on behalf of your customers, or otherwise engaged in
      #   #   regulated activity, we will work together to create additional Programs for you.
      #   #
      #   # @param id [String]
      #   # @param bank [Symbol, Increase::Models::Program::Bank]
      #   # @param billing_account_id [String, nil]
      #   # @param created_at [Time]
      #   # @param default_digital_card_profile_id [String, nil]
      #   # @param interest_rate [String]
      #   # @param name [String]
      #   # @param type [Symbol, Increase::Models::Program::Type]
      #   # @param updated_at [Time]
      #   #
      #   def initialize(
      #     id:,
      #     bank:,
      #     billing_account_id:,
      #     created_at:,
      #     default_digital_card_profile_id:,
      #     interest_rate:,
      #     name:,
      #     type:,
      #     updated_at:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The Bank the Program is with.
      #
      # @see Increase::Models::Program#bank
      module Bank
        extend Increase::Internal::Type::Enum

        # Core Bank
        CORE_BANK = :core_bank

        # First Internet Bank of Indiana
        FIRST_INTERNET_BANK = :first_internet_bank

        # Grasshopper Bank
        GRASSHOPPER_BANK = :grasshopper_bank

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `program`.
      #
      # @see Increase::Models::Program#type
      module Type
        extend Increase::Internal::Type::Enum

        PROGRAM = :program

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
