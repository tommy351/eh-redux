package app.ehreader

import android.os.Build
import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "app.ehreader/main";

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            window.apply {
                setFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS, WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS)
            }
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler { call, result ->
            if (call.method == "getPaddings") {
                result.success(getPaddings())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getStatusBarHeight(): Int {
        val resources = activity.baseContext.resources
        val resourceId = resources.getIdentifier("status_bar_height", "dimen", "android")

        if (resourceId > 0) return resources.getDimensionPixelSize(resourceId)
        return 0;
    }

    private fun getNavigationBarHeight(): Int {
        val resources = activity.baseContext.resources
        val resourceId = resources.getIdentifier("navigation_bar_height", "dimen", "android")

        if (resourceId > 0) return resources.getDimensionPixelSize(resourceId)
        return 0;
    }

    private fun getPaddings(): List<Int> {
        return listOf(getStatusBarHeight(), getNavigationBarHeight())
    }
}
