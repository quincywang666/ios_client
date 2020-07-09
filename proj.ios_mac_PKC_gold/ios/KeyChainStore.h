//
//  KeyChainStore.h
//  pokergame-mobile
//
//  Created by mmosdog on 2019/10/23.
//

#ifndef KeyChainStore_h
#define KeyChainStore_h



#import <Foundation/Foundation.h>
 
@interface KeyChainStore : NSObject
+ (void)save:(NSString*)service data:(id)data;
+ (id)load:(NSString*)service;
+ (void)deleteKeyData:(NSString*)service;
@end

#endif /* KeyChainStore_h */
