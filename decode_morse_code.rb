def decode_char(morse_code)
  morse_dic = {
    '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E',
    '..-.' => 'F', '--.' => 'G', '....' => 'H', '..' => 'I', '.---' => 'J',
    '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N', '---' => 'O',
    '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S', '-' => 'T',
    '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y',
    '--..' => 'Z'
  }
  morse_dic[morse_code]
end

def decode_word(morse_word)
  string = ''
  splited_arr = morse_word.split
  splited_arr.each do |character|
    string += decode_char(character)
  end
  string
end

def decode_sentence(morse_sent)
  string = ''
  splited_arr = morse_sent.split('   ')
  splited_arr.each do |sentence|
    string += decode_word(sentence)
    string += ' '
  end
  string.strip
end

puts decode_char('.-')
puts decode_sentence('-- -.--   -. .- -- .')
puts decode_word('.-. ..- -... -.--')
puts decode_sentence('-.-. --- -.. .. -. --.   .-- .. - ....   .-. ..- -... -.--')
puts decode_sentence('.-. ..- -... -.--   .. ...   ..-. ..- -.')
