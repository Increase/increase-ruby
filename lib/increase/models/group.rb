# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Groups#retrieve
    class Group < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Group identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group
      #   was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `group`.
      #
      #   @return [Symbol, Increase::Models::Group::Type]
      required :type, enum: -> { Increase::Group::Type }

      # @!method initialize(id:, created_at:, type:)
      #   Some parameter documentations has been truncated, see {Increase::Models::Group}
      #   for more details.
      #
      #   Groups represent organizations using Increase. You can retrieve information
      #   about your own organization via the API. More commonly, OAuth platforms can
      #   retrieve information about the organizations that have granted them access.
      #   Learn more about OAuth [here](https://increase.com/documentation/oauth).
      #
      #   @param id [String] The Group identifier.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Group w
      #
      #   @param type [Symbol, Increase::Models::Group::Type] A constant representing the object's type. For this resource it will always be `

      # A constant representing the object's type. For this resource it will always be
      # `group`.
      #
      # @see Increase::Models::Group#type
      module Type
        extend Increase::Internal::Type::Enum

        GROUP = :group

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
