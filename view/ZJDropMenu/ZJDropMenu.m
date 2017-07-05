//
//  ZJDropMenu.m
//  ZJDropMenu
//
//  Created by Jamm on 16/4/16.
//  Copyright © 2016年 Jamm. All rights reserved.
//

#import "ZJDropMenu.h"
#define KEY_TITLE @"key_title"
#define KEY_BUTTON @"key_button"
#define KEY_DATA @"key_data"
@interface ZJDropMenu()
@end

@implementation ZJDropMenu
{
    NSMutableArray* titlesArray;
//    NSMutableArray* arrowsArray;
    NSMutableArray* tablesArray;
    NSMutableArray* rowsArray;
    NSInteger currentCollection;
    CGRect oldFrame;
    NSInteger tagss;
    NSMutableDictionary* buttonsGroups;
    UIView* line;
}
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    [self setup];
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hideAllTables) ];
//    [self addGestureRecognizer:pan];
    return self;
}

-(void)setup
{
    self.backgroundColor=[UIColor colorWithWhite:80.0f/255.0f alpha:0.6];
    UIView* bg=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    bg.backgroundColor=[UIColor whiteColor];
    [self addSubview:bg];
    UIView* sp=[[UIView alloc]initWithFrame:CGRectMake(0, self.height-0.5, self.width, 0.5)];
    sp.backgroundColor=gray_233;
    [self addSubview:sp];
    oldFrame=self.frame;
    tagss=100;
    line=[[UIView alloc]init];
    line.backgroundColor=green_color;
    
    [self addSubview:line];
    titlesArray=[NSMutableArray array];
//    arrowsArray=[NSMutableArray array];
    tablesArray=[NSMutableArray array];
    rowsArray=[NSMutableArray array];
    buttonsGroups=[NSMutableDictionary dictionary];
}

-(void)titleButtonSelected:(id)sender
{
    UIButton* btnToSelected=(UIButton*)sender;
    line.frame=CGRectMake(btnToSelected.x+btnToSelected.width/6, btnToSelected.height-3, btnToSelected.width/3*2, 3);
    line.layer.cornerRadius=1.5;
    line.clipsToBounds=YES;
    if(sender&&btnToSelected.selected)
    {
        btnToSelected.selected=NO;
//        [self resetArrows];
        line.width=0;
        [self hideTables];
        return;
    }
    for(UIButton* btn in titlesArray)
    {
        btn.selected=NO;
//        [self resetArrows];
        [self hideTables];
    }
    if(sender)
    {
        btnToSelected.selected=YES;
        NSInteger num=[titlesArray indexOfObject:btnToSelected];
//        [self rotateArrow:num];
        [self showTable:num];
    }
}

//-(void)resetArrows
//{
//    for(UIImageView* imgView in arrowsArray)
//    {
//        [UIView animateWithDuration:0.3 animations:^{
//            imgView.transform=CGAffineTransformMakeRotation(0);
//        }];
//    }
//}
//
//-(void)rotateArrow:(NSInteger)num
//{
//    UIImageView* imgView=arrowsArray[num];
//    [UIView animateWithDuration:0.3 animations:^{
//        imgView.transform=CGAffineTransformMakeRotation(M_PI-(1.0/180.0));
//    }];
//}

-(void)showTable:(NSInteger)num
{
    UIView* view=tablesArray[num];
    CGRect f=self.frame;
    f.size.height=1000;
    self.frame=f;
    view.hidden=NO;
}

-(void)hideTables
{
    for(UIView* view in tablesArray)
    {
        view.hidden=YES;
    }
    CGRect f=self.frame;
    f.size.height=oldFrame.size.height;
    self.frame=f;
}

-(void)hideAllTables
{
    [self titleButtonSelected:nil];
}

-(void)touchesBegan:(NSSet  *)touches withEvent:(UIEvent *)event
{
    [self hideAllTables];
}


-(void)plainButtonSelected:(id)sender
{
    [self tableButtonSelected:sender];
    [self hideAllTables];
    if([_delegate respondsToSelector:@selector(dropMenuDidSelected:)])
    {
        UIButton* btn=(UIButton*)sender;
        NSInteger tag=btn.tag;
        NSString* keyWithTag=[NSString stringWithFormat:@"%ld",(long)tag];
        NSDictionary* dict=[buttonsGroups objectForKey:keyWithTag];
        NSString* title=[dict valueForKey:KEY_TITLE];
        NSString* data=btn.titleLabel.text;
        NSDictionary* d=[NSDictionary dictionaryWithObjectsAndKeys:data,title, nil];
        [_delegate dropMenuDidSelected:d];
    }
}

