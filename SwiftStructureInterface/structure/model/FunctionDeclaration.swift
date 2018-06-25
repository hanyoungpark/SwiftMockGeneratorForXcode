public protocol FunctionDeclaration: NamedElement, Declarations {
    var genericParameterClause: GenericParameterClause? { get }
    var parameterClause: ParameterClause { get }
    var returnType: Element? { get }
    var declarations: [Element] { get }
}
