require_relative '/student'

class Classroom < Student
  attr_reader :student
  attr_accessor :label

  def initialize(label)
    super()
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
