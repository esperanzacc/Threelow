//
//  main.m
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Dice *dice1 = [[Dice alloc]init];
    Dice *dice2 = [[Dice alloc]init];
    Dice *dice3 = [[Dice alloc]init];
    Dice *dice4 = [[Dice alloc]init];
    Dice *dice5 = [[Dice alloc]init];
    
    NSString *menu = @"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show current stats";
    InputCollector *inputCollector = [[InputCollector alloc]init];
    BOOL gameOn = YES;
    
    while (gameOn) {
      NSString *input = [inputCollector inputForPrompt:menu];
      if ([input isEqualToString:@"roll"]) {
        NSLog(@"%@ %@ %@ %@ %@",[dice1 randomizeValue],[dice2 randomizeValue],[dice3 randomizeValue],[dice4 randomizeValue],[dice5 randomizeValue]);
      } else if ([input isEqualToString:@"done"]) {
        break;
      }
    }
  }
  return 0;
}
