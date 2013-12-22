require 'present/line'

module Present
  class Slide
    attr_accessor :content, :ext
    def initialize(content, filename)
      self.content = content
      self.ext = filename.match(/\.(.*)/).to_a.last
    end

    def process
      lines = self.content.split("\n")
      if lines.size > 1
        lines.each do |line|
          Present::Line.new(line, ext).output
        end
      else
        Present::Line.new(self.content, ext).output
      end
    end
  end
end
