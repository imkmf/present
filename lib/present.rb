require "present/configuration"
require "present/slide"
require "present/version"

module Present
  module Presentation
    class << self
      def new(directory)
        config = Present::Configuration.new(directory)
        files = config.sorted_directory
        files.each do |file|
          filename = "#{ directory }/#{ file }"
          words = File.read(filename)
          if words.empty?
            puts "Skipping #{ filename }. Blank slide."
          else
            lines_size = words.split("\n").size
            vertical_spacer(lines_size)
            Present::Slide.new(words, filename).process
            vertical_spacer(lines_size)
            loop do
              sleep 0.1
              break if quit?
            end
          end
        end
      end

      def quit?
        begin
          # See if a 'Q' has been typed yet
          while c = STDIN.read_nonblock(1)
            return true if c != nil
          end
          # No 'Q' found
          false
        rescue Errno::EINTR
          false
        rescue Errno::EAGAIN
          false
        rescue EOFError
          true
        end
      end

      def vertical_spacer(lines)
        rows = `tput lines`.to_i
        if (rows / 2) < lines
          (lines / 2).times.map { puts }
        else
          (rows / 2).times.map { puts }
        end
      end
    end
  end
end
