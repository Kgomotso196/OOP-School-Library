require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, _classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = Classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
