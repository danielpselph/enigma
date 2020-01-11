#create alphabet array with blank space
abc = ("a".."z").to_a << " "

#generate random 5 digit number
def random_nums
  Array.new(5) {rand(0..9)}
end

#generate date, use if statement if no date is entered
def date_generator
  date = Time.now.strftime("%d%m%y").to_i
  date ** 2
end
