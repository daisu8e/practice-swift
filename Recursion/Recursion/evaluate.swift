import Foundation

/**
 *
 * Write a recursive function evaluate that accepts a string
 * representing a math expression and computes its value.
 * - The expression will be "fully parenthesized" and will
 *   consist of + and * on single-digit integers only.
 * - You can use a helper function. (Do not change the original function header)
 * - Recursion
 *
 * evaluate("7")                 -> 7
 * evaluate("(2+2)")             -> 4
 * evaluate("(1+(2*4))")         -> 9
 * evaluate("((1+3)+((1+2)*5))") -> 19
 *
 */
func evaluate(_ expr: String) -> Int {
  if isNumber(expr) { return Int(expr)! }

  var p1 = "", n1 = "", op = "", n2 = "", p2 = ""
  for (i, v) in expr.characters.map({ String($0) }).enumerated() {
    if isStartParenthesize(v) {
      p1 = v
      n1 = ""
      op = ""
      n2 = ""
      p2 = ""

    } else if op.isEmpty && isNumber(v) {
      n1.append(v)

    } else if isOperator(v) {
      op = v

    } else if !op.isEmpty && isNumber(v) {
      n2.append(v)

    } else if isEndParenthesize(v) {
      p2 = v
    }

    if p1.isEmpty || n1.isEmpty || op.isEmpty || n2.isEmpty || p2.isEmpty { continue }

    var result = 0
    if isAdditionOperator(op) { result = add(n1, n2) }
    else if isMultiplicationOperator(op) { result = multiply(n1, n2) }
    return evaluate(expr.replacingCharacters(in: expr.range(of: p1 + n1 + op + n2 + p2)!, with: String(result)))
  }

  return 0
}

func isStartParenthesize(_ parenthesize: String) -> Bool {
  return parenthesize == "("
}

func isEndParenthesize(_ parenthesize: String) -> Bool {
  return parenthesize == ")"
}

func isNumber(_ number: String) -> Bool {
  return Int(number) != nil
}

func isOperator(_ op: String) -> Bool {
  return isAdditionOperator(op) || isMultiplicationOperator(op)
}

func isAdditionOperator(_ op: String) -> Bool {
  return op == "+"
}

func isMultiplicationOperator(_ op: String) -> Bool {
  return op == "*"
}

func add(_ a: String, _ b: String) -> Int {
  return (Int(a) ?? 0) + (Int(b) ?? 0)
}

func multiply(_ a: String, _ b: String) -> Int {
  return (Int(a) ?? 0) * (Int(b) ?? 0)
}
