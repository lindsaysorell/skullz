//
//  C4WorkSpace.m
//  test
//
//  Created by Lindsay Sorell on 12-04-30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "C4WorkSpace.h"


@interface C4WorkSpace ()
-(void)methodToRunImmediately;

@end

@implementation C4WorkSpace {
    NSMutableArray *images;
    // Create new objects here
    
    C4Label *newLabel;
    C4Label *anothernewLabel;
    C4Image *rock;
    UIImage *animatedSequence;
    
   
}

-(void)setup {
    // Define intial state of objects here

    self.canvas.backgroundColor = C4GREY;

    images = [[NSMutableArray alloc] initWithCapacity:0];

    for(int i = 0; i < 24; i++) {
        C4Image *image = [C4Image imageNamed:@"skull.jpg"];
        image.animationDuration = 0.0f;
        image.center = CGPointMake(15+32*i, 150);
        [images addObject:image];
        [self.canvas addImage:image];
    }
    
    for(int i = 0; i < 24; i++) {
        C4Image *image = [C4Image imageNamed:@"skull.jpg"];
        image.animationDuration = 0.0f;
        image.center = CGPointMake(15+32*i, 850);
        [images addObject:image];
        [self.canvas addImage:image];
    }
    
    [self performSelector:@selector(methodToRunImmediately) withObject:nil afterDelay:0.1];
    
    C4Font *newFont = [C4Font fontWithName:@"Helvetica-Light" size:15];
    newLabel = [C4Label labelWithText:@" When I'm not with you, I wish I was."];
    anothernewLabel = [C4Label labelWithText:@"When I am with you, I wish I was more with you."];
    
    newLabel.font = newFont;
    [newLabel sizeToFit];
    newLabel.center = CGPointMake(370, 10);
    newLabel.backgroundColor = C4GREY;
    newLabel.textColor = C4RED;
    [self.canvas addLabel:newLabel];
    
    anothernewLabel.font = newFont;
    [anothernewLabel sizeToFit];
    anothernewLabel.center = CGPointMake(370, 1010);
    anothernewLabel.backgroundColor = C4GREY;
    anothernewLabel.textColor = C4RED;
    [self.canvas addLabel:anothernewLabel];
    
}

-(void)animateObject:(NSNumber *)index {
    C4Image *currentImage = [self.canvas.subviews objectAtIndex:[index intValue]];
    currentImage.animationDuration = 5.0f;
    currentImage.animationOptions = REPEAT;
    currentImage.origin = CGPointMake(350, 400);
    
    newLabel.animationDuration = 12.0f;
    newLabel.animationOptions = AUTOREVERSE | REPEAT;
    newLabel.origin = CGPointMake(250,400);
    
    anothernewLabel.animationDuration = 12.0f;
    anothernewLabel.animationOptions = AUTOREVERSE | REPEAT;
    anothernewLabel.origin = CGPointMake(230,400);
}

-(void)methodToRunImmediately {
    
    for(int i = 0; i < [images count]; i++) {
        [self performSelector:@selector(animateObject:) 
                   withObject:[NSNumber numberWithInt:i] afterDelay:i*0.40];
    }
}

@end