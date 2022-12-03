import ../../utils
import std/sequtils


func parsePiece(s: char): int =
    case s
    of 'A', 'X': 0 # Rock
    of 'B', 'Y': 1 # Paper
    of 'C', 'Z': 2 # Scissors
    else: raise

func parseResult(s: char): int =
    case s
    of 'X': 2 # Loss
    of 'Y': 0 # Draw
    of 'Z': 1 # Win
    else: raise

func play(opp: int, me: int): int = (me - opp + 3) mod 3
func pick(opp: int, r: int): int = (opp + r) mod 3

func scorePiece(x: int): int = x + 1
func scoreResult(x: int): int = (x + 1) mod 3 * 3


func part1(input: string): int =
    func parse(s: string): auto = (opp: parsePiece(s[0]), me: parsePiece(s[2]))
    input.lines.map(parse).mapIt(scoreResult(play(it.opp, it.me)) + scorePiece(it.me)).sum


func part2(input: string): int =
    func parse(s: string): auto = (opp: parsePiece(s[0]), r: parseResult(s[2]))
    input.lines.map(parse).mapIt(scoreResult(it.r) + scorePiece(pick(it.opp, it.r))).sum


test(part1, "example", 15)
test(part1, "input", 12679)
test(part2, "example", 12)
test(part2, "input", 14470)
