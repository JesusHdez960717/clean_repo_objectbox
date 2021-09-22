#import "CleanRepoObjectboxPlugin.h"
#if __has_include(<clean_repo_objectbox/clean_repo_objectbox-Swift.h>)
#import <clean_repo_objectbox/clean_repo_objectbox-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "clean_repo_objectbox-Swift.h"
#endif

@implementation CleanRepoObjectboxPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCleanRepoObjectboxPlugin registerWithRegistrar:registrar];
}
@end
