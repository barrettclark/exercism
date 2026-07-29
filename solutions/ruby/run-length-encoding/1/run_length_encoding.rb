module BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def self.decode(str)
    matches = str.scan(/(\d*)(.)/)
    decoded = matches.map do |count, element|
      count = count == "" ? 1 : count.to_i
      element * count
    end
    decoded.join("")
  end

  def self.encode(str)
    elements = str.chars
    encoded  = ""
    count    = 1
    elements.each_with_index do |element, idx|
      if idx > 0
        previous_element = elements[idx-1]
        if previous_element != element
          encoded << count.to_s if count > 1
          encoded << previous_element
          encoded << element if idx == elements.count-1
          count = 1
        elsif idx == elements.count-1
          count += 1
          encoded << "#{count}#{element}"
        else
          count += 1
        end
      end
    end
    return encoded
  end
end