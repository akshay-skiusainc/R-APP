

#import <UIKit/UIKit.h>

@class ChatViewController;


@interface FaceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
	NSMutableArray            *_phraseArray;
	ChatViewController        *_chatViewController;
    
    
}

@property (retain, nonatomic) IBOutlet UIScrollView *faceScrollView;
@property (nonatomic, retain) NSMutableArray            *phraseArray;
@property (nonatomic, retain) ChatViewController        *chatViewController;
@property (nonatomic, nonatomic) IBOutlet UIImageView *headerImage;

-(IBAction)dismissMyselfAction:(id)sender;
- (void)showEmojiView;
@end
