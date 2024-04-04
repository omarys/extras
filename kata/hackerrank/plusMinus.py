#!/bin/python3
def plusMinus(arr):
    pos, z, neg = 0, 0, 0
    for element in arr:
        if element < 0:
            neg += 1
        elif element > 0:
            pos += 1
        else:
            z += 1
    print(pos / len(arr))
    print(neg / len(arr))
    print(z / len(arr))


if __name__ == "__main__":
    n = int(input().strip())
    arr = list(map(int, input().rstrip().split()))
    plusMinus(arr)
