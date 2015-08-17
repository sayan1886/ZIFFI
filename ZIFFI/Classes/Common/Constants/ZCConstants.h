//
//  ZCConstants.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 17/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#ifndef ZIFFI_ZCConstants_h
#define ZIFFI_ZCConstants_h

/*!
 * @function ZCLog  Macro
 */
#ifdef DEBUG
    #ifndef FC_DISABLE_DEBUG_LOGGING
        #define ZCLogFunction()        NSLog(@"%s", __FUNCTION__)
        #define ZCLog(...)             NSLog(@"%s: %@", __FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
    #else
        #define ZCLogFunction(...)
        #define ZCLog(...)
    #endif
#else
    #define ZCLogFunction(...)
    #define ZCLog(...)
#endif

/*!
 * @function Singleton GCD Macro
 */
#define SHARED_INSTANCE(...) ({\
            static dispatch_once_t pred;\
            static id sharedObject;\
            dispatch_once(&pred, ^{\
            sharedObject = (__VA_ARGS__);\
        });\
        sharedObject;\
    })
#endif

#define COLOR_FRACTION(v) ( v / 255.0f)

UIKIT_EXTERN NSString  *APPLICATION_FONT;
UIKIT_EXTERN NSString  *APPLICATION_FONT_BOLD;
UIKIT_EXTERN CGFloat NAV_BAR_TITLE_FONT_SIZE;
UIKIT_EXTERN CGFloat TAB_BAR_TITLE_FONT_SIZE;

UIKIT_EXTERN UIColor *COLOR_WITH_RED_GREEN_BLUE_APLPHA(CGFloat RED, CGFloat GREEN, CGFloat BLUE, CGFloat ALPHA);
UIKIT_EXTERN UIColor *COLOR_WITH_RED_GREEN_BLUE(CGFloat RED, CGFloat GREEN, CGFloat BLUE);

UIKIT_EXTERN NSString *HOME_VIEW_CONTROLLER_NAVIGATION_TITLE;
UIKIT_EXTERN NSString *OFFER_VIEW_CONTROLLER_NAVIGATION_TITLE;
UIKIT_EXTERN NSString *BOOKINGS_VIEW_CONTROLLER_NAVIGATION_TITLE;
UIKIT_EXTERN NSString *REFFER_VIEW_CONTROLLER_NAVIGATION_TITLE;
UIKIT_EXTERN NSString *MORE_VIEW_CONTROLLER_NAVIGATION_TITLE;
