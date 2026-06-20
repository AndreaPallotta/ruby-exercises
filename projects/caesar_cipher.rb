LETTERS = ("a".."z").to_a

def rotate(char, n)
  return char unless char.between?('A', 'Z') || char.between?('a', 'z')

  base = char.between?('A', 'Z') ? 'A'.ord : 'a'.ord
  (base + (char.ord - base + n) % 26).chr
end

def caesar_cipher(string, n)
  string.chars.map { |char| rotate(char, n) }.join
end

cipher = caesar_cipher("What a string!", 5)
puts cipher
