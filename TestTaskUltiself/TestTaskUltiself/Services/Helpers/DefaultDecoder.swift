//
//  DefaultDecoder.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Foundation

class DefaultDecoder {
    class func decodeObject<T: Decodable>(type: T.Type, data: Data) -> Result<T, Error> {
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: data)
            return .success(object)
        } catch let error {
            print("Decoding Error: ", error)
            return .failure(defaultError)
        }
    }

    static private var defaultError: DecodingError {
        .decodingFailure(message: "Undefined Decoding Error")
    }
}
