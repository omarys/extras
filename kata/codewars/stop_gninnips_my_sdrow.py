def spin_words(sentence):
    spun = []
    for word in sentence.split():
        if len(word) > 4:
            spun.append(word[::-1])
        else:
            spun.append(word)
    return " ".join(spun)


def one_liner_spin_words(sentence):
    return " ".join(
        [word[::-1] if len(word) > 4 else word for word in sentence.split(" ")]
    )
