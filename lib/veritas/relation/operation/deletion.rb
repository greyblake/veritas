# encoding: utf-8

module Veritas
  class Relation
    module Operation

      # A class representing an deletion from a relation
      class Deletion < Relation
        include Proxy

        # Initialize a Deletion
        #
        # @param [Relation] relation
        #
        # @return [undefined]
        #
        # @api private
        def initialize(*args)
          @relation = Algebra::Difference.new(*args)
        end

        module Methods

          # Return a relation that represents a deletion from a relation
          #
          # @example
          #   deletion = relation.delete(other)
          #
          # @param [Enumerable] other
          #
          # @return [Deletion]
          #
          # @api public
          def delete(other)
            Deletion.new(self, coerce(other))
          end

        end # module Methods

        Relation.class_eval { include Methods }

      end # class Deletion
    end # module Operation
  end # class Relation
end # module Veritas
