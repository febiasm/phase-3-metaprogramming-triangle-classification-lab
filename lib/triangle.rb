class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    if [a, b, c].any? { |side| side <= 0 }
      raise TriangleError, "Sides must have a positive length."
    end

    sides = [a, b, c].sort
    unless sides[0] + sides[1] > sides[2]
      raise TriangleError, "Not a valid triangle."
    end
  end

  class TriangleError < StandardError
  end
end
