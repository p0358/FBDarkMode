%ctor {

	NSURL *fileManagerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.facebook.Facebook"];
	NSString *path = [NSString stringWithFormat:@"%@%@", fileManagerURL.path, @"/Library/Preferences/group.com.facebook.Facebook.plist"];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];

	NSMutableDictionary *startupConfigs = [dict objectForKey:@"FBMobileConfigStartupConfigs"];

	for (NSString *key in startupConfigs) {
		if ([key hasPrefix:@"ios_darkmode_"]) {
			if ([[[startupConfigs objectForKey:key] objectForKey:@"v"] boolValue] == NO) {
				[[startupConfigs objectForKey:key] setObject:@YES forKey:@"v"];
			}
		}
	}

	[dict writeToFile:path atomically:YES];

}
