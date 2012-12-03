//
//  SceneLayer.m
//  BasicCocos2D
//
//  Created by Fan Tsai Ming on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneLayer.h"
#import "NewSceneLayer.h"

@implementation SceneLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];	
	SceneLayer *layer = [SceneLayer node];
	[scene addChild: layer];
  
	return scene;
}

#pragma mark -
#pragma mark Menu

-(void)setTransitionMenu {
  NSArray *stringArray = [[NSArray alloc]initWithObjects:
                          @"Fade",
                          @"CrossFade",
                          @"FadeDown",
                          @"FadeUp",
                          @"FadeTR",
                          @"FadeBL",
                          
                          @"SplitCols",
                          @"SplitRows",
                          @"TurnOffTiles",
                          
                          @"FlipY",
                          @"FlipX",
                          @"FlipAngular",
                          @"ZoomFlipAngular",
                          @"ZoomFlipY",
                          @"ZoomFlipX",
                          
                          @"JumpZoom",
                          @"RotoZoom",
                          
                          @"Scene",
                          @"SceneOriented",
                          @"ShrinkGrow",
                          
                          @"SlideInT",
                          @"SlideInB",
                          @"SlideInL",
                          @"SlideInR",
                          @"MoveInT",
                          @"MoveInB",
                          @"MoveInL",
                          @"MoveInR",
                          @"PageTurn",
                          
                          @"Progress",
                          @"ProgressVertical",
                          @"ProgressHorizontal",
                          @"ProgressOutIn",
                          @"ProgressInOut",
                          @"ProgressRadialCW",
                          @"ProgressRadialCCW",
                          nil];
  
  NSMutableArray *labelMArray = [[NSMutableArray alloc]init];
  
  for (int i=0; i<[stringArray count]; i++) {
    CCLabelTTF *label = [CCLabelTTF labelWithString:[stringArray objectAtIndex:i] fontName:@"Helvetica" fontSize:20];
    CCMenuItemLabel *menuItemLabel = [CCMenuItemLabel itemWithLabel:label target:self selector:@selector(transitionMenuTapped:)];
    menuItemLabel.tag = i;
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    //detect iphone or ipad
    float x;
    float y;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
      label.fontSize = 16;
      
      x = screenSize.width*0.25;
      y = screenSize.height - 24 - 24*i;
      if (i >= 12 && i < 24) {
        x = screenSize.width/2;
        y = screenSize.height - 24 - 24*(i-12);
      }else if (i >= 24) {
        x = screenSize.width*0.75 + 28;
        y = screenSize.height - 24 - 24*(i-24);
      }
    }else {
      x = screenSize.width/2 - 150;
      y = screenSize.height - 75 - 32*i;
      if (i >= 20) {
        x = screenSize.width/2 + 150;
        y = screenSize.height - 140 - 32*(i-20);
      }
    }
    [menuItemLabel setPosition:ccp(x, y)];
    
    [labelMArray addObject:menuItemLabel];
  }
  
  CCMenu *menu = [CCMenu menuWithArray:labelMArray];
  [menu setPosition:ccp(0, 0)];
  [self addChild:menu];
}

-(void)transitionMenuTapped:(CCMenuItemLabel*)sender
{
  CCScene *scene= [NewSceneLayer node];
  ccTime duration = 1.0;
  
  switch (sender.tag) {
    case 0:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFade transitionWithDuration:duration scene:scene]];break;
    case 1:
      [[CCDirector sharedDirector]pushScene:[CCTransitionCrossFade transitionWithDuration:duration scene:scene]];break;
    case 2:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFadeDown transitionWithDuration:duration scene:scene]];break;
    case 3:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFadeUp transitionWithDuration:duration scene:scene]];break;
    case 4:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFadeTR transitionWithDuration:duration scene:scene]];break;
    case 5:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFadeBL transitionWithDuration:duration scene:scene]];break;
    case 6:
      [[CCDirector sharedDirector]pushScene:[CCTransitionSplitCols transitionWithDuration:duration scene:scene]];break;
    case 7:
      [[CCDirector sharedDirector]pushScene:[CCTransitionSplitRows transitionWithDuration:duration scene:scene]];break;
    case 8:
      [[CCDirector sharedDirector]pushScene:[CCTransitionTurnOffTiles transitionWithDuration:duration scene:scene]];break;
    case 9:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFlipY transitionWithDuration:duration scene:scene]];break;
    case 10:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFlipX transitionWithDuration:duration scene:scene]];break;
    case 11:
      [[CCDirector sharedDirector]pushScene:[CCTransitionFlipAngular transitionWithDuration:duration scene:scene]];break;
    case 12:
      [[CCDirector sharedDirector]pushScene:[CCTransitionZoomFlipAngular transitionWithDuration:duration scene:scene]];break;
    case 13:
      [[CCDirector sharedDirector]pushScene:[CCTransitionZoomFlipY transitionWithDuration:duration scene:scene]];break;
    case 14:
      [[CCDirector sharedDirector]pushScene:[CCTransitionZoomFlipX transitionWithDuration:duration scene:scene]];break;
    case 15:
      [[CCDirector sharedDirector]pushScene:[CCTransitionJumpZoom transitionWithDuration:duration scene:scene]];break;
    case 16:
      [[CCDirector sharedDirector]pushScene:[CCTransitionRotoZoom  transitionWithDuration:duration scene:scene]];break;
    case 17:
      //not working
