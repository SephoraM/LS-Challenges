class School
  def initialize
    @enrollments = []
  end

  def add(name, grade)
    @enrollments << [grade, name]
  end

  def to_h
    @school = Hash.new { |school, grade| school[grade] = [] }

    @enrollments.sort.each_with_object(@school) do |enrollee, school|
      school[enrollee.first].push(enrollee.last).sort!
    end
  end

  def grade(number)
    to_h[number]
  end
end
