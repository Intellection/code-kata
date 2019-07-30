require 'spec_helper'

describe "ParseDictionary#strip_words_we_hate" do
  funky_array = ["a", "ß", "a's", "adam", "aš"]
  subject {ParseDictionary.strip_words_we_hate(funky_array)}
  it { is_expected.to eq (["a", "adam"]) }
end

describe "ParseDictionary#parse_file" do
  file_path = "#{PROJECT_ROOT}/spec/test_file.txt"
  subject {ParseDictionary.parse_file(file_path)}
  it { is_expected.to eq (['A', 'AA', "OD",  "Do", 'Cat', 'tac', 'act', 'ACT']) }
end

describe "ParseDictionary#partition_by_length" do
  subject { ParseDictionary.partition_by_length(['a' ,'b', 'cc', 'dd']) }
  it do
    is_expected.to eq({
      1 => ['a', 'b'],
      2 => ['cc', 'dd']
    })
  end
end

describe "ParseDictionary#anagrams_within" do
  let(:words) { ["bill","libl","fred","defr","duck"] }
  subject { ParseDictionary.anagrams_within(words) }
  it do
    is_expected.to eq([
      ["bill","libl"],
      ["fred","defr"]
    ])
  end

  context "When there are capital letters" do
    let(:words) {["Bill","libL","Fred","defr","duCk"]}

    it do
      is_expected.to eq([
        ["Bill","libL"],
        ["Fred","defr"]
      ])
    end
  end
end

describe "ParseDictionary#print_anagrams" do
  let(:anagrams) do
    [
      ["bill","libl"],
      ["fred","defr"]
    ]
  end
  subject { ParseDictionary.print_anagrams(anagrams) }
  it do
    expect { subject }.to output("bill libl\nfred defr\n").to_stdout
  end
end

describe "ParseDictionary#main" do
  file_path = "#{PROJECT_ROOT}/spec/test_file.txt"
  subject {ParseDictionary.main(file_path)}
  it do
    expect { subject }.to output("OD Do\nCat tac act ACT\n").to_stdout
  end
end
