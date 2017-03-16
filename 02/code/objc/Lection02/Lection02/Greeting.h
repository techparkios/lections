//
//  Greeting.h
//  Lection02
//
//  Created by d.taraev on 16.03.17.
//  Copyright © 2017 mail.ru. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, Gender) {
    male = 0,
    female,
    unknown
};

@interface Greeting : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) Gender gender;
@property (nonatomic) NSInteger age;

- (instancetype)initWithName:(NSString *)name gender:(Gender)gender age:(NSInteger)age;
- (NSString *)greeting;

@end
