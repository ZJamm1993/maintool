//
//  WBTableView.m
//  WBTableView
//
//  Created by Jamm on 16/1/17.
//  Copyright © 2016年 Jamm. All rights reserved.
//

#import "WBTableView.h"

#define KEYPATH_CONTENTOFFSET @"contentOffset"
#pragma mark WBTableView
#define border_color gray(220)

@interface WBTableView()<WBRefreshViewDelegate,WBLoadMoreFooterViewDelegate,UIScrollViewDelegate>
@property (nonatomic)WBRefreshView* refreshView;
@property (nonatomic)WBLoadMoreFooterView* loadMoreView;
@property (nonatomic)BOOL isLoading;    //这个只是refreshview的loading状态
@end

@implementation WBTableView
{
    BOOL isDragging;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self=[super initWithFrame:frame style:style];
    [self addObserver:self forKeyPath:KEYPATH_CONTENTOFFSET options:NSKeyValueObservingOptionNew context:nil];
    return self;
}

-(void)configureRefreshView:(BOOL)shouldRefresh andLoadMoreView:(BOOL)shoulLoadMore
{
    if(shouldRefresh)
    {
        [self setRefreshView];
    }
    if(shoulLoadMore)
    {
        [self setLoadMoreView];
    }
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:KEYPATH_CONTENTOFFSET];
    YDLog(@"销毁了");
}

//设置下拉刷新view
-(void)setRefreshView
{
    if(_refreshView==nil)
    {
//        self.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 0)];
//        _refreshView=[[SRRefreshView alloc]init];
//        _refreshView.delegate=self;
//        
//        _refreshView.slimeMissWhenGoingBack = YES;
//        _refreshView.slime.bodyColor = [UIColor lightGrayColor];
//        _refreshView.slime.skinColor = [UIColor lightGrayColor];
//        _refreshView.slime.lineWith = 0;
//        _refreshView.slime.shadowBlur = 3;
//        _refreshView.slime.shadowColor = [UIColor blackColor];
//        [self addSubview:_refreshView];
//        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        
//        [_refreshView update:64];
        
        _refreshView=[[WBRefreshView alloc]init];
        _refreshView.delegate=self;
        _refreshView.normalText=@"继续往下拉...";
        _refreshView.pullingText=@"请放开...";
        _refreshView.loadingText=@"正在刷新...";
        _refreshView.finishText=@"已刷新!!!";
        _refreshView.bottomImage=[UIImage imageNamed:@"refresh_rope"];
        _refreshView.leftImage=[UIImage imageNamed:@"refresh_wb"];
        [self addSubview:_refreshView];
    }
}

