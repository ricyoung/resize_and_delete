#!/usr/bin/env ruby
require 'spreadsheet'
require 'fileutils'

models = Spreadsheet.open '/Users/ric/Desktop/code_renaming/all_content_list/ALL_PHOTOSET_Metadata.xls'
sheet1 = models.worksheet 0
#arr = sheet1
puts "loaded"


  Dir.foreach(".") do |d|
  next if !File.directory?(d)
  next if d=="."
  next if d==".."
  #Dir.chdir(d)



#find = "HCP0399"
find = d
sheet1.each do |row|  
    if row.include?(find)
 #       puts "found it" + row.to_s
         name = row[3]
         puts  "directory name - #{d} and her name is :" + name.to_s
         FileUtils.mv d, name.to_s + " - " +d, :verbose => true
         break # no more searching - speeds up function
   end
end
end
