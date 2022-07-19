//
//  UserStorage.swift
//  Anniversary
//
//  Created by J on 2022/07/19.
//

import UIKit

// 나중에 더 알아봐야할듯....아직은 못씀
// T는 제네릭으로 타입에 제한을 두지 않는 코드를 사용할 때 쓴다. <>와 함께 사용하며 Type Parameter라고 부른다.
@propertyWrapper
struct UserDefault<T> {
    
    private var key: [String]
    private var keyCount = 0
    private var defaultValue: T
    
    public var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: self.key[keyCount]) as? T ?? self.defaultValue}
        set { UserDefaults.standard.set(newValue, forKey: self.key[keyCount])
            keyCount += 1
        }
    }
    
    init(key: [String], keyCount: Int, defaultValue: T) {
        self.key = key
        self.keyCount = keyCount
        self.defaultValue = defaultValue
    }
}
