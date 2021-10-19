

desc "Run the tests in the spec/ directory."
task :test do
  sh "rspec spec/*"
end


namespace "gem" do

  desc 'Validates that the version number is appropriately set (v=X.X)'
  task :validate_version do
    if ENV['v'].nil? or not ENV['v'].match(/^\d+[\.\d+]+$/)
      raise "Error: the task requires a version number (set with 'v=X.X')."
    end
  end

  desc "Builds the .gemspec file."
  task :spec => %w[validate_version] do
    # Expect ARGV to be the version number

    gemspec = File.new("rgene.gemspec", "w")
    gemspec.puts "Gem::Specification.new do |s|"
    gemspec.puts "  s.name        = 'rgene'"
    gemspec.puts "  s.version     = '#{ENV['v']}'"
    gemspec.puts "  s.executables << 'rgene'"
    gemspec.puts "  s.licenses    = ['MIT']"
    gemspec.puts "  s.summary     = 'Generate project templates easily.'"
    gemspec.puts "  s.authors     = ['Eric Power']"
    gemspec.puts "  s.email       = 'ericpower@outlook.com'"
    gemspec.puts "  s.required_ruby_version = '>= 2.6'"
    gemspec.puts "  s.files       = Dir['src/*.rb'] + Dir['src/lib/*.rb'] + Dir['src/assets/*']"
    gemspec.puts "  s.homepage    = 'https://github.com/epwr/rgene'"
    gemspec.puts "  s.add_development_dependency 'rake', '~>13'"
    gemspec.puts "  s.add_development_dependency 'rspec', '~>3'"
    gemspec.puts "end"
    gemspec.close
  end

  desc "builds a gem based on the gemspec."
  task :build do
    sh "gem build rgene.gemspec"
  end

  desc "installs the gem locally"
  task :install => %w[validate_version] do
    sh "sudo gem install rgene-#{ENV['v']}.gem"
  end

  desc "pushes a gem to rubygems.org"
  task :push => %w[validate_version] do
    sh "gem push rgene-#{ENV['v']}.gem"
  end

  desc "Cleans up the .gem files."
  task :clean do
    Dir['*.gem'].each { |file|
      sh "rm " + file
    }
  end

end
