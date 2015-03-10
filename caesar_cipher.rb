class CaesarCipher
  
  def self.encrypt message, factor
    caesar_cipher message, factor
  end

  def self.decrypt message, factor
    caesar_cipher message, factor, :backward
  end

  private

  def self.caesar_cipher(message, factor, direction = :forward)
    raise ArgumentError unless message.is_a?(String) && factor.is_a?(Fixnum)
    message.split('').each_with_object('') do |letter, result|
      if letter.match /[a-zA-Z]/
        result << rotate(letter, factor, direction)
      else
        result << letter
      end
    end
  end

  def self.rotate(letter, factor, direction)
    result = letter
    factor.times do
      if direction == :backward
        result = previous_letter result
      else
        result = next_letter result
      end
    end
    result
  end

  def self.next_letter(letter)
    if letter == 'z'
      'a'
    elsif letter == 'Z'
      'A'
    else
      letter.next
    end
  end

  def self.previous_letter(letter)
    if letter == 'a'
      'z'
    elsif letter == 'A'
      'Z'
    else
      (letter.ord - 1).chr
    end
  end

end
