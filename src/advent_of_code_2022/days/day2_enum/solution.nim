import ../../utils
import std/sequtils
import fusion/matching

{.experimental: "caseStmtMacros".}


type
    Piece = enum Rock, Paper, Scissors
    Result = enum Loss, Draw, Win

func play(opp: Piece, me: Piece): Result =
    case (opp, me)
    of (Scissors, Rock), (Rock, Paper), (Paper, Scissors): Win
    of (Rock, Scissors), (Paper, Rock), (Scissors, Paper): Loss
    else: Draw

func pick(opp: Piece, r: Result): Piece =
    case (opp, r)
    of (Rock, Draw), (Paper, Loss), (Scissors, Win ): Rock
    of (Rock, Win ), (Paper, Draw), (Scissors, Loss): Paper
    of (Rock, Loss), (Paper, Win ), (Scissors, Draw): Scissors
    else: raise

func score(x: Piece): int =
    case x
    of Rock: 1
    of Paper: 2
    of Scissors: 3

func score(x: Result): int =
    case x
    of Loss: 0
    of Draw: 3
    of Win: 6

func parsePiece(s: char): Piece =
    case s
    of 'A', 'X': Rock
    of 'B', 'Y': Paper
    of 'C', 'Z': Scissors
    else: raise

func parseResult(s: char): Result =
    case s
    of 'X': Loss
    of 'Y': Draw
    of 'Z': Win
    else: raise


func part1(input: string): int =
    func parse(s: string): auto = (opp: parsePiece(s[0]), me: parsePiece(s[2]))
    input.lines.map(parse).mapIt(score(play(it.opp, it.me)) + score(it.me)).sum


func part2(input: string): int =
    func parse(s: string): auto = (opp: parsePiece(s[0]), r: parseResult(s[2]))
    input.lines.map(parse).mapIt(score(it.r) + score(pick(it.opp, it.r))).sum


test(part1, "example", 15)
test(part1, "input", 12679)
test(part2, "example", 12)
test(part2, "input", 14470)
