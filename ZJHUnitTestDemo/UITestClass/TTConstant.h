//
//  TTConstant.h
//  TestingTutorial
//
//  Created by xietao on 2018/12/11.
//  Copyright © 2018 com.fruitday. All rights reserved.
//

#ifndef TTConstant_h
#define TTConstant_h

#define kUserDefault [NSUserDefaults standardUserDefaults]

static NSString * const kRecordListSaveKey = @"kRecordListSaveKey";

#define kNotificationCenter [NSNotificationCenter defaultCenter]

static NSString * const kRecordDoneNotificationKey = @"recordDoneNotificationKey";

static NSString * const apiRecordSave = @"record.save";
static NSString * const apiRecordList = @"record.list";
static NSString * const apiRecordDelete = @"record.delete";


#endif /* TTConstant_h */
