//
//  ReamlService.swift
//  Interview
//
//  Created by Kenneth Tse on 2025/4/26.
//

import Foundation
import RealmSwift

class RealmService {
    static let shared = RealmService()
    private let realm = try? Realm()
    
    // MARK: add
    func add(_ object: Object) {
        try? realm?.write({
            realm?.add(object)
        })
    }
    // MARK: read
    func readAll(type: Object.Type, filter: NSPredicate? = nil) -> Results<Object>? {
        guard let filter = filter else {
            return realm?.objects(type)
        }
        return realm?.objects(type).filter(filter)
    }
    func read(type: Object.Type, filter: NSPredicate? = nil) -> Results<Object>? {
        guard let filter = filter else {
            return realm?.objects(type)
        }
        return realm?.objects(type).filter(filter)
    }
    // MARK: update
    func update(_ block: () -> Void) {
        try? realm?.write({
            block()
        })
    }
    // MARK: delete
    func delete(_ object: Object) {
        try? realm?.write({
            realm?.delete(object)
        })
    }
    func deleteAll(type: Object.Type) {
        guard let objects = realm?.objects(type) else { return }
        try? realm?.write({
            realm?.delete(objects)
        })
    }
    
}
