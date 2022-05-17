//
//  Dice.h
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic) NSInteger value;
- (instancetype)init;
- (void) randomizeValue;
@end

NS_ASSUME_NONNULL_END