-(void)groupButtonSelected:(id)sender
{
    UIButton* btn=(UIButton*)sender;
    NSInteger tag=btn.tag;
    NSString* keyWithTag=[NSString stringWithFormat:@"%ld",(long)tag];
    NSDictionary* dict=[buttonsGroups objectForKey:keyWithTag];
    NSArray* buttonsWithTag=[dict objectForKey:KEY_BUTTON];
    for(UIButton* bbn in buttonsWithTag)
    {
        bbn.selected=NO;
        bbn.layer.borderWidth=0.5;
        bbn.layer.borderColor=gray_233.CGColor;
    }
    btn.selected=YES;
    btn.layer.borderWidth=0;
    btn.layer.borderColor=gray_a(0, 0).CGColor;
}

-(void)tableButtonSelected:(id)sender
{
    UIButton* btn=(UIButton*)sender;
    NSInteger tag=btn.tag;
    NSString* keyWithTag=[NSString stringWithFormat:@"%ld",(long)tag];
    NSDictionary* dict=[buttonsGroups objectForKey:keyWithTag];
    NSArray* buttonsWithTag=[dict objectForKey:KEY_BUTTON];
    for(UIButton* bbn in buttonsWithTag)
    {
        bbn.selected=NO;
    }
    btn.selected=YES;
}

