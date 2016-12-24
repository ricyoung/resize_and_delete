require 'rmagick'
# list directory
Dir.foreach(".") do |d|
  next if !File.directory?(d)
  next if d=="."
  next if d==".."
  Dir.chdir(d)
  puts d
  #transver in to each directory
  pics = Dir.glob('*.jpg')
  puts (pics)
  pic_count = pics.size
  pic_random = pics.shuffle
  puts (pic_count)
  puts (pic_random)

  remove = pic_count - 20
  remove.times do
    File.delete(pic_random[0])
    pic_random.delete_at(0)
  end


  Dir.mkdir("thumbnails")
  Dir.mkdir("photos")
  pic_random.each_with_index do |f,i|
    name = "%.2d.jpg" % (i+1)
#image magic read into IM
    image = Magick::Image.read(f).first
    image.auto_orient!
#resize full size
    image.resize_to_fit!(1600,1600)
    image.write("photos/"+name) { self.quality = 80 }
#resize thumbs
    image.resize_to_fit!(300,300)
    image.write("thumbnails/"+name) { self.quality = 75 }
#delete file
    File.delete f
  end
  ##create photos
  Dir.chdir("..")
end
