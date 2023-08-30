require '/book'
require '/teacher'
require '/student'
require '/rental'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def book_list
    print "\nSorry you can't find any books\n" if @books.empty?
    @books.each_with_index do |book, index|
      print "\n(#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n"
    end
  end

  def people_list
    people = @persons
    people.each_with_index do |person, index|
      print "\n(#{index}) Name: \"#{person.name}\", Age: \"#{person.age}\", id: \"#{person.id}\"\n"
    end
    print "\nSorry you can't find any person\n" if people.empty?
  end

  def rental_list
    puts "Please enter person's id to see rentals"
    people_list
    print "\nSorry you can't find any rentals\n" if @rentals.empty?
    id = gets.chomp.to_i
    @rentals.each do |i|
      print "\nDate: #{i.date}, Title: #{i.book.title}, Author: #{i.book.author}\n" if id == i.person.id
    end
  end

  def create_book
    print 'Book Title:'
    title = gets.chomp
    print 'Book Author:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts "\n#{new_book.title} created successfully\n"
  end

  def create_rentals
    print "Select a book from the following list by number \n"
    book_list
    book = gets.chomp.to_i
    print "select a person's number \n"
    people_list
    person = gets.chomp.to_i
    print 'select a date'
    date = gets.chomp
    people = @persons
    new_rental = Rental.new(date, @books[book], people[person])
    @rentals << new_rental
    print 'Rental created successfully'
  end

  def create_person
    print "Choose whom you want to create\n (1)Student\n (2)Teacher\n"
    creator = gets.chomp.to_i

    case creator
    when 1
      print 'Enter the Name: '
      name = gets.chomp.to_s
      print 'Enter the Age: '
      age = gets.chomp.to_i
      print 'Enter the parent permission[Y/N]: '
      parent_permission = gets.chomp
      parent_permission = %w[y Y].include?(parent_permission)
      new_student = Student.new(age, parent_permission)
      new_student.name = name
      @persons.push(new_student)
      print "\n#{new_student.name} was added successfully"

    when 2
      print 'Enter the Name: '
      name = gets.chomp
      print 'Enter the Age: '
      age = gets.chomp.to_i
      print 'Enter the Specialization: '
      speecialization = gets.chomp
      new_teacher = Teacher.new(age, name, speecialization)
      @persons.push(new_teacher)
      puts "\n#{new_teacher.name} was added successfully"
    end
  end
end
