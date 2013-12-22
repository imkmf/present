require "rouge"

module Present
  class Line
    attr_accessor :columns, :ext, :text
    def initialize(text, ext)
      self.text = text
      self.columns = `tput cols`.to_i
      self.ext = ext
    end

    def output
      spacing = ((columns / 2) - (text.size / 2))
      formatter = Rouge::Formatters::Terminal256.new
      lexer = Rouge::Lexer.find(ext)
      text = formatter.format(lexer.lex(self.text))
      printf ' ' * spacing
      printf text + "\n"
    end
  end
end
