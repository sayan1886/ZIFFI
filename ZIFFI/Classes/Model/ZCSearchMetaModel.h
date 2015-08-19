//
//  ZCSearchMetaModel.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "ZCJSONModel.h"

/**
 **Sample Meta Model
 total_results": 537,
 "q": "Hair Spa",
 "filters": [
 ],
 "vertical": "salons-spas",
 "results_per_page": 10,
 "show_profile": false,
 "city_id": 4,
 "location": null,
 "is_profile": false,
 "coordinates": null,
 "city_name": "Mumbai",
 "page": 1
 */

@interface ZCSearchMetaModel : ZCJSONModel
@property (nonatomic, strong) NSNumber *results_per_page;
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSNumber *total_results;
@property (nonatomic, strong) NSString *city_name;

@end
