//
//  PhotoCell+ConfigureForPhoto.m
//  objc.io example project (issue #1)
//


#import "PhotoCell+ConfigureForPhoto.h"
#import "Photo.h"


@implementation PhotoCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo
{
    self.textLabel.text = photo.name;
    self.detailTextLabel.text = [self.dateFormatter stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}

@end
