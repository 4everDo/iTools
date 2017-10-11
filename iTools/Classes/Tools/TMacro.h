//
//  Macro.h
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/* UI  */

#define T_SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define T_SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height



/* Log */
#ifdef DEBUG

    #define TLog(...)  NSLog(__VA_ARGS__)
    #else

    #define TLog(...)
#endif




#endif /* Macro_h */
