require "erubis"

Dir.glob("lib/*.rb").each do |file|
  require file
end

desc "Renders ERB templates to Objective-C source files"
task :populate do
  types = {
    :ns => NSType.all,
    :numeric => PrimitiveType.all,
    :graphics => CGType.all
  }

  types[:all] = types.values.flatten

  Dir.glob(File.join("meta", "*.erb")).each do |f|
    input = File.read(f)
    eruby = Erubis::Eruby.new(input)
    File.open(File.join("Objective-Linq", File.basename(f).chomp(".erb")), "w").write(eruby.result(:types => types))
  end

  puts "Source populated."
end

desc "Clears generated files out of the Xcode project directory"
task :nuke do
  FileUtils.rm_r(Dir.glob(File.join("Objective-Linq", "*.{h,m}")))
  FileUtils.rm_r("build/")
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