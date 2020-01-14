class Enigma

  def encrypt_message(message, key, date)
    alphabet = ("a".."z").to_a << " "
    # shift = Shift.new(key, date)
    shift_value = Shift.new(key,date).shift_key
    message = message.downcase.split(//)
    encrypt_message = []
    message.map do |let|
      if alphabet.include?(let)
        # require "pry"; binding.pry
        new_let = alphabet.rotate(alphabet.index(let) + shift_value[0])
        encrypt_message << new_let[0]
        shift_value.rotate!
        # require "pry"; binding.pry
      else
        encrypt_message << let
      end
    end
    encrypt_message.join
  end

  def encrypt(message, key, date)
    
  end

  def decrypt(ciphertext, key, date)

  end
end