-(void)setDatasource:(id<ZJDropMenuDataSource>)datasource
{
    _datasource=datasource;
    
    //numberOfSectionForMenu
    if([_datasource respondsToSelector:@selector(numberOfCollectionForMenu)])
    {
        NSInteger number=[_datasource numberOfCollectionForMenu];
        CGFloat h=self.frame.size.height;
        CGFloat w=self.frame.size.width/number;
        for(int i=0;i<number;i++)
        {
            //make titles
            
            UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(i*w,0,w,h)];
            [button addTarget:self action:@selector(titleButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font=[UIFont systemFontOfSize:h*0.4];
            [button setTitleColor:color_102 forState:UIControlStateNormal];
            [button setTitleColor:color_051 forState:UIControlStateSelected];
            [button setBackgroundColor:[UIColor clearColor]];
            [self addSubview:button];
            [titlesArray addObject:button];
//            UIImageView* imgView=[[UIImageView alloc]initWithFrame:CGRectMake((i+1)*w-20,h/2-5, 10, 10)];
//            UIImage* image=[UIImage imageNamed:@"state_down_black"];
//            [imgView setTintAdjustmentMode:UIViewTintAdjustmentModeNormal];
//            imgView.image=image;
//            [self addSubview:imgView];
//            [arrowsArray addObject:imgView];
            NSString* tit;
            
            if([_datasource respondsToSelector:@selector(titleForCollection:)])
            {
                tit=[_datasource titleForCollection:i];
                [button setTitle:tit forState:UIControlStateNormal];
            }
            
            //make tables
            if([_datasource respondsToSelector:@selector(numberOfRowForCollection:)])
            {
                NSInteger row= [_datasource numberOfRowForCollection:i];
                UIView* bg=[[UIView alloc]initWithFrame:CGRectMake(0, h, self.frame.size.width,0)];
                bg.hidden=YES;
                bg.backgroundColor=color_background;
                [self addSubview:bg];
                [tablesArray addObject:bg];
                [rowsArray addObject:[NSNumber numberWithInteger:row]];
                
                ZJDropMenuCollectionType type;
                if([_datasource respondsToSelector:@selector(typeForCollection:)])
                {
                    type=[_datasource typeForCollection:i];
                }
                
                
                if(type==ZJDropMenuCollectionTypePlain)
                {
                    NSInteger t=tagss++;
                    NSString* key=[NSString stringWithFormat:@"%ld",(long)t];
                    NSMutableDictionary* dict=[NSMutableDictionary dictionary];
                    NSMutableArray* array=[NSMutableArray array];
                    CGFloat btnH=50*(rateH>1?rateH:1);
                    for(int j=0;j<row;j++)
                    {
                        if([_datasource respondsToSelector:@selector(titleForPlainRow:inCollection:)])
                        {
                            NSString* ti=[_datasource titleForPlainRow:j inCollection:i];
                            UIButton* tib=[[UIButton alloc]initWithFrame:CGRectMake(0,btnH*j, self.frame.size.width, btnH)];
                            tib.tag=t;
                            tib.titleLabel.font=[UIFont systemFontOfSize:h*0.4];
                            tib.backgroundColor=color_background;
                            [tib setTitle:ti forState:UIControlStateNormal];
                            [tib setTitleColor:color_102 forState:UIControlStateNormal];
                            [tib setTitleColor:color_Highlighted_app forState:UIControlStateSelected|UIControlStateHighlighted];
                            [tib setTitleColor:color_main_app forState:UIControlStateSelected];
                            [tib setTitleColor:color_Highlighted_app forState:UIControlStateHighlighted];
                            [tib setBackgroundImage:[UIImage createImageWithColor:gray_233] forState:UIControlStateSelected];
                            [tib setBackgroundColor:[UIColor whiteColor]];
//                            [tib setImage:[UIImage imageNamed:@"icon_select"] forState:UIControlStateSelected];
//                            [tib setImage:[UIImage imageNamed:@"icon_select"] forState:UIControlStateHighlighted];
//                            [tib setImage:[UIImage imageNamed:@"icon_select"] forState:UIControlStateHighlighted|UIControlStateSelected];
//                            [tib setImageEdgeInsets:UIEdgeInsetsMake(0,0, 0,70)];
//                            [tib setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//                            [tib setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
                            [tib addTarget:self action:@selector(plainButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
                            CGRect f=bg.frame;
                            f.size.height=f.size.height+tib.frame.size.height;//+0.5;
                            bg.frame=f;
                            [bg addSubview:tib];
                            [array addObject:tib];
                            if(j==0)
                            {
                                tib.selected=YES;
                            }
                        }
                    }
                    [dict setObject:tit forKey:KEY_TITLE];
                    [dict setObject:array forKey:KEY_BUTTON];
                    [buttonsGroups setObject:dict forKey:key];
                }
                else //grouped
                {
                    CGFloat hhh=0;
                    NSMutableArray* originButtons=[NSMutableArray array];
                    NSMutableArray* groupTitlesArray=[NSMutableArray array];
                    NSMutableDictionary* dictionary=[NSMutableDictionary dictionary];
                    for(int j=0;j<row;j++)
                    {
                        if([_datasource respondsToSelector:@selector(titleForGroupRow:inCollection:)])
                        {
                            NSInteger numb;
                            if([_datasource respondsToSelector:@selector(numberOfButtonForGroupRow:inCollection:)])
                            {
                                numb=[_datasource numberOfButtonForGroupRow:j inCollection:i];
                            }
                            NSInteger rows=numb/3;
                            if(numb%3!=0)
                                rows++;
                            CGFloat btnH=30*(rateH<1?rateH:1);
                            CGFloat m=10;
                            CGFloat btnW=self.frame.size.width/3-m-m;
                            
                            CGFloat rowH=rows*(btnH+m)+m;//+30*rate_screen_height;
                            NSString* ti=[_datasource titleForGroupRow:j inCollection:i];
                            [groupTitlesArray addObject:ti];
                            UIView* bg2=[[UIView alloc]initWithFrame:CGRectMake(0, hhh, self.frame.size.width, rowH)];
                            hhh=hhh+rowH;
                            bg2.backgroundColor=[UIColor whiteColor];
//                            UILabel* til=[[UILabel alloc]initWithFrame:CGRectMake(m, m, 200, 20*rate_screen_height)];
//                            til.text=ti;
//                            til.font=[UIFont systemFontOfSize:15*rate_screen_height];
//                            til.textColor=color_102;
//                            [bg2 addSubview:til];
                            CGRect f=bg.frame;
                            f.size.height=f.size.height+bg2.frame.size.height+1;
                            bg.frame=f;
                            [bg addSubview:bg2];
                            
                            //add btn
                            NSInteger t=tagss++;
                            NSString* key=[NSString stringWithFormat:@"%ld",(long)t];
                            NSMutableDictionary* dict=[NSMutableDictionary dictionary];
                            NSMutableArray* array=[NSMutableArray array];
                            for(int k=0;k<numb;k++)
                            {
                                if([_datasource respondsToSelector:@selector(titleForButtonForGroupIndex:row:col:)])
                                {
                                    NSString* tti=[_datasource titleForButtonForGroupIndex:k row:j col:i];
                                    NSInteger x=k%3*(self.frame.size.width/3);
                                    NSInteger y=k/3*(btnH+m);//+30*rate_screen_height;
                                    UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(x+m, y+m, btnW, btnH)];
                                    btn.tag=t;
//                                    btn.backgroundColor=;
                                    [btn setTitle:tti forState:UIControlStateNormal];
                                    [btn setTitleColor:color_102 forState:UIControlStateNormal];
                                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                                    [btn setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
                                    [btn setBackgroundImage:[UIImage createImageWithColor:green_high_color] forState:UIControlStateHighlighted];
                                    [btn setBackgroundImage:[UIImage createImageWithColor:green_high_color] forState:UIControlStateHighlighted|UIControlStateSelected];
                                    [btn setBackgroundImage:[UIImage createImageWithColor:green_color] forState:UIControlStateSelected];
                                    btn.layer.cornerRadius=3;
                                    btn.clipsToBounds=YES;
                                    btn.layer.borderColor=gray_233.CGColor;
                                    btn.layer.borderWidth=0.5;
                                    btn.titleLabel.font=font(btnH*0.5);
                                    [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
                                        [self groupButtonSelected:btn];
                                        [dictionary setObject:btn.titleLabel.text forKey:ti];
                                    }];
                                    [bg2 addSubview:btn];
                                    [array addObject:btn];
                                    if(k==0)
                                    {
                                        [self groupButtonSelected:btn];
                                        [originButtons addObject:btn];
                                        [dictionary setObject:btn.titleLabel.text forKey:ti];
                                    }
                                }
                            }
                            [dict setObject:ti forKey:KEY_TITLE];
                            [dict setObject:array forKey:KEY_BUTTON];
                            [buttonsGroups setObject:dict forKey:key];
                        }
                    }
                    if(row>0)
                    {
                        CGFloat m=10;
                        CGFloat btnH=30*rate_screen_height;
                        CGFloat btnW=self.frame.size.width/3-m-m;
                        UIView* bg2=[[UIView alloc]initWithFrame:CGRectMake(0, bg.frame.size.height, self.frame.size.width, btnH+m+m-1)];
                        bg2.backgroundColor=[UIColor whiteColor];
                        [bg addSubview:bg2];
                        CGRect f=bg.frame;
                        f.size.height=bg2.frame.size.height+f.size.height+1;
                        bg.frame=f;
                        
                        UIButton* clearnBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, btnW, bg2.frame.size.height)];
                        clearnBtn.titleLabel.font=[UIFont systemFontOfSize:16];
                        [clearnBtn setTitle:@"清除全部" forState:UIControlStateNormal];
                        [clearnBtn setTitleColor:gray_153 forState:UIControlStateNormal];
                        [clearnBtn setTitleColor:gray_233 forState:UIControlStateHighlighted];
                        [bg2 addSubview:clearnBtn];
                        [clearnBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
                            for(int p=0;p<originButtons.count;p++)
                            {
                                UIButton* btn =originButtons[p];
                                [self tableButtonSelected:btn];
                                [dictionary setObject:btn.titleLabel.text forKey:groupTitlesArray[p]];
                            }
                        }];
                        
                        UIButton* commitBtn=[[UIButton alloc]initWithFrame:CGRectMake(bg2.frame.size.width-btnW-m, m, btnW,btnH)];
                        [commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                        [commitBtn setTitle:@"确定" forState:UIControlStateNormal];
                        commitBtn.titleLabel.font=[UIFont systemFontOfSize:16];
                        [commitBtn setTitleColor:green_color forState:UIControlStateNormal];
                        [commitBtn setTitleColor:green_high_color forState:UIControlStateHighlighted];
//                        [commitBtn setBackgroundImage:[UIImage imageNamed:@"btn_sure_n"] forState:UIControlStateNormal];
//                        [commitBtn setBackgroundImage:[UIImage imageNamed:@"btn_sure_h"] forState:UIControlStateHighlighted];
                        [bg2 addSubview:commitBtn];
                        [commitBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
//                            NSLog(@"%@",dictionary.description);
                            if([_delegate respondsToSelector:@selector(dropMenuDidSelected:)])
                            {
                                [_delegate dropMenuDidSelected:dictionary];
                            }
                            [self hideAllTables];
                        }];
                    }
                }
            }
        }
    }  
}

-(UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
