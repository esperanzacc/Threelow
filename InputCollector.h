//
//  InputCollector.h
//  Threelow
//
//  Created by Esperanza on 2022-05-17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

- (NSString *)inputForPrompt: (NSString *)promptString;

@end

NS_ASSUME_NONNULL_END
