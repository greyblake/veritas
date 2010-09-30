module Veritas
  module Logic

    # Abstract base class for logical connectives
    class Connective < Expression
      include AbstractClass

      # Return the inverse connective
      #
      # @example
      #   negation = connective.inverse
      #
      # @return [Negation]
      #
      # @api public
      def inverse
        Negation.new(self)
      end

      memoize :inverse

    end # class Connective
  end # module Logic
end # module Veritas

require 'veritas/logic/connective/binary'
require 'veritas/logic/connective/unary'

require 'veritas/logic/connective/conjunction'
require 'veritas/logic/connective/disjunction'
require 'veritas/logic/connective/negation'
