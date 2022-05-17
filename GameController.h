//
//  GameController.h
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic) NSMutableArray* array;
@property (nonatomic) NSMutableArray* undoArr;
@property (nonatomic) NSMutableArray* held;

- (instancetype)init;
- (void) playDice;
- (void) holdDie:(NSUInteger) indexOfDice andHold: (BOOL) hold;
- (void) resetDice;
- (void) displayVal:(NSInteger) remainTimes;


@end

NS_ASSUME_NONNULL_END
