import std/strformat
import std/os


func row[T](solution: string, file: string, value: T, expected: T): string =
    let status = value == expected
    let icon = if status: "✅" else: "❌"
    result = fmt"{icon} {solution} {file:10} {value:20}"
    if not status:
        result = result & fmt" {expected:20}"


template test*[T](solution: proc(input: string): T, file: string, expected: T) =
    const modulePath = instantiationInfo(fullPaths = true).filename
    const baseDir = splitFile(modulePath).dir
    const input = staticRead(baseDir / file & ".txt")

    let value = solution(input)
    echo row(astToStr(solution), file, value, expected)
