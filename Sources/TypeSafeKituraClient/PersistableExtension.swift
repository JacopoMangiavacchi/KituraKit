/*
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific langua›ge governing permissions and
 * limitations under the License.
 */

import Foundation
import Models

let client = Client(baseURL: "http://localhost:8080")

extension Persistable {

    // setup name space based on name of model (eg. User -> user(s))
    static var modelType: String {
        let kind = String(describing: Swift.type(of: self))
        return String(kind.characters.dropLast(5))
    }
	static var routeSingular: String { return "/\(modelType.lowercased())" }
    static var routePlural: String { return "\(routeSingular)s" }

    // create
    static func create(model: Model, respondWith: @escaping (Model?) -> Void) {
        client.post(routePlural, data: model) { (model: Model?) -> Void in
           respondWith(model)
        }
    }

/*
    // read
    static func read(id: I, respondWith: @escaping (Model) -> Void) {
        // Perform get REST call...
        client.get("/\(plural)", identifier: id) { (model: Model?) -> Void in
            guard let model = model else {
                return
            }
            return model
        }
    }

    // read all
    static func read(respondWith: @escaping (Model) -> Void) {
        // Perform get REST call...
        client.get("/\(plural)") { (model: [Model]?) -> Void in
            guard let model = model else {
                return
            }
            return model
        }
    }

    // update
    static func update(id: I, model: Model, respondWith: @escaping (Model) -> Void) {
        // Perform put REST call...
        client.put("/\(plural)", identifier: id, data: model) { (model: Model?) -> Void in
            guard let model = model else {
                return
            }
            return model
        }
    }

    // delete
    static func delete(id: I, respondWith: @escaping () -> Void) {
        // Perform delete REST call...
        client.delete("/\(plural)", identifier: id) { () -> Void in

        }
    }

    // delete all
    static func delete(respondWith: @escaping () -> Void) {
        // Perform delete REST call...
        client.delete("/\(plural)") { () -> Void in

        }
    }
    */

}

