import std/[sequtils, strscans]
import ../../utils


type
    Range = tuple[low: int, high: int] # low <= high

func parse(s: string): tuple[a: Range, b: Range] =
    var al, ah, bl, bh: int
    if s.scanf("$i-$i,$i-$i", al, ah, bl, bh):
        (a: (low: al, high: ah), b: (low: bl, high: bh))
    else: raise

func includes(a: Range, b: Range): bool =
    a.low <= b.low and b.high <= a.high

func overlaps(a: Range, b: Range): bool =
    a.low <= b.high and b.low <= a.high


proc part1(input: string): int =
    input.lines.map(parse).countIt(it.a.includes(it.b) or it.b.includes(it.a))


proc part2(input: string): int =
    input.lines.map(parse).countIt(overlaps(it.a, it.b))


test(part1, "example", 2)
test(part1, "input", 450)
test(part2, "example", 4)
test(part2, "input", 837)
