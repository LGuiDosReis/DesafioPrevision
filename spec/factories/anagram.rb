FactoryBot.define do
    factory :anagram do
        word1 { %w[alo batata paulo].sample }
        word2 { %w[ola tabata uloap].sample }
    end
end 