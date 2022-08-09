//
//  Store.h
//  objc.io example project (issue #1)
//

#import <Foundation/Foundation.h>


@interface Store : NSObject


@property (readonly, nonatomic, strong) NSArray* photos;
@property (readonly, nonatomic, strong) NSArray* users;

+ (instancetype)sharedInstance;

- (NSArray *)sortedPhotos;

@end
