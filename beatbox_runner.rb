Dir["./lib/*.rb"].each {|file| require file}

bb = BeatBox.new
puts "*~* Welcome to Beatbox! *~*"
puts "First, enter a phrase you'd like to hear beatboxed back to you below. The following words are allowed:"

bb.valid_beats.each do |beat|
  if beat.equal?(bb.valid_beats.last)
    puts beat
  elsif
    print "#{beat}, "
  end
end

user_list = gets.chomp!

bb.append(user_list)
# require 'pry';binding.pry

puts "Great! Now enter the speed to beatbox at. A range of 100-500 is a good start."

bb.rate = gets.chomp!.to_i

puts "Last, enter a Mac-based text-to-speech voice. A few fun options are Boing, Bubbles, Bahh, and Fred."

bb.voice = gets.chomp!

bb.play