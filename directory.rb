def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "What makers cohort are you in?"
  cohort = gets.chomp.to_sym
  puts "What are his/her hobbie?"
  hobbie = gets.chomp
  puts "what country you from"
  country = gets.chomp
  if cohort.to_s == ""
    cohort = "unknown cohort"
  end  


  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbie: hobbie, country: country}
    puts "Now we have #{students.count} students"
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    puts "What makers cohort are you in?"
    cohort = gets.chomp.to_sym
    if cohort.to_s == ""
    cohort = "unknown cohort"
    end
    puts "What are his/her hobbie?"
    hobbie = gets.chomp
    puts "what country you from"
    country = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  # iterate through students until studnet[:name] is the empty string
  # print the right schnitzel
  index = 0
  until students[index] == nil
    puts "#{index += 1}. #{students[index-1][:name]} (#{students[index-1][:cohort]} cohort) "
  end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)


# #{students[index-1][:name]}
# (#{students[index-1][:cohort]} cohort)