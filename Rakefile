require "erubis"

desc "Renders ERB templates to Objective-C source files"
task :populate do
  types = %w{String Number Value Array Object}

  %w{Map Select}.each do |category|
    file = "NSArray+#{category}"

    %w{h m}.each do |ext|
      input = File.read("meta/#{file}.#{ext}.erb")
      eruby = Erubis::Eruby.new(input)
      File.open(File.join("Objective-Linq", "#{file}.#{ext}"), "w").write(eruby.result(:types => types))
    end
  end
  
  puts "Source populated."
end

desc "Clears generated files out of the Xcode project directory"
task :nuke do
  FileUtils.rm_r(Dir.glob(File.join("Objective-Linq", "*.{h,m}")))
  puts "Generated files nuked."
end

desc "Compiles the Objective-C library"
task :compile do
  output = %x{xcodebuild -project Objective-Linq.xcodeproj}
  if output.include?("** BUILD SUCCEEDED **")
    puts "Build succeeded."
  else
    puts "Failed to compile:"
    puts output
  end
end