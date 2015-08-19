//
//  ZCConstants.m
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//


#import "ZCConstants.h"

NSString  *APPLICATION_FONT = @"Helvetica Neue";
NSString  *APPLICATION_FONT_BOLD = @"Helvetica Neue Bold";
CGFloat NAV_BAR_TITLE_FONT_SIZE = 21.0f;
CGFloat TAB_BAR_TITLE_FONT_SIZE = 13.0f;

UIColor *COLOR_WITH_RED_GREEN_BLUE_APLPHA(CGFloat RED, CGFloat GREEN, CGFloat BLUE, CGFloat ALPHA){
    return [UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:ALPHA];
}

UIColor *COLOR_WITH_RED_GREEN_BLUE(CGFloat RED, CGFloat GREEN, CGFloat BLUE){
    return COLOR_WITH_RED_GREEN_BLUE_APLPHA(RED, GREEN, BLUE, 1.0f);
}


NSString *HOME_VIEW_CONTROLLER_NAVIGATION_TITLE = @"Home";
NSString *OFFER_VIEW_CONTROLLER_NAVIGATION_TITLE = @"Offer";
NSString *BOOKINGS_VIEW_CONTROLLER_NAVIGATION_TITLE = @"Bookings";
NSString *REFFER_VIEW_CONTROLLER_NAVIGATION_TITLE = @"Reffer";
NSString *MORE_VIEW_CONTROLLER_NAVIGATION_TITLE = @"More";

NSString *ZIFFY_BASE_URL = @"http://www.ziffi.com/";
NSString *SEARCH_URL_PATH = @"api/search";


NSString *SEARCH_LOADING_MESSAGE = @"__SEARCH_LOADING_MESSAGE__";
