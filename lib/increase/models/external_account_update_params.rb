# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ExternalAccounts#update
    class ExternalAccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_holder
      #   The type of entity that owns the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccountUpdateParams::AccountHolder, nil]
      optional :account_holder, enum: -> { Increase::ExternalAccountUpdateParams::AccountHolder }

      # @!attribute description
      #   The description you choose to give the external account.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute funding
      #   The funding type of the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccountUpdateParams::Funding, nil]
      optional :funding, enum: -> { Increase::ExternalAccountUpdateParams::Funding }

      # @!attribute status
      #   The status of the External Account.
      #
      #   @return [Symbol, Increase::Models::ExternalAccountUpdateParams::Status, nil]
      optional :status, enum: -> { Increase::ExternalAccountUpdateParams::Status }

      # @!method initialize(account_holder: nil, description: nil, funding: nil, status: nil, request_options: {})
      #   @param account_holder [Symbol, Increase::Models::ExternalAccountUpdateParams::AccountHolder] The type of entity that owns the External Account.
      #
      #   @param description [String] The description you choose to give the external account.
      #
      #   @param funding [Symbol, Increase::Models::ExternalAccountUpdateParams::Funding] The funding type of the External Account.
      #
      #   @param status [Symbol, Increase::Models::ExternalAccountUpdateParams::Status] The status of the External Account.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The type of entity that owns the External Account.
      module AccountHolder
        extend Increase::Internal::Type::Enum

        # The External Account is owned by a business.
        BUSINESS = :business

        # The External Account is owned by an individual.
        INDIVIDUAL = :individual

        # @!method self.values
        #   @return [Array<Symbol>]
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

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The status of the External Account.
      module Status
        extend Increase::Internal::Type::Enum

        # The External Account is active.
        ACTIVE = :active

        # The External Account is archived and won't appear in the dashboard.
        ARCHIVED = :archived

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
