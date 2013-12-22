require "rouge"

module Present
  class Line
    attr_accessor :columns, :ext, :max, :text
    def initialize(text, ext, max=nil)
      self.text = text
      self.columns = `tput cols`.to_i
      self.ext = ext
      self.max = max
    end

    def output
      lexer = Rouge::Lexer.find(ext)
      if max && lexer != Rouge::Lexers::Markdown
        spacing = ((columns / 2) - (max.size * 2.5))
      else
        spacing = ((columns / 2) - (text.size / 2))
      end
      formatter = Rouge::Formatters::Terminal256.new
      text = formatter.format(lexer.lex(self.text))
      printf ' ' * spacing
      printf text + "\n"
    end
  end
end
