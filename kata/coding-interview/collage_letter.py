def collage_letter(collage_letter: str, newspaper: str) -> bool:
    counts = {}                      # letter -> how many we still need
    for ch in collage_letter.lower():
        counts[ch] = counts.get(ch, 0) + 1   # collage needs it
    for ch in newspaper.lower():
        counts[ch] = counts.get(ch, 0) - 1   # newspaper gives it
    return max(counts.values()) <= 0         # nothing still needed


# ---------------------------------------------------------------------------
# Alternatives
# ---------------------------------------------------------------------------

# 1. collections.Counter — the same logic, less bookkeeping. Also O(n+m).
# from collections import Counter
# def collage_letter(collage_letter, newspaper):
#     return not Counter(collage_letter.lower()) - Counter(newspaper.lower())


# 2. Short-circuit greedy with early exit — stops as soon as any letter runs
#    out, so often faster on inputs that fail early. Still O(n+m) worst case.
# def collage_letter(collage_letter, newspaper):
#     available = {}
#     for ch in newspaper.lower():
#         available[ch] = available.get(ch, 0) + 1
#     for ch in collage_letter.lower():
#         if available.get(ch, 0) == 0:
#             return False
#         available[ch] -= 1
#     return True


# 3. Sort + two pointers — O(n log n); worse for large inputs but uses no
#    extra space. Kept for completeness, not speed.
# def collage_letter(collage_letter, newspaper):
#     a = sorted(collage_letter.lower())
#     b = sorted(newspaper.lower())
#     i = j = 0
#     while i < len(a) and j < len(b):
#         if a[i] == b[j]:
#             i += 1
#         j += 1
#     return i == len(a)
