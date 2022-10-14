package com.karl.open.desktop_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.TransparencyMode

class MainActivity: FlutterActivity() {
    override fun getTransparencyMode(): TransparencyMode {
        // 设置窗口背景透明
        return TransparencyMode.transparent
    }

    override fun onResume() {
        super.onResume()
        setFinishOnTouchOutside(false) // 点击外部，dialog不消失
        // 设置窗口全屏
        var lp = window.attributes
        lp.width = -1
        lp.height = -1
        window.attributes = lp
    }
}
