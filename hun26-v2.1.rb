require 'rmagick'
# list directory
Dir.foreach(".") do |d|
  next if !File.directory?(d)
  next if d=="."
  next if d==".."
  Dir.chdir(d)
  puts "directory name - " + d
  #renamer
Dir["**/*"].each {|r| File.rename(r, r.downcase)}
  #clean up
  #transver in to each directory
  pics = Dir.glob('*.jpg')
  #puts (pics)
  pic_count = pics.size
  pic_random = pics.shuffle
  puts "Total Pic Count " + (pic_count).to_s
#  puts (pic_random)
  puts "Directory Load Compete - Current Time " + Time.now.to_s
  remove = pic_count - 26
  remove.times do
    File.delete(pic_random[0])
    pic_random.delete_at(0)
  end

#


  Dir.mkdir("thumbnails")
  Dir.mkdir("photos")
#  pics = Dir.glob('*.jpg')

puts "resizing images and then removing them"
pic_random.each_with_index do |f,i|
  name = "%.2d.jpg" % (i+1)

#image magic read into IM
    image = Magick::Image.read(f).first
    image.auto_orient!
#resize full size
    image.resize_to_fit!(1600,2200)
    sharpen = image.sharpen(radius=0, sigma=1.0)
    sharpen.write("photos/"+name) { self.quality = 80 }
#resize thumbs
    image.resize_to_fit!(200,300)
    sharpen_small = image.sharpen(radius=0.0, sigma=1.0)
    sharpen_small.write("thumbnails/"+name) { self.quality = 80 }
    image.destroy!
#delete file

   File.delete f
#    File.delete('thumbs.db')
  end

  ##create photos
  puts "Jpg Processing Compete - Current Time : " + Time.now.to_s + "\n\n"
  Dir.chdir("..")
end
