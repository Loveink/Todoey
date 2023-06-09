//
//  AppDelegate.swift
//  Todoey
//
//  Created by Александра Савчук on 29.05.2023.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        migrate()
        migrate2()
    
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
                
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }

    func migrate(){
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                
                if oldSchemaVersion < 1 {
                    migration.enumerateObjects(ofType: Item.className()) { oldObject, newObject in
                        newObject?["dateCreated"] = Date()
                    }
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
    }
    
    func migrate2(){
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                
                if oldSchemaVersion < 2 {
                    migration.enumerateObjects(ofType: Category.className()) { oldObject, newObject in
                        newObject?["colour"] = String()
                    }
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
    }
}
