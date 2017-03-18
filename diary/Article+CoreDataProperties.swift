//
//  Article+CoreDataProperties.swift
//  diary
//
//  Created by aney on 2017. 3. 18..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var createdAt: NSDate?

}
