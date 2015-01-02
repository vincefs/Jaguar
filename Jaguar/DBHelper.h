//
//  DBHelper.h
//  Jaguar
//
//  Created by Lucas Marcal on 02/01/15.
//  Copyright (c) 2015 Rebel Cookie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DBHelper : NSObject{
    NSManagedObjectContext * _context;
}


-(instancetype)initWithContext:(NSManagedObjectContext *)context;
@end
