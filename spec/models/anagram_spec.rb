require 'rails_helper'

words = %w[ola tabata uloap alo batata paulo].sample

RSpec.describe "Anagram", type: :model do

  before :each do
    @anagram = Anagram.new
  end

  it "returns a Anagram object" do
    @anagram.should be_an_instance_of Anagram
  end

  it "is a true result" do
    @anagram.word1 = "este"
    @anagram.word2 = "sete"
    @anagram.check.should eql true
  end

  it "is a false result" do
    @anagram.word1 = "teste"
    @anagram.word2 = "errado"
    @anagram.check.should eql false
  end

  it "is valid with valid attributes"do
    anagram = build(:anagram, word1: words, word2: words)
    expect(anagram).to be_valid
  end

  it "is not valid without a word1" do
    anagram = build(:anagram, word1: '', word2: words)
    expect(anagram).to_not be_valid
  end

  it "is not valid without a word2" do
    anagram = build(:anagram, word1: words, word2: '')
    expect(anagram).to_not be_valid
  end

end