# typed: strong

module Increase
  module Models
    class CheckbookCheckListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CheckbookCheckListParams, Increase::Internal::AnyHash)
        end

      # Filter Checkbook Checks to those drawn on the specified Account Number.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number_id

      sig { params(account_number_id: String).void }
      attr_writer :account_number_id

      # Filter Checkbook Checks to the one with the specified check number.
      sig { returns(T.nilable(Integer)) }
      attr_reader :check_number

      sig { params(check_number: Integer).void }
      attr_writer :check_number

      # Filter Checkbook Checks to those belonging to the specified Checkbook.
      sig { returns(T.nilable(String)) }
      attr_reader :checkbook_id

      sig { params(checkbook_id: String).void }
      attr_writer :checkbook_id

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the size of the list that is returned. The default (and maximum) is 100
      # objects.
      #
      # Defaults to `100`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          account_number_id: String,
          check_number: Integer,
          checkbook_id: String,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter Checkbook Checks to those drawn on the specified Account Number.
        account_number_id: nil,
        # Filter Checkbook Checks to the one with the specified check number.
        check_number: nil,
        # Filter Checkbook Checks to those belonging to the specified Checkbook.
        checkbook_id: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        #
        # Defaults to `100`.
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_number_id: String,
            check_number: Integer,
            checkbook_id: String,
            cursor: String,
            limit: Integer,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
