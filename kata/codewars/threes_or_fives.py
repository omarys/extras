def solution(number):
    multiples_of_three = set(range(3, number, 3))
    multiples_of_five = set(range(5, number, 5))
    return sum(multiples_of_three | multiples_of_five)
