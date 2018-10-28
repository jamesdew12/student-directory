

# #{students[index-1][:name]}
# (#{students[index-1][:cohort]} cohort)


equire 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the names of all the students"
  puts "2. Show the students that youve put in"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    puts "The program will now end."
    exit # this will cause the program to terminate
  when "3"
    save_students
    puts "The students list has been updated to what you want"
  when "4"
    puts "Enter the file that you wanted to load (students.csv will be loaded if you press enter)"
    load_students
    puts "The students list has been loaded. You can now add more students to it"
  else
    puts "I don't know what you meant, try again"
  end
end

def students_array(name)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students_array(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
    CSV.open("students.csv", "w") do |csv|
      @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_file(filename = "students.csv")
  File::open(filename, "r").readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
end

def load_students
  filename = gets.chomp
  if !filename.empty? && File.exists?(filename)
    load_file(filename)
  else
    load_file
  end
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    load_students
  end
end

try_load_students
interactive_menu

=begin
load students
file = File.open(filename, "r")
file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  @students << {name: name, cohort: cohort.to_sym}
end
file.close
end