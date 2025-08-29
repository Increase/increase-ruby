# typed: strong

module Increase
  module Models
    class DocumentCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::DocumentCreateParams, Increase::Internal::AnyHash)
        end

      # The type of document to create.
      sig { returns(Increase::DocumentCreateParams::Category::OrSymbol) }
      attr_accessor :category

      # An account verification letter. Required if and only if `category` is
      # `account_verification_letter`.
      sig do
        returns(
          T.nilable(Increase::DocumentCreateParams::AccountVerificationLetter)
        )
      end
      attr_reader :account_verification_letter

      sig do
        params(
          account_verification_letter:
            Increase::DocumentCreateParams::AccountVerificationLetter::OrHash
        ).void
      end
      attr_writer :account_verification_letter

      # Funding instructions. Required if and only if `category` is
      # `funding_instructions`.
      sig do
        returns(T.nilable(Increase::DocumentCreateParams::FundingInstructions))
      end
      attr_reader :funding_instructions

      sig do
        params(
          funding_instructions:
            Increase::DocumentCreateParams::FundingInstructions::OrHash
        ).void
      end
      attr_writer :funding_instructions

      sig do
        params(
          category: Increase::DocumentCreateParams::Category::OrSymbol,
          account_verification_letter:
            Increase::DocumentCreateParams::AccountVerificationLetter::OrHash,
          funding_instructions:
            Increase::DocumentCreateParams::FundingInstructions::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The type of document to create.
        category:,
        # An account verification letter. Required if and only if `category` is
        # `account_verification_letter`.
        account_verification_letter: nil,
        # Funding instructions. Required if and only if `category` is
        # `funding_instructions`.
        funding_instructions: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: Increase::DocumentCreateParams::Category::OrSymbol,
            account_verification_letter:
              Increase::DocumentCreateParams::AccountVerificationLetter,
            funding_instructions:
              Increase::DocumentCreateParams::FundingInstructions,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The type of document to create.
      module Category
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DocumentCreateParams::Category)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # An account verification letter.
        ACCOUNT_VERIFICATION_LETTER =
          T.let(
            :account_verification_letter,
            Increase::DocumentCreateParams::Category::TaggedSymbol
          )

        # Funding instructions.
        FUNDING_INSTRUCTIONS =
          T.let(
            :funding_instructions,
            Increase::DocumentCreateParams::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DocumentCreateParams::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class AccountVerificationLetter < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DocumentCreateParams::AccountVerificationLetter,
              Increase::Internal::AnyHash
            )
          end

        # The Account Number the bank letter should be generated for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # If provided, the letter will include the Account's balance as of the date.
        sig { returns(T.nilable(Date)) }
        attr_reader :balance_date

        sig { params(balance_date: Date).void }
        attr_writer :balance_date

        # An account verification letter. Required if and only if `category` is
        # `account_verification_letter`.
        sig do
          params(account_number_id: String, balance_date: Date).returns(
            T.attached_class
          )
        end
        def self.new(
          # The Account Number the bank letter should be generated for.
          account_number_id:,
          # If provided, the letter will include the Account's balance as of the date.
          balance_date: nil
        )
        end

        sig do
          override.returns({ account_number_id: String, balance_date: Date })
        end
        def to_hash
        end
      end

      class FundingInstructions < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DocumentCreateParams::FundingInstructions,
              Increase::Internal::AnyHash
            )
          end

        # The Account Number the funding instructions should be generated for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # Funding instructions. Required if and only if `category` is
        # `funding_instructions`.
        sig { params(account_number_id: String).returns(T.attached_class) }
        def self.new(
          # The Account Number the funding instructions should be generated for.
          account_number_id:
        )
        end

        sig { override.returns({ account_number_id: String }) }
        def to_hash
        end
      end
    end
  end
end
