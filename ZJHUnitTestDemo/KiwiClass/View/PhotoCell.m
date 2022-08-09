//
//  PhotoCell.h
//  objc.io example project (issue #1)
//

#import "PhotoCell.h"


@implementation PhotoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    style = UITableViewCellStyleSubtitle;
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}


@end
