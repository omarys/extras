def square_digits(num):
    digits = [int(a) for a in str(num)]
    squared = ''
    for digit in digits:
        squared += str(digit ** 2)
    return int(squared)

def oneliner_square_digits(num):
    return int(''.join(str(int(c)**2) for c in str(num)))
