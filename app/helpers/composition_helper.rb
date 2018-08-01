module CompositionHelper
  def cut_off_at(text, n)
    if n < text.length
      text[0...n] + "...."
    else
      text
    end
  end
end
