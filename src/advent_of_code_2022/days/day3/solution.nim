import ../../utils
import std/sequtils
import std/sets
import itertools


func cost(c: char): int =
    case c
    of 'a'..'z': ord(c) - ord('a') + 1
    of 'A'..'Z': ord(c) - ord('A') + 1 + 26
    else: raise


func part1(input: string): int =
    func pick(s: string): char =
        let n = s.len
        let a = s[0 ..< n div 2].toHashSet
        let b = s[n div 2 ..< n].toHashSet
        var rv = a * b
        rv.pop

    input.lines.mapIt(it.pick.cost).sum


func part2(input: string): int =
    func pick(xs: seq[string]): char =
        let a = xs[0].toHashSet
        let b = xs[1].toHashSet
        let c = xs[2].toHashSet
        var rv = a * b * c
        rv.pop

    input.lines.chunked(3).toSeq.mapIt(it.pick.cost).sum


test(part1, "example", 157)
test(part1, "input", 7568)
test(part2, "example", 70)
test(part2, "input", 2780)
