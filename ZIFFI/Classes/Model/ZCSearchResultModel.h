//
//  ZCSearchResultModel.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "JSONModel.h"
#import "ZCSearchMetaModel.h"
#import "ZCSearchCategoryModel.h"


@interface ZCSearchResultModel : JSONModel<ZCSearchCategoryModel, NSCoding>
@property (nonatomic, strong) ZCSearchMetaModel *meta;
@property (nonatomic, strong) NSArray<ZCSearchCategoryModel> *results;
@property (nonatomic, strong) NSArray<Optional> *errors;
@end
