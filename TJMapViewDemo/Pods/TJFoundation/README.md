TJFoundation aims to extend Core Foundation by providing base classes and extending core classes with useful features that most iOS project would need.

# Installation

**TJFoundation is a work in progress, and has not been thoroughly tested. Use at you own risks.**

TJFoundation uses Cocoa Pods. Add our Specs repository :

    pod repo add Specs git@github.com:thomasjoulin/Specs.git

Then in your project add `pod 'TJFoundation` in your Podfile or create one :

	platform :ios
	pod 'TJFoundation'

# Example

See the headers for full listing. The content (classes, methods and documentation) will improve over time. Please make pull request if you have any useful methods to add or a fix.

## Categories

### NSString

	- (BOOL)isValidEmail;

Returns TRUE if the email is valid, FALSE otherwise

	+ (NSString *)stringFromBool;

Converts a BOOL to a readable NSString.

	NSString	*valid = @"email@example.com";
	NSString	*invalid = @"email.com";

	NSLog(@"%@ is valid ? %@", valid, [NSString stringFromBool:[valid isValidEmail]]);
	// email@example.com is valid ? TRUE
	
	NSLog(@"%@ is valid ? %@", invalid, [NSString stringFromBool:[invalid isValidEmail]]);
	// email.com is valid ? FALSE

### NSDate

	- (NSString *)stringWithFormat:(NSString *)format;
	
Returns the string value of an NSDate with the specific format. Example :

	NSDate 		*date = [NSDate date];
	NSString	*formatted_date = [date stringWithFormat:@"dd/MM/yy"];
	
	NSLog(@"%@", formatted_date);
	// 09/01/12
