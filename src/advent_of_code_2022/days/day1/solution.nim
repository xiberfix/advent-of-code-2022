import ../../utils
import std/sequtils
import std/strutils
import std/algorithm


func part1(input: string): int =
    var totals = input.blocks.mapIt(it.lines.map(parseInt).sum)
    totals.max


func part2(input: string): int =
    var totals = input.blocks.mapIt(it.lines.map(parseInt).sum)
    totals.sort()
    totals[^1] + totals[^2] + totals[^3]


test(part1, "example", 24000)
test(part1, "input", 72478)
test(part2, "example", 45000)
test(part2, "input", 210367)
