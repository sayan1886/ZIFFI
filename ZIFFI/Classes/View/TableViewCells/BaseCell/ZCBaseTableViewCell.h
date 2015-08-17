//
//  ZCBaseTableViewCell.h
//  ZIFFI
//
//  Created by Sayan Chatterjee on 18/08/15.
//  Copyright (c) 2015 ZIFFI.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBaseTableViewCell : UITableViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void) configureCellWithModel:(id) object;
- (void) updateCellUI;
@end
