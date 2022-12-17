import std/[sequtils, setutils]
import itertools
import ../../utils


func priority(c: char): int =
    case c
    of 'a'..'z': ord(c) - ord('a') + 1
    of 'A'..'Z': ord(c) - ord('A') + 1 + 26
    else: raise


func part1(input: string): int =
    func pick(s: string): char =
        let n = s.len
        let a = s[0 ..< n div 2].toSet
        let b = s[n div 2 ..< n].toSet
        (a * b).peek

    input.lines.mapIt(it.pick.priority).sum


func part2(input: string): int =
    func pick(xs: seq[string]): char =
        let a = xs[0].toSet
        let b = xs[1].toSet
        let c = xs[2].toSet
        (a * b * c).peek

    input.lines.chunked(3).toSeq.mapIt(it.pick.priority).sum


test(part1, "example", 157)
test(part1, "input", 7568)
test(part2, "example", 70)
test(part2, "input", 2780)
