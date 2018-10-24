//
//  Encryption.h
//  ShuftiProSDK
//
//  Created by Swift Developer on 28/11/2017.
//  Copyright © 2017 Programmers Force. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encryption : NSObject
+ (NSString*) sha256:(NSString *)clear;
@end
