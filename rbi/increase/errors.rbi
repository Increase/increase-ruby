# typed: strong

module Increase
  module Errors
    class Error < StandardError
      sig { returns(T.nilable(StandardError)) }
      attr_accessor :cause
    end

    class ConversionError < Increase::Errors::Error
    end

    class APIError < Increase::Errors::Error
      sig { returns(URI::Generic) }
      attr_accessor :url

      sig { returns(T.nilable(Integer)) }
      attr_accessor :status

      sig { returns(T.nilable(T.anything)) }
      attr_accessor :body

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: T.nilable(Integer),
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: nil
      )
      end
    end

    class APIConnectionError < Increase::Errors::APIError
      sig { void }
      attr_accessor :status

      sig { void }
      attr_accessor :body

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: NilClass,
          body: NilClass,
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
      end
    end

    class APITimeoutError < Increase::Errors::APIConnectionError
      # @api private
      sig do
        params(
          url: URI::Generic,
          status: NilClass,
          body: NilClass,
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
      end
    end

    class APIStatusError < Increase::Errors::APIError
      # @api private
      sig do
        params(
          url: URI::Generic,
          status: Integer,
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.for(url:, status:, body:, request:, response:, message: nil)
      end

      sig { returns(Integer) }
      attr_accessor :status

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: Integer,
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(url:, status:, body:, request:, response:, message: nil)
      end
    end

    class BadRequestError < Increase::Errors::APIStatusError
      HTTP_STATUS = 400
    end

    class AuthenticationError < Increase::Errors::APIStatusError
      HTTP_STATUS = 401
    end

    class PermissionDeniedError < Increase::Errors::APIStatusError
      HTTP_STATUS = 403
    end

    class NotFoundError < Increase::Errors::APIStatusError
      HTTP_STATUS = 404
    end

    class ConflictError < Increase::Errors::APIStatusError
      HTTP_STATUS = 409
    end

    class UnprocessableEntityError < Increase::Errors::APIStatusError
      HTTP_STATUS = 422
    end

    class RateLimitError < Increase::Errors::APIStatusError
      HTTP_STATUS = 429
    end

    class InvalidParametersError < Increase::Errors::BadRequestError
      TYPE = "invalid_parameters_error"
    end

    class MalformedRequestError < Increase::Errors::BadRequestError
      TYPE = "malformed_request_error"
    end

    class InvalidAPIKeyError < Increase::Errors::AuthenticationError
      TYPE = "invalid_api_key_error"
    end

    class EnvironmentMismatchError < Increase::Errors::PermissionDeniedError
      TYPE = "environment_mismatch_error"
    end

    class InsufficientPermissionsError < Increase::Errors::PermissionDeniedError
      TYPE = "insufficient_permissions_error"
    end

    class PrivateFeatureError < Increase::Errors::PermissionDeniedError
      TYPE = "private_feature_error"
    end

    class APIMethodNotFoundError < Increase::Errors::NotFoundError
      TYPE = "api_method_not_found_error"
    end

    class ObjectNotFoundError < Increase::Errors::NotFoundError
      TYPE = "object_not_found_error"
    end

    class IdempotencyKeyAlreadyUsedError < Increase::Errors::ConflictError
      TYPE = "idempotency_key_already_used_error"
    end

    class InvalidOperationError < Increase::Errors::ConflictError
      TYPE = "invalid_operation_error"
    end

    class RateLimitedError < Increase::Errors::RateLimitError
      TYPE = "rate_limited_error"
    end

    class InternalServerError < Increase::Errors::APIStatusError
      TYPE = "internal_server_error"
    end
  end
end
