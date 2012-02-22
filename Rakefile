require "erubis"

desc "Render ERB templates to Objective-C source files in the 'dist' directory"
task :populate_dist do
  types = %w{String Number Value Array Object}

  %w{Map Select}.each do |category|
    file = "NSArray+#{category}"

    %w{h m}.each do |ext|
      input = File.read("meta/#{file}.#{ext}.erb")
      eruby = Erubis::Eruby.new(input)
      File.open(File.join("Objective-Linq", "#{file}.#{ext}"), "w").write(eruby.result(:types => types))
    end
  end
end

desc "Clears out the entire 'dist' directory (good for starting over)"
task :nuke_dist do
  FileUtils.rm_r(Dir.glob(File.join("dist", "*")))
end