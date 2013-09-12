//
//  ViewController.m
//  ResizeImagen
//
//  Created by Giovanny Suarez on 5/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    addObjectArray = [[NSMutableArray alloc] init];
    
    //Imagen 1
    
    UIImage * imag1 = [UIImage imageNamed:@"access0.png"];
    
    SelectedObjectViewController * selectedObj1 = [[SelectedObjectViewController alloc] initWithFrame:CGRectMake(0, 0, imag1.size.width, imag1.size.height)];
    
    [selectedObj1 setImage:imag1];
    
    selectedObj1.center = CGPointMake(50, 240);
    
    selectedObj1.tag = 1;
    
    [self.view insertSubview:selectedObj1 atIndex:1];
    
    [addObjectArray addObject:selectedObj1];
    
    //Imagen 2
    
    UIImage *imag2=  [UIImage imageNamed:@"access7.png"];
    
    SelectedObjectViewController *selectedObj2=[[SelectedObjectViewController alloc] initWithFrame:CGRectMake(0, 0, imag2.size.width, imag2.size.height)];
    
    [selectedObj2 setImage:imag2];
    
    selectedObj2.center=CGPointMake(180, 240);
    
    selectedObj2.tag = 2;
    
    [self.view insertSubview:selectedObj2 atIndex:2];
    
    [addObjectArray addObject:selectedObj2];
    
    int numero_objetos = [addObjectArray count];
    
    NSLog(@"%d", numero_objetos);
    
    /////
}

-(void) makeSelectedArea : (SelectedObjectViewController *)obj
{
    dotBlueArea1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea1.image = [UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea1.center = CGPointMake(obj.bounds.origin.x -10, obj.bounds.origin.y -10);
    [obj addSubview:dotBlueArea1];
    
    dotBlueArea2=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea2.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea2.center=CGPointMake(obj.frame.size.width/2, obj.bounds.origin.y-10);
    [obj addSubview:dotBlueArea2];
    
    dotBlueArea3=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea3.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea3.center=CGPointMake(obj.frame.size.width+10, obj.bounds.origin.y-10);
    [obj addSubview:dotBlueArea3];
    
    dotBlueArea4=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea4.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea4.center=CGPointMake(obj.frame.size.width+10, obj.frame.size.height/2);
    [obj addSubview:dotBlueArea4];
    
    dotBlueArea5=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea5.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea5.center=CGPointMake(obj.frame.size.width+10, obj.frame.size.height+10);
    [obj addSubview:dotBlueArea5];
    
    dotBlueArea6=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea6.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea6.center=CGPointMake(obj.frame.size.width/2, obj.frame.size.height+10);
    [obj addSubview:dotBlueArea6];
    
    dotBlueArea7=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea7.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea7.center=CGPointMake(obj.bounds.origin.x-10, obj.frame.size.height+10);
    [obj addSubview:dotBlueArea7];
    
    dotBlueArea8=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25) ];
    dotBlueArea8.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea8.center=CGPointMake(obj.bounds.origin.x-10, obj.frame.size.height/2);
    [obj addSubview:dotBlueArea8];
    
}

-(void)creatMenu:(SelectedObjectViewController *)obj{
    UIMenuController * menuController = [UIMenuController sharedMenuController];
    CGPoint location;
    UIMenuItem * menuItemFront = [[UIMenuItem alloc] initWithTitle:@"Al frente" action:@selector(tapFrontTo)];
    UIMenuItem * menuItemBack = [[UIMenuItem alloc] initWithTitle:@"Atras" action:@selector(tapBackTo)];
    UIMenuItem * menuItemDelete = [[UIMenuItem alloc] initWithTitle:@"Borrar" action:@selector(tapDelete)];
    location = CGPointMake(obj.frame.size.width/2, 0);
    [menuController setMenuItems:[NSArray arrayWithObjects:menuItemFront, menuItemBack, menuItemDelete, nil]];
    [menuController setTargetRect:CGRectMake(location.x, location.y, 0, 0) inView:obj];
    [menuController setMenuVisible:YES animated:YES];
}
-(void)tapDetected: (UITapGestureRecognizer *)tapRecognizer{
    for (SelectedObjectViewController * obj in addObjectArray ) {
        if (obj.isObjectSelected == YES) {
            [self creatMenu:obj];
        }
    }
}
-(void) applyGesture:(SelectedObjectViewController *)selectObject{
    UITapGestureRecognizer * tapRecognizar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizar.numberOfTapsRequired = 2;
    [selectObject addGestureRecognizer:tapRecognizar];
    tapRecognizar.delegate = self;
}

