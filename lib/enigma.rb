class Enigma

  def encrypt(message, key = (Array.new(5) {rand(0..9)}), date = Time.now.strftime("%d%m%y")) #set default for key and date in this class
    alphabet = ("a".."z").to_a << " "
    shift_value = Shift.new(key,date).shift_key
    message = message.downcase.split(//)
    encrypt_message = []
    message.map do |let|
      if alphabet.include?(let)
        new_let = alphabet.rotate(alphabet.index(let) + shift_value[0])
        encrypt_message << new_let[0]
        shift_value.rotate!
      else
        encrypt_message << let
      end
    end
    encryption_key = {}
    encryption_key[:key] = key
    encryption_key[:date] = date
    encryption_key[:encryption] = encrypt_message.join
    encryption_key
  end

  def decrypt(ciphertext, key, date)
    alphabet = ("a".."z").to_a << " "
    shift_value = Shift.new(key,date).shift_key
    ciphertext = ciphertext.downcase.split(//)
    decrypt_message = []
    ciphertext.map do |let|
      if alphabet.include?(let)
        new_let = alphabet.rotate(alphabet.index(let) - shift_value[0])
        decrypt_message << new_let[0]
        shift_value.rotate!
      else
        decrypt_message << let
      end
    end
    decryption_key = {}
    decryption_key[:key] = key
    decryption_key[:date] = date
    decryption_key[:decryption] = decrypt_message.join
    decryption_key
  end
end
