def rps(p1, p2):
    if p1 == p2:
        return "Draw!"
    else:
        if p1 == "rock":
            return "Player 2 won!" if p2 == "paper" else "Player 1 won!"
        if p1 == "paper":
            return "Player 2 won!" if p2 == "scissors" else "Player 1 won!"
        if p1 == "scissors":
            return "Player 2 won!" if p2 == "rock" else "Player 1 won!"


def fancier_rps(p1, p2):
    beats = {"rock": "scissors", "scissors": "paper", "paper": "rock"}
    if beats[p1] == p2:
        return "Player 1 won!"
    if beats[p2] == p1:
        return "Player 2 won!"
    return "Draw!"


def fanciest_rps(p1, p2):
    hand = {"rock": 0, "paper": 1, "scissors": 2}
    results = ["Draw!", "Player 1 won!", "Player 2 won!"]
    return results[hand[p1] - hand[p2]]
