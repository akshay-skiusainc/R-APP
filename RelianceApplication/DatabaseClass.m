//
//  DatabaseClass.m
//  Dabangg2App
//
//  Created by Javed Sunesra on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DatabaseClass.h"

@interface DatabaseClass ()

@end

@implementation DatabaseClass

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self DATABASECALLED];
      

    // Do any additional setup after loading the view from its nib.
}


-(void)DATABASECALLED
{
	NSString *docsDir;
	NSArray *dirPaths;
	
	// Get the documents directory
	dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	docsDir = [dirPaths objectAtIndex:0];
	
	// Build the path to the database file
	databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"App.db"]];
	
	NSFileManager *filemgr = [NSFileManager defaultManager];
	
	if ([filemgr fileExistsAtPath: databasePath ] == NO)
	{
		const char *dbpath = [databasePath UTF8String];
		
		if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
		{
			char *errMsg;
			const char *sql_stmt = "CREATE TABLE IF NOT EXISTS USER (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT,  PHONE TEXT, EMAIL TEXT, USERNAME TEXT, IMAGE BLOB)";
			
			if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
			{
				NSLog(@"DB CREATED");
			}
			
			sqlite3_close(contactDB);
			
		} else {
		}
	}
	
	
	
	NSLog(@"reached");

}

-(void)saveData:(NSString*)insertSQL1
{
    NSLog(@"query==%@",insertSQL1);

	sqlite3_stmt    *statement;
	
	const char *dbpath = [databasePath UTF8String];
	
	if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
	{
		const char *insert_stmt = [insertSQL1 UTF8String];
		
		sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
		if (sqlite3_step(statement) == SQLITE_DONE)
		{
            NSLog(@"query inserted");
		} else {
            NSLog(@"query not inserted");
		}
		sqlite3_finalize(statement);
		sqlite3_close(contactDB);
        
	}
}


-(void)displayAll:(NSString*)qSQL
{
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK) 
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
              //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                
                MobileNo = [NSString stringWithFormat:@"%@",Field1];
              //  ProfilePic = [[NSString stringWithFormat:@"%@",Field2] retain];
                
                
			}
			NSLog(@"MOB=%@",MobileNo);
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}

-(void)displayVideoData:(NSString*)qSQL
{
    
    NSLog(@"qSQL=%@",qSQL);
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK)
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
            int i=0;
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
				NSString *Field3 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2) ];
				NSString *Field4 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 3) ];
				NSString *Field5 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 4) ];
				NSString *Field6 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 5) ];
				NSString *Field7 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 6) ];
				NSString *Field8 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 7) ];
//				NSString *Field9 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 8) ];
//				NSString *Field10 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement,9) ];
                //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                
                data1[i] = [NSString stringWithFormat:@"%@",Field1];
                data2[i] = [NSString stringWithFormat:@"%@",Field2];
                data3[i] = [NSString stringWithFormat:@"%@",Field3];
                data4[i] = [NSString stringWithFormat:@"%@",Field4];
                data5[i] = [NSString stringWithFormat:@"%@",Field5];
                data6[i] = [NSString stringWithFormat:@"%@",Field6];
                data7[i] = [NSString stringWithFormat:@"%@",Field7];
                data8[i] = [NSString stringWithFormat:@"%@",Field8];
//                data9[i] = [NSString stringWithFormat:@"%@",Field9];
//                data10[i] = [NSString stringWithFormat:@"%@",Field10];

                //  ProfilePic = [[NSString stringWithFormat:@"%@",Field2] retain];
                
                
                i++;
                
			}
            TotalData=i;
			NSLog(@"TotalData=%d",TotalData);
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}


-(void)displayCHATUSER:(NSString*)qSQL
{
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK)
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                
                CHATUSERNAME = [NSString stringWithFormat:@"%@",Field1];
                CHATPASSWORD = [NSString stringWithFormat:@"%@",Field2];

                //  ProfilePic = [[NSString stringWithFormat:@"%@",Field2] retain];
                
                
			}
			NSLog(@"MOB=%@",MobileNo);
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}

-(void)displayBlockeduser:(NSString*)qSQL
{
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	
    int i=0;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK)
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                
                Blockedusers[i] = [NSString stringWithFormat:@"%@",Field1];
                //  ProfilePic = [[NSString stringWithFormat:@"%@",Field2] retain];
                
                i++;
			}
            totalblockedusers=i;
			NSLog(@"MOB=%d",totalblockedusers);
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}

-(void)getMusicLib:(NSString*)qSQL
{
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	 int i = 0;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK) 
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
           
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                NSString *Field3 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2) ];

                //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                WebViewLinks[i] = [NSString stringWithFormat:@"%@",Field1];

                MusicLinks[i] = [NSString stringWithFormat:@"%@",Field2];
                
                IsDownloaded[i] = [NSString stringWithFormat:@"%@",Field3];
                
            
                NSLog(@"d=%@",IsDownloaded[i]);
                i++;
                
			}
            NumOfRows = i;
            NSLog(@"NumOfRows=%d",NumOfRows);

			
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}


