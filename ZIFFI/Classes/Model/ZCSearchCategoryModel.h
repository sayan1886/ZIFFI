//
//  ZCSearchCategoryModel.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import "JSONModel.h"

/**
 **Sample Category Model
 {
 "rank": 1,
 "location": "Next to CCD, Andheri West",
 "working_at": "Mon to Sun - 10:00 AM to 09:00 PM",
 "accepts_wallet": true,
 "image": "https://www.docsuggest.com/suggestadoc/images/gallery/salons/images/2845/73a563361669d137e65cc157fe3fce68.JPG",
 "distance_min": "",
 "fees_min": 800,
 "fees_min_service": "Hair Spa",
 "fees_max": 1250,
 "latitude": "19.130796",
 "awards": [
 ],
 "is_promoted": false,
 "name": "Simone's Salon n Spa",
 "offer_text": "",
 "type": "Unisex",
 "id": "2845",
 "fees_max_service": "Hair Spa",
 "services": "https://www.docsuggest.com/api/providerlocation/services/salons-spas/2845/0/10/",
 "longitude": "72.830958",
 "reviews_count": 49,
 "offer_description": "",
 "distance_max": "",
 "rating": 4.5576923076923004,
 "address": "Shop No.6, Everest Apartments, JP Road, Versova Next to CCD, Andheri West, Mumbai - 400061"
 }
 */

@protocol ZCSearchCategoryModel <NSObject>

@end

@interface ZCSearchCategoryModel : JSONModel
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *rank;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSNumber *reviews_count;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *working_at;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *services;
@property (nonatomic, strong) NSString *fees_min;
@property (nonatomic, strong) NSString *fees_max;
@property (nonatomic, strong) NSString *fees_min_service;
@property (nonatomic, strong) NSString *fees_max_service;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *distance_min;
@property (nonatomic, strong) NSString *distance_max;
@property (nonatomic, strong) NSString *offer_text;
@property (nonatomic, strong) NSString *offer_description;
@end
