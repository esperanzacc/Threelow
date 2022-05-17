//
//  main.m
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    NSString *menu = @"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show current stats";
    
    GameController *gameController = [[GameController alloc]init];
    InputCollector *inputCollector = [[InputCollector alloc]init];
    
    BOOL gameOn = YES;
    
    while (gameOn) {
      NSString *input = [inputCollector inputForPrompt:menu];
      if ([input isEqualToString:@"roll"]) {
      [[inputCollector history]addObject:input];
        if ([[inputCollector history]count] == 6 ) {
          NSLog(@"You can not roll again.");
        } else if ([[inputCollector history]count] > 1) {
          if (!([[gameController held]count] == 1)) {
            NSLog(@"You have to select at least one die each turn.");
            [[gameController array]removeAllObjects];
          }
        }else {
          [gameController playDice];
          [gameController displayVal:[[inputCollector history]count]];
        }
          
      } else if ([input isEqualToString:@"hold"]) {
        NSString *hold = [inputCollector inputForPrompt:@"Enter the number of the die:"];
        [gameController holdDie:[hold integerValue] andHold:YES];
      } else if ([input isEqualToString:@"reset"]) {
        [gameController resetDice];
      } else if ([input isEqualToString:@"done"]) {
        break;
      } else if ([input isEqualToString:@"display"]) {
        [gameController displayVal:[[inputCollector history]count]];
      }
      
    }
  }
  return 0;
}

