//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <connectivity_plus_windows/connectivity_plus_windows_plugin.h>
#include <desktop_multi_window/desktop_multi_window_plugin.h>
#include <flutter_multi_windows/flutter_multi_windows_plugin_c_api.h>
#include <flutter_native_ability/flutter_native_ability_plugin_c_api.h>
#include <screen_retriever/screen_retriever_plugin.h>
#include <sentry_flutter/sentry_flutter_plugin.h>
#include <udisdk/udisdk_plugin.h>
#include <window_manager/window_manager_plugin.h>
#include <windows_single_instance/windows_single_instance_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  DesktopMultiWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopMultiWindowPlugin"));
  FlutterMultiWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterMultiWindowsPluginCApi"));
  FlutterNativeAbilityPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterNativeAbilityPluginCApi"));
  ScreenRetrieverPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverPlugin"));
  SentryFlutterPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SentryFlutterPlugin"));
  UdisdkPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UdisdkPlugin"));
  WindowManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowManagerPlugin"));
  WindowsSingleInstancePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowsSingleInstancePlugin"));
}
