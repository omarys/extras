def get_count(sentence):
    vowels = ["a", "e", "i", "o", "u"]
    count = 0
    for c in sentence:
        if c in vowels:
            count += 1
    return count


def clever_get_count(sentence):
    return sum(c in "aeiou" for c in sentence)
