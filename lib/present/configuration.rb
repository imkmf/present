require "yaml"

module Present
  class Configuration
    attr_accessor :config, :directory
    def initialize(directory)
      self.directory = directory
      if File.exist?("#{ directory }/_config.yml")
        self.config = YAML.load_file("#{ directory }/_config.yml")
      end
    end

    def sorted_directory
      if self.sort == "alpha"
        slides = Dir.entries(directory)
      elsif self.sort == "created_at"
        slides = Dir.entries(directory).sort_by { |c| File.stat(directory+c).ctime }
      elsif self.sort == "modified_at"
        slides = Dir.entries(directory).sort_by { |c| File.stat(directory+c).mtime }.reverse!
      end
      slides.delete_if { |file| file.match(/^(\.|\.\.|_.*)$/) }
    end

    def method_missing(m, *args, &block)
      self.config["#{m}"]
    end
  end
end