-(void) objectSelected:(SelectedObjectViewController *) obj{
    obj.isObjectSelected=YES;
    
    [self makeSelectedArea:obj];
    isObjectSelect=YES;
    
    [self applyGesture:obj];
}
-(void) objectUnselected:(SelectedObjectViewController *)obj
{
    isDotBlueAreatouch1=NO;
    isDotBlueAreatouch2=NO;
    isDotBlueAreatouch3=NO;
    isDotBlueAreatouch4=NO;
    isDotBlueAreatouch5=NO;
    isDotBlueAreatouch6=NO;
    isDotBlueAreatouch7=NO;
    isDotBlueAreatouch8=NO;
    
    if(isSelecteObjectRemove == YES){
        isSelecteObjectRemove = NO;
        [self removeSelectArea];
        for (UIGestureRecognizer * gesture in [obj gestureRecognizers]) {
            [obj removeGestureRecognizer:gesture];
        }
    }
}

-(void) removeSelectArea{
    [dotBlueArea1 removeFromSuperview];
    [dotBlueArea2 removeFromSuperview];
    [dotBlueArea3 removeFromSuperview];
    [dotBlueArea4 removeFromSuperview];
    [dotBlueArea5 removeFromSuperview];
    [dotBlueArea6 removeFromSuperview];
    [dotBlueArea7 removeFromSuperview];
    [dotBlueArea8 removeFromSuperview];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    isSelecteObjectRemove = NO;
    
    
    for (SelectedObjectViewController * obj in addObjectArray) {
        NSLog(@"%ld",  (long)obj.tag);
        if (obj.tag == touch.view.tag && isObjectSelect == NO)   {
            
            [self objectUnSelectIFObjectSel];
            [self objectSelected:obj];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isObjectSelect==YES){
        
        for(SelectedObjectViewController *obj in addObjectArray){
            if (obj.isObjectSelected==YES){
                isTouchDotArea=NO;
                isDotBlueAreatouch1=NO;
                isDotBlueAreatouch3=NO;
                isDotBlueAreatouch7=NO;
                isDotBlueAreatouch5=NO;
                isDotBlueAreatouch2=NO;
                isDotBlueAreatouch4=NO;
                isDotBlueAreatouch6=NO;
                isDotBlueAreatouch8=NO;

                if (isSelecteObjectRemove==YES) {
                    isSelecteObjectRemove=NO;
                    [self removeSelectArea];
                    for(UIGestureRecognizer *gesture in [obj gestureRecognizers]){
                        [obj removeGestureRecognizer:gesture];
                    }
                    
                    obj.isObjectSelected=NO;
                    
                    isObjectSelect=NO;
                    
                }
            }
        }
    }

}

-(void)objectUnSelectIFObjectSel{
    for (SelectedObjectViewController * obj in addObjectArray) {
        if (obj.isObjectSelected ==  YES) {
            obj.isObjectSelected = NO;
            isSelecteObjectRemove = YES;
            [self objectUnselected:obj];
        }
    }
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void) tapFrontTo
{
    
}
-(void) tapBackTo
{
    
}
-(void) tapDelete
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapGroup:(id)sender {
}

- (IBAction)tapUngroup:(id)sender {
}

- (IBAction)tapAdd:(id)sender {
}
@end
