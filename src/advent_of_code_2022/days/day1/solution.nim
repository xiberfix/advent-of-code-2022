import std/[sequtils, strutils, algorithm]
import ../../utils


func part1(input: string): int =
    let totals = input.blocks.mapIt(it.lines.map(parseInt).sum).sorted
    totals[^1]


func part2(input: string): int =
    let totals = input.blocks.mapIt(it.lines.map(parseInt).sum).sorted
    totals[^1] + totals[^2] + totals[^3]


test(part1, "example", 24000)
test(part1, "input", 72478)
test(part2, "example", 45000)
test(part2, "input", 210367)
