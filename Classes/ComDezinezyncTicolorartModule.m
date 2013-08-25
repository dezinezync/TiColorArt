/**
 * 2013 Nikhil Nigade @dezinezync
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import <UIKit/UIKit.h>

#import "ComDezinezyncTicolorartModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "SLColorArt.h"

@implementation ComDezinezyncTicolorartModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"867dcb77-35fd-4e77-aaf5-db4af1670bcb";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.dezinezync.ticolorart";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)analyze:(id)url
{
	ENSURE_SINGLE_ARG(url, NSString);
    
    UIImage *image = [UIImage imageWithContentsOfFile:url];
    
    if ( image != nil )
    {
        SLColorArt *colorArt = [[SLColorArt alloc] initWithImage:image threshold:2];
        
        CGFloat fr,fg,fb;
        int r,g,b;
        
        [colorArt.backgroundColor getRed:&fr green:&fg blue:&fb alpha:nil];
        
        r = (int)(255.0 * fr);
        g = (int)(255.0 * fg);
        b = (int)(255.0 * fb);
        
        NSString *backgroundColor = [NSString stringWithFormat:@"%02x%02x%02x",r,g,b];
        
        
        [colorArt.primaryColor getRed:&fr green:&fg blue:&fb alpha:nil];
        
        r = (int)(255.0 * fr);
        g = (int)(255.0 * fg);
        b = (int)(255.0 * fb);
        
        NSString *primaryColor = [NSString stringWithFormat:@"%02x%02x%02x",r,g,b];
        
        
        [colorArt.secondaryColor getRed:&fr green:&fg blue:&fb alpha:nil];
        
        r = (int)(255.0 * fr);
        g = (int)(255.0 * fg);
        b = (int)(255.0 * fb);
        
        NSString *secondaryColor = [NSString stringWithFormat:@"%02x%02x%02x",r,g,b];

        
        [colorArt.detailColor getRed:&fr green:&fg blue:&fb alpha:nil];
        
        r = (int)(255.0 * fr);
        g = (int)(255.0 * fg);
        b = (int)(255.0 * fb);
        
        NSString *detailColor = [NSString stringWithFormat:@"%02x%02x%02x",r,g,b];
        
        
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        
        [data setValue:backgroundColor forKey:@"backgroundColor"];
        [data setValue:primaryColor forKey:@"primaryColor"];
        [data setValue:secondaryColor forKey:@"secondaryColor"];
        [data setValue:detailColor forKey:@"detailColor"];
        
        return data;
    }
    
    return [NSNull null];

}

@end
