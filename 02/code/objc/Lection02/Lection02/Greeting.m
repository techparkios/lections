//
//  Greeting.m
//  Lection02
//
//  Created by d.taraev on 16.03.17.
//  Copyright © 2017 mail.ru. All rights reserved.
//

#import "Greeting.h"

@implementation Greeting

- (instancetype)initWithName:(NSString *)name gender:(Gender)gender age:(NSInteger)age {
    
    if (self=[super init]) {
        
        _name = [name copy];
        _gender = gender;
        _age = age;
    }
    return self;
}

- (instancetype)init {
    
    return [self initWithName:@"" gender:unknown age:-1];
}

- (NSString *)greeting {
    
    if (self.age > 0) {
        
        NSString *genderString;
        switch (self.gender) {
            case male:
                genderString = @"милый";
                break;
            case female:
                genderString = @"милая";
                break;
            case unknown:
                genderString = @"мил(ый/ая)";
                break;
                
            default:
                break;
        }
        
        NSString *ageString;
        if (self.age < 20) {
            switch (self.gender) {
                case male:
                    ageString = @"юный";
                    break;
                case female:
                    ageString = @"юная";
                    break;
                case unknown:
                    ageString = @"юн(ый/ая)";
                    break;
                    
                default:
                    break;
            }
        } else
            ageString = @"";
        
        return [NSString stringWithFormat:@"Привет, %@ %@ %@!!!", genderString, ageString, self.name];
        
    } else
        return @"";
}

@end
