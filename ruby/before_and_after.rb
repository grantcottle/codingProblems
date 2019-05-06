# Complete the 'generate_phrases' function below.
#
# The function is expected to return a STRING_ARRAY.
# The function accepts STRING_ARRAY phrases as parameter.
# steps:
# 1 create a hash first and last
# 2 
require 'pp'
word_hash = {}

def generate_phrases(phrases, word_hash)
    # phrase_parts = phrases.map {|phrase| phrase_split(phrase) }
    phrases.each do |phrase|
        word_hash = phrase_split(phrase, word_hash)
    end
    word_hash.each do |k, v|
        next if v[0].empty? || v[1].empty?
        v[0].each do |phrase_start|
            v[1].each do |phrase_end|
                puts combine(phrase_start,phrase_end)
            end
        end
    end
end

def phrase_split(phrase, word_hash)
    words = phrase.split
    w1 = words.first
    w2 = words.last
    if word_hash[w1]
      word_hash[w1][1] << phrase
    else
        word_hash[w1] = [[], [phrase]]
    end
    if word_hash[w2]
        word_hash[w2][0] << phrase
    else
        word_hash[w2] = [[phrase], []]
    end
    word_hash
end


def match?(phrase_1, phrase_2)
    phrase_1.split.last.eql?(phrase_2.split.first)
end

def combine(phrase_1, phrase_2)
    phrase_1 + " "+ phrase_2.split[1..-1].join(' ')
end

input = [
    'mission statement',
    'a quick bite to eat',
    'a chip off the old block',
    'chocolate bar',
    'mission impossible',
    'a man on a mission',
    'block party',
    'eat my words',
    'bar of soap'
]

generate_phrases(input, word_hash)