//设置上拉加载view
-(void)setLoadMoreView
{
    if(_loadMoreView==nil)
    {
        _loadMoreView=[[WBLoadMoreFooterView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        _loadMoreView.delegate=self;
        [self setTableFooterView:_loadMoreView];
        _loadMoreView.hidden=YES;
        //在一开始 ，loadmoreview是隐藏的
//        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

#pragma mark self methods
-(void)showRefreshWithAnimated:(BOOL)animated
{
//    if(_refreshView)
//    {
//        [_refreshView setLoading:animated];
//        _isLoading=YES;
////        [self startRefresh];
////        //直接告诉delegate去刷新
//    }
//    [_refreshView endRefresh];
//    [self.refreshView performSelector:@selector(startRefresh) withObject:nil afterDelay:0];
    [_loadMoreView setLoading:YES];
    _loadMoreView.hidden=NO;
    
    [self startRefresh];
    
//    [self setContentOffset:CGPointMake(0, 44) animated:NO]
}

-(void)startRefresh
{
    
    _isLoading=YES;
//    [self stopLoadingWithMessage:nil];
    if (self.delegate && [self.delegate respondsToSelector:@selector(WBTableViewStartRefresh:)]) {
        [self.delegate performSelector:@selector(WBTableViewStartRefresh:) withObject:self];
    }
    else
    {
        [self stopRefresh];
    }
    //告诉delegate去刷新
}

-(void)stopRefresh
{
    [self stopRefreshWithMessage:nil];
}

-(void)stopRefreshWithMessage:(NSString *)message
{
    _isLoading=NO;
    _loadMoreView.hidden=NO;
    _loadMoreView.loading=NO;
    [_refreshView performSelector:@selector(endRefresh) withObject:nil afterDelay:1];//延迟调用结束动画，防止诡异情况-->>设置1.0s比较保险
//    [self stopLoadingWithMessage:message];
    //delegate告诉self停止刷新动画
}

-(void)stopLoadingWithMessage:(NSString *)message
{
    //delegate告诉self停止加载动画
    [_loadMoreView performSelector:@selector(stopLoadingWithMessage:) withObject:message afterDelay:1];
}

#pragma mark slimeViewDelegate
//-(void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
//{
//    [self startRefresh];
//    //告诉delegate去刷新
//}

-(void)refreshViewStartRefresh:(WBRefreshView *)refreshView
{
    [self startRefresh];
}

#pragma mark loadmoreDelegate
-(void)loadMoreFooterStartLoading:(WBLoadMoreFooterView *)loadMoreView
{
    if (_loadMoreView.superview==nil) {
        return;
    }
    _loadMoreView.hidden=NO;    //因为在一开始这个view藏起来了，所以在加载之后要显示回来
    if (!_isLoading&&self.delegate && [self.delegate respondsToSelector:@selector(WBTableViewStartLoadMore:)]) {
        [self.delegate performSelector:@selector(WBTableViewStartLoadMore:) withObject:self];
    }
    else
    {
        [self stopLoadingWithMessage:nil];
    }
    //告诉delegate去加载更多
}

#pragma mark scroll delegate
-(void)WBScrollViewDidEndDragging:(UIScrollView *)scrollView
{
    //松手时
    if(scrollView.contentOffset.y<0)
    {
        //已被下拉
//        [self.refreshView scrollViewDidEndDraging];
        [self.refreshView scrollViewDidEndDragging:scrollView];
    }
    else if(!_isLoading)
    {
        //不是下拉，具体还要loadmoreview内部判断
        [self.loadMoreView loadMoreScrollViewDidEndDragging:scrollView];
    }
}

-(void)WBScrollViewDidScroll:(UIScrollView *)scrollView
{
    //滑动时
    if(scrollView.contentOffset.y<0)
    {
        //正在下拉
        if (_isLoading) {
            return;
        }
//        [self.refreshView scrollViewDidScroll];
        [self.refreshView scrollViewDidScroll:scrollView];
    }
    else
    {
        //其他，给loadmoreview内部判断
        [self.loadMoreView loadMoreScrollViewDidScroll:scrollView];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context
{
    if ([KEYPATH_CONTENTOFFSET isEqualToString:keyPath]) {
        if (object==self) {
            [self WBScrollViewDidScroll:self];
            if (isDragging!=self.isDragging) {
                isDragging=self.isDragging;
                if (!isDragging) {
                    [self WBScrollViewDidEndDragging:self];
                }
            }
        }
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [WBTableView tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
}

+(void)tableView:(  UITableView *)tableView willDisplayCell:(  UITableViewCell *)cell forRowAtIndexPath:(  NSIndexPath *)indexPath
{
    if ([[[UIDevice currentDevice]systemVersion]floatValue]<7.0) {
        return;
    }
//    if (self.style==UITableViewStyleGrouped) {
    else if([cell isKindOfClass:[ClassGroupedTableViewCell class]]){
        
        
        [((ClassGroupedTableViewCell*)cell) tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
//        CGFloat cornerRadius = 7.f;
//        cell.backgroundColor = UIColor.clearColor;
//        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//        CAShapeLayer *borderLayer = [[CAShapeLayer alloc] init];
//        CAShapeLayer *selectedLayer = [[CAShapeLayer alloc] init];
//        
//        CGMutablePathRef borderPathRef = CGPathCreateMutable();
//        CGRect bounds0 = CGRectInset(cell.bounds, 0, 0);
//        bounds0.origin.x=10;
//        bounds0.size.width-=20;
////        NSLog(@"bound0:%@",NSStringFromCGRect(cell.frame));
//        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
//            CGPathAddRoundedRect(borderPathRef, nil, bounds0, cornerRadius, cornerRadius);
//        } else if (indexPath.row == 0) {
//            CGPathMoveToPoint(borderPathRef, nil, CGRectGetMinX(bounds0), CGRectGetMaxY(bounds0));//left bottom
//            CGPathAddArcToPoint(borderPathRef, nil, CGRectGetMinX(bounds0), CGRectGetMinY(bounds0), CGRectGetMidX(bounds0), CGRectGetMinY(bounds0), cornerRadius);
//            CGPathAddArcToPoint(borderPathRef, nil, CGRectGetMaxX(bounds0), CGRectGetMinY(bounds0), CGRectGetMaxX(bounds0), CGRectGetMidY(bounds0), cornerRadius);
//            CGPathAddLineToPoint(borderPathRef, nil, CGRectGetMaxX(bounds0), CGRectGetMaxY(bounds0));
//        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
//            CGPathMoveToPoint(borderPathRef, nil, CGRectGetMinX(bounds0), CGRectGetMinY(bounds0));//left top
//            CGPathAddArcToPoint(borderPathRef, nil, CGRectGetMinX(bounds0), CGRectGetMaxY(bounds0), CGRectGetMidX(bounds0), CGRectGetMaxY(bounds0), cornerRadius);
//            CGPathAddArcToPoint(borderPathRef, nil, CGRectGetMaxX(bounds0), CGRectGetMaxY(bounds0), CGRectGetMaxX(bounds0), CGRectGetMidY(bounds0), cornerRadius);
//            CGPathAddLineToPoint(borderPathRef, nil, CGRectGetMaxX(bounds0), CGRectGetMinY(bounds0));
//        } else {
//            CGPathAddRect(borderPathRef, nil, CGRectInset(bounds0, 0, 0));
//        }
//        borderLayer.path = borderPathRef;
//        CFRelease(borderPathRef);
//        cornerRadius = 7.f;
//        CGMutablePathRef pathRef = CGPathCreateMutable();
//        CGRect bounds = CGRectInset(bounds0, 0.5, 0.5);
//        BOOL addLine = NO;
//        if (indexPath.row == 0 && [tableView numberOfRowsInSection:indexPath.section]==1) {
//            CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
//        } else if (indexPath.row == 0) {
//            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds0));
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds0));
//            addLine = YES;
//        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
//            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds0));
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds0));
//        } else {
//            CGPathAddRect(pathRef, nil, CGRectInset(bounds0, 0.5, 0));
//            addLine = YES;
//        }
//        layer.path = pathRef;
//        selectedLayer.path = pathRef;
//        CFRelease(pathRef);
//        layer.fillColor = [UIColor whiteColor].CGColor;
//        selectedLayer.fillColor = border_color.CGColor;
//        
//        borderLayer.zPosition = 0.0f;
//        borderLayer.fillColor = border_color.CGColor;
//        borderLayer.lineWidth = 0.5f;
//        borderLayer.lineCap = kCALineCapRound;
//        borderLayer.lineJoin = kCALineJoinRound;
//        
//        [borderLayer addSublayer:layer];
//        
//        BOOL hasSepar=YES;
//        if ([tableView isMemberOfClass:[WBTableView class]]) {
//            hasSepar=!((WBTableView*)tableView).noSeparatorLineOnGroupedStyle;
//        }
//        if (addLine == YES&&hasSepar) {
//            CALayer *lineLayer = [[CALayer alloc] init];
//            CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
//            lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+12, bounds0.size.height-lineHeight, bounds0.size.width-25, lineHeight);
//            lineLayer.backgroundColor = border_color.CGColor;
//            [layer addSublayer:lineLayer];
//        }
//        //add general view
//        UIView *testView = [[UIView alloc] initWithFrame:bounds];
//        [testView.layer insertSublayer:borderLayer atIndex:0];
//        testView.backgroundColor = UIColor.clearColor;
//        cell.backgroundView = testView;
//        
//        //add selected layer view;
//        UIView *testView2 = [[UIView alloc] initWithFrame:bounds];
//        [testView2.layer insertSublayer:selectedLayer atIndex:0];
//        testView2.backgroundColor = UIColor.clearColor;
//        cell.selectedBackgroundView = testView2;
//        
    }
}

-(UILabel*)tableSectionLabelWithText:(NSString *)text
{
    UILabel* time=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, 32)];
    time.font=font(11);
    time.textAlignment=NSTextAlignmentCenter;
    time.textColor=gray_153;
    time.text=text;
    return time;
}

@end


@interface ClassGroupedTableViewCell()

@property (nonatomic,strong) UIImage* cell_top_bg;
@property (nonatomic,strong) UIImage* cell_mid_bg;
@property (nonatomic,strong) UIImage* cell_bot_bg;
@property (nonatomic,strong) UIImage* cell_one_bg;
@property (nonatomic,strong) UIImageView* backgroundImageView;
@property (nonatomic,strong) UIImageView* selectedBackgroundImageView;

@end

@implementation ClassGroupedTableViewCell

//-(void)setFrame:(CGRect)frame
//{
//    frame.origin.x=10;
//    frame.size.width=frame.size.width-20;
//    [super setFrame:frame];
//}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rows=[tableView numberOfRowsInSection:indexPath.section];
    NSInteger currentRow=indexPath.row;
    if (rows==0) {
        return;
    }
    else if(rows==1)
    {
        self.backgroundImageView.image=self.cell_one_bg;
    }
    else if(rows>1)
    {
        if (currentRow==0) {
            self.backgroundImageView.image=self.cell_top_bg;
        }
        else if(currentRow==rows-1)
        {
            self.backgroundImageView.image=self.cell_bot_bg;
        }
        else
        {
            self.backgroundImageView.image=self.cell_mid_bg;
        }
    }
    
    UIImage* selectedBgImage=[self.backgroundImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.selectedBackgroundImageView.image=selectedBgImage;
    
    self.backgroundView=self.backgroundImageView;
    self.selectedBackgroundView=self.selectedBackgroundImageView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.style=style;
    }
    return self;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [super setSelected:NO animated:YES];
}

//-(UIView*)myContentView
//{
//    if (_myContentView==nil) {
//        _myContentView=[[UIView alloc]initWithFrame:self.frame];
////        UIView* conte=[super contentView];
//        _myContentView.clipsToBounds=YES;
//        [super addSubview:_myContentView];
//    }
//    return _myContentView;
//}
//
//-(UIView*)contentView
//{
//    return self.myContentView;
//}
////
//-(void)addSubview:(UIView *)view
//{
//    if (view!=self.contentView)
//    {
//        [self.contentView addSubview:view];
//    }
//    else
//    {
//        [super addSubview:view];
//    }
//}

-(UIImageView*)backgroundImageView
{
    if (_backgroundImageView==nil) {
        _backgroundImageView=[[UIImageView alloc]init];
    }
    return _backgroundImageView;
}

-(UIImageView*)selectedBackgroundImageView
{
    if(_selectedBackgroundImageView==nil)
    {
        _selectedBackgroundImageView=[[UIImageView alloc]init];
        _selectedBackgroundImageView.tintColor=[UIColor colorWithWhite:204.0/255.0 alpha:1];
    }
    return _selectedBackgroundImageView;
}

-(UIImage*)cell_top_bg
{
    if (_cell_top_bg==nil) {
        UIImage* img=[UIImage imageNamed:@"cell_top"];
        _cell_top_bg=[img stretchableImageWithLeftCapWidth:img.size.width/2 topCapHeight:img.size.height/2];
    }
    return _cell_top_bg;
}

-(UIImage*)cell_mid_bg
{
    if (_cell_mid_bg==nil) {
        UIImage* img=[UIImage imageNamed:@"cell_mid"];
        _cell_mid_bg=[img stretchableImageWithLeftCapWidth:img.size.width/2 topCapHeight:img.size.height/2];
    }
    return _cell_mid_bg;
}

-(UIImage*)cell_bot_bg
{
    if (_cell_bot_bg==nil) {
        UIImage* img=[UIImage imageNamed:@"cell_bot"];
        _cell_bot_bg=[img stretchableImageWithLeftCapWidth:img.size.width/2 topCapHeight:img.size.height/2];
    }
    return _cell_bot_bg;
}

-(UIImage*)cell_one_bg
{
    if (_cell_one_bg==nil) {
        UIImage* img=[UIImage imageNamed:@"cell_one"];
        _cell_one_bg=[img stretchableImageWithLeftCapWidth:img.size.width/2 topCapHeight:img.size.height/2];
    }
    return _cell_one_bg;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame=self.bounds;
    frame.origin.x=10;
    frame.size.width=frame.size.width-20;
    self.contentView.frame=frame;
    self.backgroundImageView.frame=frame;
    self.selectedBackgroundImageView.frame=frame;
    self.backgroundColor=[UIColor clearColor];
    self.contentView.backgroundColor=[UIColor clearColor];
    
    CGFloat he=self.contentView.frame.size.height;
    CGFloat ww=self.contentView.frame.size.width;
    CGFloat xm=12;
    CGFloat ym=17;
    
    if (self.accessoryView) {
        //        UIView* acc=self.accessoryView;
        self.accessoryView.x=ww-xm-self.accessoryView.width;
        self.accessoryView.centerY=he/2;
        //        [self.accessoryView removeFromSuperview];
        //        [self.myContentView addSubview:self.accessoryView];
        if (self.accessoryView.width>ww-xm-xm) {
            self.accessoryView.x=xm;
            self.accessoryView.y=he-xm-self.accessoryView.height;
        }
    }
    
    if (self.style==UITableViewCellStyleSubtitle||self.style==UITableViewCellStyleDefault)
    {
        if (self.imageView.image) {
            self.imageView.frame=CGRectMake(xm, ym, he-ym-ym,he-ym-ym);
            self.textLabel.x=self.imageView.maxX+xm;
            self.detailTextLabel.x=self.textLabel.x;
        }
        else
        {
            self.textLabel.x=xm;
            self.detailTextLabel.x=self.textLabel.x;
        }
        if (self.detailTextLabel.text.length>0) {
            self.textLabel.centerY=he/3;
            self.detailTextLabel.centerY=he/3*2;
        }
        else
        {
            self.textLabel.centerY=he/2;
        }
        self.detailTextLabel.width=ww-xm-self.detailTextLabel.x;
        if (self.accessoryView) {
            self.detailTextLabel.width=self.accessoryView.x-xm-self.detailTextLabel.x;
        }
    }
    
    else if (self.style==UITableViewCellStyleValue1) {
        self.textLabel.x=xm;
        self.textLabel.centerY=he/2;
        //    }
        //    else
        //    {
        self.detailTextLabel.x=ww-xm-self.detailTextLabel.width;
        self.detailTextLabel.centerY=he/2;
        //        self.detailTextLabel.width=ww-xm-self.detailTextLabel.x;
        //    }
        if (self.accessoryView) {
            self.accessoryView.x=ww-xm-self.accessoryView.width;
            self.accessoryView.centerY=he/2;
            self.detailTextLabel.width=self.accessoryView.x-xm-self.detailTextLabel.x;
        }
    }
    
    else if(self.style==UITableViewCellStyleValue2)
    {
        [self.textLabel sizeToFit];
        self.textLabel.x=xm;
        self.textLabel.centerY=he/2;
        //    }
        //    else
        //    {
        self.detailTextLabel.x=self.textLabel.maxX+xm;
        self.detailTextLabel.width=ww-xm-self.detailTextLabel.x;
        self.detailTextLabel.centerY=he/2;
        //        self.detailTextLabel.width=ww-xm-self.detailTextLabel.x;
        //    }
        if (self.accessoryView) {
            self.accessoryView.x=ww-xm-self.accessoryView.width;
            self.accessoryView.centerY=he/2;
            if (self.detailTextLabel.maxX>self.accessoryView.x) {
                self.detailTextLabel.width=self.accessoryView.x-xm-self.detailTextLabel.x;
            }
        }
    }
}

-(void)setShowDisclosureIndicator:(BOOL)showDisclosureIndicator
{
    _showDisclosureIndicator=showDisclosureIndicator;
    if (showDisclosureIndicator) {
        UIImageView* im=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
        self.accessoryView=im;
//        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    else
    {
        self.accessoryView=nil;
//        self.accessoryType=UITableViewCellAccessoryNone;
    }
}

@end
