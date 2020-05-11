require 'rails_helper'

RSpec.describe "Anagrams", type: :request do

    describe "GET /anagrams" do
        it '"returns success status"' do
            get anagrams_path
            expect(response).to have_http_status(200)  
        end  
    end

    describe "GET /anagrams" do 
        it "the anagrams are presents" do
            anagrams = create(:anagram)
            get anagrams_path do |anagram|
                expect(response.body).to inclue(anagram.word1, anagram.word2, anagram.result)
            end
        end
    end

    describe "POST  /anagrams" do
        context "when it has valid parameters" do
            it "creates the anagram with correct attributes" do
                anagram_attributes = FactoryBot.attributes_for( :anagram )
                post anagrams_path, params: { anagram: anagram_attributes }
                expect(Anagram.last).to have_attributes(anagram_attributes)
            end
        end

    
        context "when it has no valid parameters" do
            it "does not create an valid anagram" do
                expect{
                    post anagrams_path, params: { anagram: {word1: '', word2: '', result: ''}}
            }.to_not change(Anagram, :count)
            end
        end
    end 
end

