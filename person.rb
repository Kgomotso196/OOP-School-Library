class Nameable
  def correct_name(name)
    raise NotImplementedError
  end
end

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def correct_name
    @name
  end

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @nameable = Nameable.new
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rentals(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age > 18
  end
end

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0, 10]
  end
end
