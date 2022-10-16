package com.karl.open.desktop_app

import android.annotation.SuppressLint
import android.app.Service
import android.content.Intent
import android.graphics.PixelFormat
import android.os.IBinder
import android.util.DisplayMetrics
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.FrameLayout
import com.karl.open.desktop_app.utils.Utils
import io.flutter.embedding.android.FlutterSurfaceView
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterMain.findAppBundlePath

class WindowsService : Service() {
    // Flutter引擎组，可以自动管理引擎的生命周期
    private lateinit var engineGroup: FlutterEngineGroup

    private lateinit var engine: FlutterEngine

    private lateinit var flutterView: FlutterView
    private lateinit var windowManager: WindowManager

    private val metrics = DisplayMetrics()
    private lateinit var inflater: LayoutInflater

    @SuppressLint("InflateParams")
    private lateinit var rootView: ViewGroup

    private lateinit var layoutParams: WindowManager.LayoutParams

    override fun onCreate() {
        super.onCreate()
        layoutParams = WindowManager.LayoutParams(
            Utils.dip2px(this, 168.toFloat()),
            Utils.dip2px(this, 30.toFloat()),
            WindowManager.LayoutParams.TYPE_SYSTEM_ALERT,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
            PixelFormat.TRANSLUCENT
        )

        // 初始化变量
        windowManager = this.getSystemService(Service.WINDOW_SERVICE) as WindowManager
        inflater =
            this.getSystemService(Service.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        rootView = inflater.inflate(R.layout.floating, null, false) as ViewGroup
        engineGroup = FlutterEngineGroup(this)

        // 创建Flutter Engine
        val dartEntrypoint = DartExecutor.DartEntrypoint(findAppBundlePath(), "main")
        val option =
            FlutterEngineGroup.Options(this).setDartEntrypoint(dartEntrypoint)
        engine = engineGroup.createAndRunEngine(option)

        // 设置悬浮窗的位置
        @Suppress("Deprecation")
        windowManager.defaultDisplay.getMetrics(metrics)
        setPosition()
        @Suppress("ClickableViewAccessibility")
        rootView.setOnTouchListener { _, event ->
            when (event.action) {
                MotionEvent.ACTION_DOWN -> {
                    layoutParams.flags =
                        layoutParams.flags or WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                    windowManager.updateViewLayout(rootView, layoutParams)
                    true
                }
                else -> false
            }
        }

        engine.lifecycleChannel.appIsResumed()

        // 为悬浮窗加入布局
        rootView.findViewById<FrameLayout>(R.id.floating_window)
            .addView(
                flutterView,
                ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
                )
            )
        windowManager.updateViewLayout(rootView, layoutParams)
    }


    private fun setPosition() {
        // 设置位置
        val screenWidth = metrics.widthPixels
        val screenHeight = metrics.heightPixels
        layoutParams.x = (screenWidth - layoutParams.width) / 2
        layoutParams.y = (screenHeight - layoutParams.height) / 2

        windowManager.addView(rootView, layoutParams)
        flutterView = FlutterView(inflater.context, FlutterSurfaceView(inflater.context, true))
        flutterView.attachToFlutterEngine(engine)
    }
}