-(void)getRingtoneLib:(NSString*)qSQL
{
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
    int i = 0;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK) 
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
            
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                NSString *Field3 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2) ];
                
                //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                WebViewRingtoneLinks[i] = [NSString stringWithFormat:@"%@",Field1];
                
                MusicLinks[i] = [NSString stringWithFormat:@"%@",Field2];
                
                IsDownloaded[i] = [NSString stringWithFormat:@"%@",Field3];
                
                
                NSLog(@"d=%@",IsDownloaded[i]);
                i++;
                
			}
            NumOfRows = i;
            NSLog(@"NumOfRows=%d",NumOfRows);
            
			
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}


-(void)getPhotoGallery:(NSString*)qSQL
{
	NSLog(@"getPhotoGallery");
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
    int i = 0;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK) 
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			NSLog(@"getPhotoGallery");

            
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSLog(@"getPhotoGallery");

				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
				NSString *Field3 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2) ];
				NSString *Field4 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 3) ];
				NSString *Field5 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 4) ];

                
                //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                smallwallpaper[i] = [NSString stringWithFormat:@"%@",Field1];
                
                
                Bigwallpaper[i] = [NSString stringWithFormat:@"%@",Field2];
				
				wallpapertype[i] = [NSString stringWithFormat:@"%@",Field3];
				IsImageDownloaded[i] = [NSString stringWithFormat:@"%@",Field4];


				wallpaperID = [NSString stringWithFormat:@"%@",Field5];
                
                NSLog(@"isimage=%@",IsImageDownloaded[i]);
			NSLog(@"wallpaperID=%@",wallpaperID);

                i++;
                
			}
            	NSLog(@"getPhotoGallery");

            
            NumOfRows = i;
            
            NSLog(@"NumOfRows=%d",NumOfRows);
			
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}


-(void)getChat:(NSString*)qSQL
{
	NSLog(@"getchat=%@",qSQL);
	const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	int i = 0;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK)
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			NSLog(@"getPhotoGallery");
			
			
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSLog(@"getPhotoGallery");
				
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
				NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
				NSString *Field3 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2) ];
				NSString *Field4 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 3) ];
				NSString *Field5 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 4) ];
				NSString *Field6 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 5) ];

				
				//  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
				USERNAME[i] = [NSString stringWithFormat:@"%@",Field1];
				
				
				MESSAGE[i] = [NSString stringWithFormat:@"%@",Field2];
				
				DATE[i] = [NSString stringWithFormat:@"%@",Field3];
				TIME[i] = [NSString stringWithFormat:@"%@",Field4];
				
				
				MESSAGEID[i] = [NSString stringWithFormat:@"%@",Field5];
				USERID[i] = [NSString stringWithFormat:@"%@",Field6];

				NSLog(@"USERNAME=%@",USERNAME[i]);
				
				i++;
				
			}
			
			
			NumOfRows = i;
			
			NSLog(@"NumOfRows=%d",NumOfRows);
			
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}

-(void)getMaxID:(NSString*)qSQL
{
	NSLog(@"getchat");
	const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK)
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			NSLog(@"getPhotoGallery");
			
			
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSLog(@"getPhotoGallery");
				
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSLog(@"MAKID=%@",Field1);

//				if([Field1 isEqualToString:@""])
//				{
//					MAXID=[NSString stringWithFormat:@"0"];
//
//				}
//				else{
				MAXID=[NSString stringWithFormat:@"%@",Field1];
							
			//	}
			}
			
			NSLog(@"MAKID=%@",MAXID);

			
			
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}



-(void)getProfileDetails:(NSString*)qSQL
{
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK)
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
            
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                
                //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                MobileNo = [NSString stringWithFormat:@"%@",Field1];
                
                
                Email = [NSString stringWithFormat:@"%@",Field2];
                
                
                NSLog(@"MobileNo=%@",MobileNo);
                
			}
            
            
           
			
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}



-(void)SwitchDetails:(NSString*)qSQL
{
    const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt   *statement;
	if (sqlite3_open(dbpath, &contactDB)== SQLITE_OK) 
	{
		const char *q_stmt =[qSQL UTF8String];
		if (sqlite3_prepare_v2(contactDB, q_stmt, -1, &statement, NULL)==SQLITE_OK) {
			
            
			while (sqlite3_step(statement)==SQLITE_ROW) {
				NSString *Field1 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0) ];
                NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                NSString *Field3 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 2) ];
                
                //  NSString *Field2 =[[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 1) ];
                set[0] = [NSString stringWithFormat:@"%@",Field1];
                
                set[1] = [NSString stringWithFormat:@"%@",Field2];
                
                set[2] = [NSString stringWithFormat:@"%@",Field3];
                
           
                
			}
            
			
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
	
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
