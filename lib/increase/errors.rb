# frozen_string_literal: true

module Increase
  module Errors
    class Error < StandardError
      # @!attribute cause
      #
      #   @return [StandardError, nil]
    end

    class ConversionError < Increase::Errors::Error
    end

    class APIError < Increase::Errors::Error
      # @return [URI::Generic]
      attr_accessor :url

      # @return [Integer, nil]
      attr_accessor :status

      # @return [Object, nil]
      attr_accessor :body

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
        @url = url
        @status = status
        @body = body
        @request = request
        @response = response
        super(message)
      end
    end

    class APIConnectionError < Increase::Errors::APIError
      # @!attribute status
      #
      #   @return [nil]

      # @!attribute body
      #
      #   @return [nil]

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
        super
      end
    end

    class APITimeoutError < Increase::Errors::APIConnectionError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
        super
      end
    end

    class APIStatusError < Increase::Errors::APIError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      #
      # @return [self]
      def self.for(url:, status:, body:, request:, response:, message: nil)
        key = Increase::Internal::Util.dig(body, :type)
        kwargs = {
          url: url,
          status: status,
          body: body,
          request: request,
          response: response,
          message: message
        }

        case [status, key]
        in [400, Increase::Errors::InvalidParametersError::TYPE]
          Increase::Errors::InvalidParametersError.new(**kwargs)
        in [400, Increase::Errors::MalformedRequestError::TYPE]
          Increase::Errors::MalformedRequestError.new(**kwargs)
        in [401, Increase::Errors::InvalidAPIKeyError::TYPE]
          Increase::Errors::InvalidAPIKeyError.new(**kwargs)
        in [403, Increase::Errors::EnvironmentMismatchError::TYPE]
          Increase::Errors::EnvironmentMismatchError.new(**kwargs)
        in [403, Increase::Errors::InsufficientPermissionsError::TYPE]
          Increase::Errors::InsufficientPermissionsError.new(**kwargs)
        in [403, Increase::Errors::PrivateFeatureError::TYPE]
          Increase::Errors::PrivateFeatureError.new(**kwargs)
        in [404, Increase::Errors::APIMethodNotFoundError::TYPE]
          Increase::Errors::APIMethodNotFoundError.new(**kwargs)
        in [404, Increase::Errors::ObjectNotFoundError::TYPE]
          Increase::Errors::ObjectNotFoundError.new(**kwargs)
        in [409, Increase::Errors::IdempotencyKeyAlreadyUsedError::TYPE]
          Increase::Errors::IdempotencyKeyAlreadyUsedError.new(**kwargs)
        in [409, Increase::Errors::InvalidOperationError::TYPE]
          Increase::Errors::InvalidOperationError.new(**kwargs)
        in [429, Increase::Errors::RateLimitedError::TYPE]
          Increase::Errors::RateLimitedError.new(**kwargs)
        in [(500..), Increase::Errors::InternalServerError::TYPE]
          Increase::Errors::InternalServerError.new(**kwargs)
        in [400, _]
          Increase::Errors::BadRequestError.new(**kwargs)
        in [401, _]
          Increase::Errors::AuthenticationError.new(**kwargs)
        in [403, _]
          Increase::Errors::PermissionDeniedError.new(**kwargs)
        in [404, _]
          Increase::Errors::NotFoundError.new(**kwargs)
        in [409, _]
          Increase::Errors::ConflictError.new(**kwargs)
        in [422, _]
          Increase::Errors::UnprocessableEntityError.new(**kwargs)
        in [429, _]
          Increase::Errors::RateLimitError.new(**kwargs)
        else
          Increase::Errors::APIStatusError.new(**kwargs)
        end
      end

      # @!parse
      #   # @return [Integer]
      #   attr_accessor :status

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status:, body:, request:, response:, message: nil)
        message ||= {url: url.to_s, status: status, body: body}
        super(
          url: url,
          status: status,
          body: body,
          request: request,
          response: response,
          message: message&.to_s
        )
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
