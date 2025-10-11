# typed: strong

module Increase
  module Models
    module Simulations
      class ProgramCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::ProgramCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The name of the program being added.
        sig { returns(String) }
        attr_accessor :name

        # The bank for the program's accounts, defaults to First Internet Bank.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::ProgramCreateParams::Bank::OrSymbol
            )
          )
        end
        attr_reader :bank

        sig do
          params(
            bank: Increase::Simulations::ProgramCreateParams::Bank::OrSymbol
          ).void
        end
        attr_writer :bank

        # The identifier of the Account the Program should be added to is for.
        sig { returns(T.nilable(String)) }
        attr_reader :reserve_account_id

        sig { params(reserve_account_id: String).void }
        attr_writer :reserve_account_id

        sig do
          params(
            name: String,
            bank: Increase::Simulations::ProgramCreateParams::Bank::OrSymbol,
            reserve_account_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The name of the program being added.
          name:,
          # The bank for the program's accounts, defaults to First Internet Bank.
          bank: nil,
          # The identifier of the Account the Program should be added to is for.
          reserve_account_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              bank: Increase::Simulations::ProgramCreateParams::Bank::OrSymbol,
              reserve_account_id: String,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The bank for the program's accounts, defaults to First Internet Bank.
        module Bank
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::Simulations::ProgramCreateParams::Bank)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Blue Ridge Bank, N.A.
          BLUE_RIDGE_BANK =
            T.let(
              :blue_ridge_bank,
              Increase::Simulations::ProgramCreateParams::Bank::TaggedSymbol
            )

          # Core Bank
          CORE_BANK =
            T.let(
              :core_bank,
              Increase::Simulations::ProgramCreateParams::Bank::TaggedSymbol
            )

          # First Internet Bank of Indiana
          FIRST_INTERNET_BANK =
            T.let(
              :first_internet_bank,
              Increase::Simulations::ProgramCreateParams::Bank::TaggedSymbol
            )

          # Global Innovations Bank
          GLOBAL_INNOVATIONS_BANK =
            T.let(
              :global_innovations_bank,
              Increase::Simulations::ProgramCreateParams::Bank::TaggedSymbol
            )

          # Grasshopper Bank
          GRASSHOPPER_BANK =
            T.let(
              :grasshopper_bank,
              Increase::Simulations::ProgramCreateParams::Bank::TaggedSymbol
            )

          # Twin City Bank
          TWIN_CITY_BANK =
            T.let(
              :twin_city_bank,
              Increase::Simulations::ProgramCreateParams::Bank::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::ProgramCreateParams::Bank::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
