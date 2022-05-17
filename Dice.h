//
//  Dice.h
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic) NSString *value;

- (instancetype)init;
- (NSString *) randomizeValue;
- (void) resetting;
@end

NS_ASSUME_NONNULL_END
