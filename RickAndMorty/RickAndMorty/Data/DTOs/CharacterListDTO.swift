import Foundation

struct CharacterListDTO: Decodable {
    let info: Info
    let results: [CharacterDTO]
    
    struct Info: Decodable {
        let count: Int
        let pages: Int
    }
}
