# typed: strong

module Increase
  module Models
    module Simulations
      class ExportCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::ExportCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The type of Export to create.
        sig do
          returns(Increase::Simulations::ExportCreateParams::Category::OrSymbol)
        end
        attr_accessor :category

        # Options for the created export. Required if `category` is equal to
        # `form_1099_int`.
        sig do
          returns(
            T.nilable(Increase::Simulations::ExportCreateParams::Form1099Int)
          )
        end
        attr_reader :form_1099_int

        sig do
          params(
            form_1099_int:
              Increase::Simulations::ExportCreateParams::Form1099Int::OrHash
          ).void
        end
        attr_writer :form_1099_int

        sig do
          params(
            category:
              Increase::Simulations::ExportCreateParams::Category::OrSymbol,
            form_1099_int:
              Increase::Simulations::ExportCreateParams::Form1099Int::OrHash,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of Export to create.
          category:,
          # Options for the created export. Required if `category` is equal to
          # `form_1099_int`.
          form_1099_int: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::Simulations::ExportCreateParams::Category::OrSymbol,
              form_1099_int:
                Increase::Simulations::ExportCreateParams::Form1099Int,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The type of Export to create.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::Simulations::ExportCreateParams::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A PDF of an Internal Revenue Service Form 1099-INT.
          FORM_1099_INT =
            T.let(
              :form_1099_int,
              Increase::Simulations::ExportCreateParams::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::ExportCreateParams::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Form1099Int < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::ExportCreateParams::Form1099Int,
                Increase::Internal::AnyHash
              )
            end

          # The identifier of the Account the tax document is for.
          sig { returns(String) }
          attr_accessor :account_id

          # Options for the created export. Required if `category` is equal to
          # `form_1099_int`.
          sig { params(account_id: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the Account the tax document is for.
            account_id:
          )
          end

          sig { override.returns({ account_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
