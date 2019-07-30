class ParseDictionary
  def self.main(file_path)
    striped_words = parse_file(file_path)
    partitioned_words = partition_by_length(striped_words)
    count = 0
    partitioned_words.values.each do |partitioned_word|
      grouped_anagrams = anagrams_within(partitioned_word)
      count += grouped_anagrams.length
      print_anagrams(grouped_anagrams)
    end
    count
  end

  def self.print_anagrams(grouped_anagrams)
    grouped_anagrams.each do |anagrams|
      puts anagrams.join(' ')
    end
  end

  def self.anagrams_within(words)
    array = words.each_with_object({}) do |word, acc|
      sorted_word = word.downcase.chars.sort.join
      acc[sorted_word] ||= []
      acc[sorted_word] << word
    end.values
    select_anagrams(array)
  end

  def self.select_anagrams(anagrams)
    anagrams.select { |anagrams| anagrams.length > 1 }
  end

  def self.partition_by_length(words)
    words.each_with_object({}) do |word, acc|
      acc[word.length] ||= []
      acc[word.length] << word
    end
  end

  def self.parse_file(file_path)
    all_words = File.open(file_path, 'r:iso-8859-1').map(&:strip)
    strip_words_we_hate(all_words)
  end

  def self.strip_words_we_hate(words)
    words.select { |word| word.match(/^[a-zA-Z]*$/) }
  end
end
