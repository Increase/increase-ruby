# typed: strong

module Increase
  module Models
    UnwrapWebhookEvent = T.let(T.anything, Increase::Internal::Type::Converter)
  end
end
