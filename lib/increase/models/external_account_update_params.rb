# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ExternalAccounts#update
    class ExternalAccountUpdateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] account_holder
      #   The type of entity that owns the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccountUpdateParams::AccountHolder, nil]
      optional :account_holder, enum: -> { Increase::Models::ExternalAccountUpdateParams::AccountHolder }

      # @!parse
      #   # @return [Symbol, Increase::Models::ExternalAccountUpdateParams::AccountHolder]
      #   attr_writer :account_holder

      # @!attribute [r] description
      #   The description you choose to give the external account.
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!attribute [r] funding
      #   The funding type of the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccountUpdateParams::Funding, nil]
      optional :funding, enum: -> { Increase::Models::ExternalAccountUpdateParams::Funding }

      # @!parse
      #   # @return [Symbol, Increase::Models::ExternalAccountUpdateParams::Funding]
      #   attr_writer :funding

      # @!attribute [r] status
      #   The status of the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccountUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::Models::ExternalAccountUpdateParams::Status }

      # @!parse
      #   # @return [Symbol, Increase::Models::ExternalAccountUpdateParams::Status]
      #   attr_writer :status

      # @!parse
      #   # @param account_holder [Symbol, Increase::Models::ExternalAccountUpdateParams::AccountHolder]
      #   # @param description [String]
      #   # @param funding [Symbol, Increase::Models::ExternalAccountUpdateParams::Funding]
      #   # @param status [Symbol, Increase::Models::ExternalAccountUpdateParams::Status]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(account_holder: nil, description: nil, funding: nil, status: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # The type of entity that owns the External Account.
      module AccountHolder
        extend Increase::Internal::Type::Enum

        # The External Account is owned by a business.
        BUSINESS = :business

        # The External Account is owned by an individual.
        INDIVIDUAL = :individual

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The funding type of the External Account.
      module Funding
        extend Increase::Internal::Type::Enum

        # A checking account.
        CHECKING = :checking

        # A savings account.
        SAVINGS = :savings

        # A different type of account.
        OTHER = :other

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # The status of the External Account.
      module Status
        extend Increase::Internal::Type::Enum

        # The External Account is active.
        ACTIVE = :active

        # The External Account is archived and won't appear in the dashboard.
        ARCHIVED = :archived

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
