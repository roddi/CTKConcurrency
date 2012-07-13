//
//  CTKLog.h
//  CTKConcurrency
//
//  Created by Ruotger Skupin on 13.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



#ifdef DEBUG
#	define CTKLog(fmt, ...) NSLog((@"[# %U] %s (%d) " fmt), (unsigned int)CTKCurrentThreadNumber(), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define CTKLog(fmt, ...)
#endif

#ifdef DEBUG
#	define CTKConditionalLog(condition, fmt, ...) if(condition) NSLog((@"[# %U] %s (%d) " fmt), (unsigned int)CTKCurrentThreadNumber(), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define CTKConditionalLog(condition, fmt, ...)
#endif

#define CTKWarningLog(fmt, ...)  NSLog((@"<Warning>: [# %d] %s (%d) " fmt), (int)CTKCurrentThreadNumber(), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#define CTKErrorLog(fmt, ...)  NSLog((@"<Error>: [# %d] %s (%d) " fmt), (int)CTKCurrentThreadNumber(), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

