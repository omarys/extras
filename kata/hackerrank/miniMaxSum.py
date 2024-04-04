#!/usr/bin/env python3
def miniMaxSum(arr):
    arr.sort()
    mini = sum(arr[:4])
    arr.sort(reverse=True)
    max = sum(arr[:4])
    print(f"{mini} {max}")


if __name__ == "__main__":
    arr = list(map(int, input().rstrip().split()))
    miniMaxSum(arr)
