//
//  PagedScrollViewController.m
//  Scroll
//
//  Created by Giovanny Suarez on 12/09/13.
//  Copyright (c) 2013 Cymetria. All rights reserved.
//

#import "PagedScrollViewController.h"

@interface PagedScrollViewController ()
@property NSArray *pageImages;
@property NSMutableArray * pageViews;

-(void) loadVisiblePages;
-(void)loadPage:(NSInteger) page;
-(void)purgePage:(NSInteger) page;

@end

@implementation PagedScrollViewController
@synthesize scrollView,  pageControl, pageImages, pageViews;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.pageImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"photo1.png"],
                       [UIImage imageNamed:@"photo2.png"],
                       [UIImage imageNamed:@"photo3.png"],
                       [UIImage imageNamed:@"photo4.png"],
                       [UIImage imageNamed:@"photo5.png"],
                       nil];
    
    NSInteger pageCount = self.pageImages.count;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    
    self.pageViews = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i<pageCount; i++) {
        [self.pageViews addObject:[NSNull null]];
    }
}
-(void) loadVisiblePages{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth)/(pageWidth*2.0f));
    
    self.pageControl.currentPage = page;
    
    //Paginas que se van a cargar
    NSInteger firstPage = page-1;
    NSInteger lastPage = page+1;
    
    //Borrar todo lo que este antes de la primera pagina o first page
    for (NSInteger i=0 ; i<firstPage; i++) {
        [self purgePage:i];
    }
    for (NSInteger i= firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    for (NSInteger i = lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    } 
}
-(void)loadPage:(NSInteger) page{
    if (page < 0 || page >= self.pageImages.count) {
        return;
    }
    //Cargar una pagina
    UIView * pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull *)pageView == [NSNull null]) {
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollView addSubview:newPageView];
        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
        
    }
}
-(void)purgePage:(NSInteger) page{
    if (page < 0 || page >= self.pageImages.count) {
        return;
    }
    UIView * pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull *)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //CONFIGURAR EL TAMAÑO DEL SCROLL VIEW
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    
    
    [self  loadVisiblePages];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self loadVisiblePages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
