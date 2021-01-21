#import "EsFlutterPlugin.h"
#if __has_include(<es_flutter_plugin/es_flutter_plugin-Swift.h>)
#import <es_flutter_plugin/es_flutter_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "es_flutter_plugin-Swift.h"
#endif

@implementation EsFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEsFlutterPlugin registerWithRegistrar:registrar];
}
@end
