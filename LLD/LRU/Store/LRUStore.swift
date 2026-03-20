//
//  LRUStore.swift
//  LLD
//
//  Created by Khanduri, Namrata on 026/11/25.
//

class Node<T> {
    let value: T
    let previous: Node<T>?
    let next: Node<T>?
    
    init(value: T, previous: Node<T>? = nil, next: Node<T>? = nil) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

protocol StoreProtocol {
    associatedtype Value
    func put(_ key: String, _ value: Value)
    func get(_ key: String) -> Value?
}

class Store<T: Node<U>, U>: StoreProtocol {
    
    var database: Database<T> = Database()
    var keys: [String] = []
    
    func put(_ key: String, _ value: T) {
        keys.append(key)
        database.data[key] = value
    }
    
    func get(_ key: String) -> T? {
        return database.data[key]
    }
    
    func delete(_ key: String) {
        database.data.removeValue(forKey: key)
    }
    
}

struct Database<T> {
   
    var data: [String: T] = [:]
    
}

class LRUCache<S: StoreProtocol> {
    var store: S
    var head: S.Value?
    var tail: S.Value?
    
    
    
    
    init(store: S) {
        self.store = store
    }
    
    func put(_ key: String, _ value: S.Value) {
        store.put(key, value)
    }
    
    func getValue(_ key: String) -> S.Value? {
        store.get(key)
    }
}






class StoreManager<S: StoreProtocol> {
    var store: S
    var head: S.Value?
    
    
    init(store: S) {
        self.store = store
    }
    
    func put(_ key: String, _ value: S.Value) {
        store.put(key, value)
    }
    
    func getValue(_ key: String) -> S.Value? {
        store.get(key)
    }
}



class A {
    
    func abc() {
        
        let store: Store<Node<String>, String> = Store()
        let storeManager = StoreManager(store: store)
        
        
        
    }
    
    
}
