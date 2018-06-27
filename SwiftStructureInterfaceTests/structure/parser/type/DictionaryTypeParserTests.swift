import XCTest
@testable import SwiftStructureInterface

class DictionaryTypeParserTests: XCTestCase, TypeParserTests {

    // MARK: - Dictionary

    func test_parse_shouldParseDictionary() {
        assertTypeText("[A:B]", "[A:B]")
    }

    func test_parse_shouldParseDictionaryWithNestedTypes() {
        assertTypeText("[A.B.C:D.E.F]", "[A.B.C:D.E.F]")
    }

    func test_parse_shouldParseDictionaryWithGenericTypes() {
        assertTypeText("[Generic<Int>:Generic<Int>]", "[Generic<Int>:Generic<Int>]")
    }

    func test_parse_shouldParseDictionaryWithArray() {
        assertTypeText("[[Int]:[String]]", "[[Int]:[String]]")
    }

    func test_parse_shouldParseWhitespace() {
        assertTypeText("[ Int : String ]", "[ Int : String ]")
        assertTypeText("[ [ Int : Int ] : [ String : Int ] ]", "[ [ Int : Int ] : [ String : Int ] ]")
    }

    func test_parse_shouldParseDictionaryElement() throws {
        let text = "[Int:String]"
        let type = try parseDictionaryType(text)
        assertElementText(type, text)
        let key = type.keyType
        assertElementText(key, "Int")
        let value = type.valueType
        assertElementText(value, "String")
    }
}