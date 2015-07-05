//
//  TableViewController.m
//  BlogReader
//
//  Created by Amit Bijlani on 12/6/12.
//  Copyright (c) 2012 Amit Bijlani. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    //NSLog(@"%@", dataDictionary);
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    for(NSDictionary *item in blogPostsArray) {
        NSString *title = [item objectForKey:@"title"];
        NSString *author = [item objectForKey:@"author"];
        NSString *imageRoute = [item objectForKey:@"thumbnail"];
        NSString *date = [item objectForKey:@"date"];
        NSString *url = [item objectForKey:@"url"];
        BlogPost *newPost = [BlogPost blogPostAndTitle:title];
        newPost.author = author;
        newPost.imageRoute = imageRoute;
        newPost.date = date;
        newPost.url = [NSURL URLWithString:url];
        [self.blogPosts addObject:newPost];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    NSMutableString *info = [NSMutableString stringWithString:blogPost.author];
    cell.textLabel.text = blogPost.title;
    if([blogPost.imageRoute isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:[blogPost thumbnailURL]];
        UIImage *img = [UIImage imageWithData:imageData];
        cell.imageView.image = img;
        
    }
    else {
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }
    if([blogPost.date isKindOfClass:[NSString class]]) {
        [info appendString:@" - "];
        [info appendString:[blogPost formattedDate]];
    }
    
    cell.detailTextLabel.text = info;
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showBlogPost"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogSpot = [self.blogPosts objectAtIndex:indexPath.row];
        [segue.destinationViewController setBlogPostUrl:blogSpot.url];
        
    }
    
}

/*

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    int indexSelected = indexPath.row;
    BlogPost *objectSelected = [self.blogPosts objectAtIndex:indexSelected];
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:objectSelected.url];
    NSLog(@"%@", objectSelected.title);
 
}
*/


@end
