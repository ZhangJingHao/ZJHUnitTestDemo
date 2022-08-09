//
//  PhotoCellSpec.m
//  ZJHUnitTestDemoTests
//
//  Created by ZJH on 2022/8/1.
//

#import <Kiwi/Kiwi.h>
#import "PhotoCell.h"
#import "Photo.h"
#import "PhotoCell+ConfigureForPhoto.h"

SPEC_BEGIN(PhotoCellSpec)

describe(@"PhotoCell", ^{
    context(@"when nib load", ^{
        PhotoCell *cell = [[PhotoCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:@"abc"];
        it(@"should not be nil", ^{
            [[cell shouldNot] beNil];
        });
        
        it(@"configure For Photo", ^{
            Photo *photo = [Photo new];
            photo.name = @"哈哈哈";
            photo.creationDate = [NSDate date];
            [cell configureForPhoto:photo];
            
            [[cell.textLabel.text should] equal:photo.name];
            [[cell.detailTextLabel.text shouldNot] beNil];
        });
    });
});

SPEC_END

