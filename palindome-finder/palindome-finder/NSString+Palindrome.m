//
//  NSString+Palindrome.m
//  palindome-finder
//
//  Created by Matt Amerige on 6/8/16.
//  Copyright © 2016 Wubbyland. All rights reserved.
//

#import "NSString+Palindrome.h"

@implementation NSString (Palindrome)

/**
 Returns YES if the receiver is a palindrome, otherwise returns NO
 */
- (BOOL)isPalindrome
{
	// Remove punctuation
	NSCharacterSet *punctuation = [NSCharacterSet punctuationCharacterSet];
	NSString *noPunctuation = [self stringByTrimmingCharactersInSet:punctuation];
	
	// Remove Whitespace
	NSString *noWhitespace = [noPunctuation stringByReplacingOccurrencesOfString:@" " withString:@""];
	
	// Remove case
	NSString *resultString = [noWhitespace lowercaseString];
	
	NSUInteger endIndex = resultString.length - 1;
	for (NSUInteger startIndex = 0; startIndex < resultString.length / 2; startIndex++) {
		unichar start = [resultString characterAtIndex:startIndex];
		unichar end = [resultString characterAtIndex:endIndex];
		if (start != end) {
			return NO;
		}
		endIndex--;
	}
	return YES;
}

@end
