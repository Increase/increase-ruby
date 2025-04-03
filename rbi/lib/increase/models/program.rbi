# typed: strong

module Increase
  module Models
    class Program < Increase::Internal::Type::BaseModel
      # The Program identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Bank the Program is with.
      sig { returns(Increase::Models::Program::Bank::TaggedSymbol) }
      attr_accessor :bank

      # The Program billing account.
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_account_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
      #   was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The default configuration for digital cards attached to this Program.
      sig { returns(T.nilable(String)) }
      attr_accessor :default_digital_card_profile_id

      # The Interest Rate currently being earned on the accounts in this program, as a
      #   string containing a decimal number. For example, a 1% interest rate would be
      #   represented as "0.01".
      sig { returns(String) }
      attr_accessor :interest_rate

      # The name of the Program.
      sig { returns(String) }
      attr_accessor :name

      # A constant representing the object's type. For this resource it will always be
      #   `program`.
      sig { returns(Increase::Models::Program::Type::TaggedSymbol) }
      attr_accessor :type

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
      #   was last updated.
      sig { returns(Time) }
      attr_accessor :updated_at

      # Programs determine the compliance and commercial terms of Accounts. By default,
      #   you have a Commercial Banking program for managing your own funds. If you are
      #   lending or managing funds on behalf of your customers, or otherwise engaged in
      #   regulated activity, we will work together to create additional Programs for you.
      sig do
        params(
          id: String,
          bank: Increase::Models::Program::Bank::OrSymbol,
          billing_account_id: T.nilable(String),
          created_at: Time,
          default_digital_card_profile_id: T.nilable(String),
          interest_rate: String,
          name: String,
          type: Increase::Models::Program::Type::OrSymbol,
          updated_at: Time
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        bank:,
        billing_account_id:,
        created_at:,
        default_digital_card_profile_id:,
        interest_rate:,
        name:,
        type:,
        updated_at:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              bank: Increase::Models::Program::Bank::TaggedSymbol,
              billing_account_id: T.nilable(String),
              created_at: Time,
              default_digital_card_profile_id: T.nilable(String),
              interest_rate: String,
              name: String,
              type: Increase::Models::Program::Type::TaggedSymbol,
              updated_at: Time
            }
          )
      end
      def to_hash
      end

      # The Bank the Program is with.
      module Bank
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Program::Bank) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::Program::Bank::TaggedSymbol) }

        # Core Bank
        CORE_BANK = T.let(:core_bank, Increase::Models::Program::Bank::TaggedSymbol)

        # First Internet Bank of Indiana
        FIRST_INTERNET_BANK = T.let(:first_internet_bank, Increase::Models::Program::Bank::TaggedSymbol)

        # Grasshopper Bank
        GRASSHOPPER_BANK = T.let(:grasshopper_bank, Increase::Models::Program::Bank::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::Program::Bank::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      #   `program`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::Program::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Increase::Models::Program::Type::TaggedSymbol) }

        PROGRAM = T.let(:program, Increase::Models::Program::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::Program::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
