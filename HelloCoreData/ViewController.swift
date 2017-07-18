//
//  ViewController.swift
//  HelloCoreData
//
//  Created by Lu Yu on 7/17/17.
//  Copyright © 2017 Lu Yu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func saveUser(_ sender: Any) {
        let user = User(context: managedObjectContext)
        user.firstName = "Bob"
        user.email = "Bob@bobmail.com"
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success!")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let users = [
            ["firstName": "John", "email": "john.blake@example.com"],
            ["firstName": "Rodney", "email": "rodney.roberts20@example.com"]
        ]
        users.forEach {
            user in
            let newUser = User(context: self.managedObjectContext) // Should have been declared as a constant within the ViewController's scope
            newUser.firstName = user["firstName"]
            newUser.email = user["email"]
            do {
                try managedObjectContext.save()
                print("Success")
            } catch {
                print("Unresolved error \(error)")
                abort()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

