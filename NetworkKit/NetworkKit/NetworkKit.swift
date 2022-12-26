//
//  NetworkKit.swift
//  NetworkKit
//
//  Created by 핏투비 on 2022/12/22.
//

import Foundation

public class NetworkKitImp {
    public init() {}
    
    public func get<T: Decodable>(url: URL) async throws -> T {
        let (data, res) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
