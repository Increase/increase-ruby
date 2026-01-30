# typed: strong

module Increase
  module Models
    class Program < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Program, Increase::Internal::AnyHash) }

      # The Program identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Bank the Program is with.
      sig { returns(Increase::Program::Bank::TaggedSymbol) }
      attr_accessor :bank

      # The Program billing account.
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_account_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
      # was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The default configuration for digital cards attached to this Program.
      sig { returns(T.nilable(String)) }
      attr_accessor :default_digital_card_profile_id

      # The Interest Rate currently being earned on the accounts in this program, as a
      # string containing a decimal number. For example, a 1% interest rate would be
      # represented as "0.01".
      sig { returns(String) }
      attr_accessor :interest_rate

      # The lending details for the program.
      sig { returns(T.nilable(Increase::Program::Lending)) }
      attr_reader :lending

      sig do
        params(lending: T.nilable(Increase::Program::Lending::OrHash)).void
      end
      attr_writer :lending

      # The name of the Program.
      sig { returns(String) }
      attr_accessor :name

      # A constant representing the object's type. For this resource it will always be
      # `program`.
      sig { returns(Increase::Program::Type::TaggedSymbol) }
      attr_accessor :type

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
      # was last updated.
      sig { returns(Time) }
      attr_accessor :updated_at

      # Programs determine the compliance and commercial terms of Accounts. By default,
      # you have a Commercial Banking program for managing your own funds. If you are
      # lending or managing funds on behalf of your customers, or otherwise engaged in
      # regulated activity, we will work together to create additional Programs for you.
      sig do
        params(
          id: String,
          bank: Increase::Program::Bank::OrSymbol,
          billing_account_id: T.nilable(String),
          created_at: Time,
          default_digital_card_profile_id: T.nilable(String),
          interest_rate: String,
          lending: T.nilable(Increase::Program::Lending::OrHash),
          name: String,
          type: Increase::Program::Type::OrSymbol,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # The Program identifier.
        id:,
        # The Bank the Program is with.
        bank:,
        # The Program billing account.
        billing_account_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
        # was created.
        created_at:,
        # The default configuration for digital cards attached to this Program.
        default_digital_card_profile_id:,
        # The Interest Rate currently being earned on the accounts in this program, as a
        # string containing a decimal number. For example, a 1% interest rate would be
        # represented as "0.01".
        interest_rate:,
        # The lending details for the program.
        lending:,
        # The name of the Program.
        name:,
        # A constant representing the object's type. For this resource it will always be
        # `program`.
        type:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Program
        # was last updated.
        updated_at:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            bank: Increase::Program::Bank::TaggedSymbol,
            billing_account_id: T.nilable(String),
            created_at: Time,
            default_digital_card_profile_id: T.nilable(String),
            interest_rate: String,
            lending: T.nilable(Increase::Program::Lending),
            name: String,
            type: Increase::Program::Type::TaggedSymbol,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # The Bank the Program is with.
      module Bank
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Program::Bank) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Core Bank
        CORE_BANK = T.let(:core_bank, Increase::Program::Bank::TaggedSymbol)

        # First Internet Bank of Indiana
        FIRST_INTERNET_BANK =
          T.let(:first_internet_bank, Increase::Program::Bank::TaggedSymbol)

        # Grasshopper Bank
        GRASSHOPPER_BANK =
          T.let(:grasshopper_bank, Increase::Program::Bank::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Program::Bank::TaggedSymbol])
        end
        def self.values
        end
      end

      class Lending < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Program::Lending, Increase::Internal::AnyHash)
          end

        # The maximum extendable credit of the program.
        sig { returns(Integer) }
        attr_accessor :maximum_extendable_credit

        # The lending details for the program.
        sig do
          params(maximum_extendable_credit: Integer).returns(T.attached_class)
        end
        def self.new(
          # The maximum extendable credit of the program.
          maximum_extendable_credit:
        )
        end

        sig { override.returns({ maximum_extendable_credit: Integer }) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `program`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Program::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROGRAM = T.let(:program, Increase::Program::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Program::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
