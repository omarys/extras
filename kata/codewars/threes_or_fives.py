def solution(number):
    mults = []
    for x in range(3, number, 3):
        mults.append(x)
    for y in range(5, number, 5):
        mults.append(y)
    return sum(set(mults))
