import Foundation

private func code(withTitle: String, anothaFunc: () -> Void) {
print("""
___________________________________
Results for: '\(withTitle)'
""")
    anothaFunc()
}

code(withTitle: "Simplest closure ever.") {
    let sayHelloClosure = {
        print("Hello Closure")
    }
    sayHelloClosure()
}

code(withTitle: "Closures with parameters.", anothaFunc: {
    let sayHelloTo: (String) -> Void = {(name) in print("Bonjour pour mon ami \(name)")}
     sayHelloTo("Rick")
})

code(withTitle: "Closures that return value.", anothaFunc: {
    let sumClosure: (Int, Int) -> Int = {(a, b) in return a + b}
    let sumClosureAns = sumClosure(5, 6)
     print(sumClosureAns)
})

code(withTitle: "Closures as function parameters.") {
    func sayCapitalizedHello(for name: String, completion: (String) -> Void) {
        let capName = name.capitalized
        completion(capName)
    }
    sayCapitalizedHello(for: "rick dalton") {
        (result) in
        print(result)
    }
}

private func escapingClosure(title: String, completion: @escaping (String) -> Void) {
    print("______________________________")
    print(title)
    print("res")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        completion("res after 2 secs")
    }
}

escapingClosure(title: "Escaping closures.") { (response) in
    print(response)
}
