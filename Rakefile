require "erubis"

desc "Render ERB templates to Objective-C source files in the 'dist' directory"
task :populate do
  Dir.entries(File.join(Dir.pwd, "src")).each do |e|
    path = File.join(Dir.pwd, "src", e)

    unless File.basename(path).match /\.|\.\./
      FileUtils.cp_r(path, File.join(Dir.pwd, "dist", File.basename(e)))
    end
  end

  types = %w{String Number Value Array Object}

  %w{Map Select}.each do |category|
    file = "NSArray+#{category}"

    %w{h m}.each do |ext|
      input = File.read("meta/#{file}.#{ext}.erb")
      eruby = Erubis::Eruby.new(input)
      File.open(File.join("dist", "#{file}.#{ext}"), "w").write(eruby.result(:types => types))
    end
  end
end