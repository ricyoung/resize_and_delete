# list directory
require 'fileutils'
Dir.foreach(".") do |d|
  next if !File.directory?(d)
  next if d=="."
  next if d==".."
  Dir.chdir(d)
  Dir.chdir("photos")
 
 # puts "directory name - " + d
  #renamer

  #clean up
  #transver in to each directory
  pics = Dir.glob('*.jpg')
  #puts (pics)
  pics = Dir.glob('*.jpg')
  #puts (pics)
  pic_count = pics.size
  
#  puts (pic_random)
  
  #pic_count - 26


if pic_count == 26
  x=x
else 
  puts "Total Pic Count " + (pic_count).to_s +  " directory name - " + d
   FileUtils.rm_rf('../../'+d)
  puts "delete" + d
end
      Dir.chdir("..")
        Dir.chdir("..")

  end
