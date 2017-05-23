//
//  List.swift
//  HoneyDew
//
//  Created by TJ Usiyan on 2017/05/22.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct List {
    let title: String

    init(title: String) {
        self.title = title
    }
}

extension List {

    init?(dict: [String: Any]) {
        guard let title = dict[Constants.ListFields.title] as? String else {
            return nil
        }

        self.init(title: title)
    }

    init?(tuple: (String, dict: [String: Any])) {
        guard let title = tuple.dict[Constants.ListFields.title] as? String else {
            return nil
        }

        self.init(title: title)
    }

    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any] else {
            return nil
        }

        self.init(dict: dict)
    }

    static func array(snapshot: DataSnapshot) -> [List]? {
        guard let dictDict = snapshot.value as? [String: [String : Any]],
            let back = { () -> [List]? in dictDict.flatMap(List.init(tuple:)) }() ,
            back.count == dictDict.count else {
                return nil
        }

        return back
    }

    var dictionaryRepresentation: [String: Any] {
        return [
            Constants.ListFields.title : title
        ]
    }
}