//      [[CCDirector sharedDirector]pushScene:[CCTransitionScene transitionWithDuration:duration scene:scene]];
      break;
    case 18:
      //not working
//      [[CCDirector sharedDirector]pushScene:[CCTransitionSceneOriented transitionWithDuration:duration scene:scene]];
      break;
    case 19:
      [[CCDirector sharedDirector]pushScene:[CCTransitionShrinkGrow transitionWithDuration:duration scene:scene]];break;
    case 20:
      [[CCDirector sharedDirector]pushScene:[CCTransitionSlideInT transitionWithDuration:duration scene:scene]];break;
    case 21:
      [[CCDirector sharedDirector]pushScene:[CCTransitionSlideInB transitionWithDuration:duration scene:scene]];break;
    case 22:
      [[CCDirector sharedDirector]pushScene:[CCTransitionSlideInL transitionWithDuration:duration scene:scene]];break;
    case 23:
      [[CCDirector sharedDirector]pushScene:[CCTransitionSlideInR transitionWithDuration:duration scene:scene]];break;
    case 24:
      [[CCDirector sharedDirector]pushScene:[CCTransitionMoveInT transitionWithDuration:duration scene:scene]];break;
    case 25:
      [[CCDirector sharedDirector]pushScene:[CCTransitionMoveInB transitionWithDuration:duration scene:scene]];break;
    case 26:
      [[CCDirector sharedDirector]pushScene:[CCTransitionMoveInL transitionWithDuration:duration scene:scene]];break;
    case 27:
      [[CCDirector sharedDirector]pushScene:[CCTransitionMoveInR transitionWithDuration:duration scene:scene]];break;
    case 28:
      [[CCDirector sharedDirector]pushScene:[CCTransitionPageTurn transitionWithDuration:duration scene:scene]];break;
    case 29:
      //not working, just crash
//      [[CCDirector sharedDirector]pushScene:[CCTransitionProgress transitionWithDuration:duration scene:scene]];
      break;
    case 30:
      [[CCDirector sharedDirector]pushScene:[CCTransitionProgressVertical transitionWithDuration:duration scene:scene]];break;
    case 31:
      [[CCDirector sharedDirector]pushScene:[CCTransitionProgressHorizontal transitionWithDuration:duration scene:scene]];break;
    case 32:
      [[CCDirector sharedDirector]pushScene:[CCTransitionProgressOutIn transitionWithDuration:duration scene:scene]];break;
    case 33:
      [[CCDirector sharedDirector]pushScene:[CCTransitionProgressInOut transitionWithDuration:duration scene:scene]];break;
    case 34:
      [[CCDirector sharedDirector]pushScene:[CCTransitionProgressRadialCW transitionWithDuration:duration scene:scene]];break;
    case 35:
      [[CCDirector sharedDirector]pushScene:[CCTransitionProgressRadialCCW transitionWithDuration:duration scene:scene]];break;
      
    default:
      break;
  }
}

#pragma mark -
#pragma mark Background

-(void)setBackgroundLayer {
  CCLayerColor *backgroundLayerColor = [CCLayerColor layerWithColor:ccc4(240, 125, 125, 255)];
  [self addChild:backgroundLayerColor z:-1];
}

#pragma mark -
#pragma mark Init

/*
 Target: Set two CCScene and play many types of transition effects.
 
 1. Set two CCScene.
 2. Add the colourful background
 3. Set the transition menu and trigger many types of transition effects
 */

-(id) init
{
	if( (self=[super init])) {
    [self setBackgroundLayer];
    
    [self setTransitionMenu];
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end
