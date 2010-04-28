module Veritas
  module Logic
    class Predicate
      class LessThanOrEqualTo < Predicate
        def self.eval(left, right)
          left <= right
        end

        def invert
          GreaterThan.new(left, right)
        end

        def inspect
          "#{left.inspect} <= #{right.inspect}"
        end

      private

        def swap
          GreaterThanOrEqualTo.new(right, left)
        end

        def always_true?
          if left_attribute? && right_attribute? && equivalent?
            true
          else
            left_max < right_min
          end
        end

        def always_false?
          left  = self.left
          right = self.right

          left_attribute  = left_attribute?
          right_attribute = right_attribute?

          if left_attribute && right_attribute
            return true unless comparable?

          elsif left_attribute
            return true unless left.valid_primitive?(right)

          elsif right_attribute
            return true unless right.valid_primitive?(left)

          end

          left_min > right_max
        end

      end # class LessThanOrEqualTo
    end # class Predicate
  end # module Logic
end # module Veritas
