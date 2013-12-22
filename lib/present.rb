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
          vertical_spacer
          filename = "#{ directory }/#{ file }"
          words = File.read(filename)
          if words.empty?
            puts "Skipping #{ filename }. Blank slide."
          else
            Present::Slide.new(words, filename).process
            vertical_spacer
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

      def vertical_spacer
        rows = `tput lines`
        (rows.to_i / 2).times do |r|
          puts
        end
      end
    end
  end
end
