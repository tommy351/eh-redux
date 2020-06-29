package app.ehredux

import android.os.Build
import android.os.Bundle
import android.view.KeyEvent
import android.view.View
import com.uchuhimo.collections.biMapOf
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodChannel
import io.reactivex.rxjava3.disposables.Disposable
import io.reactivex.rxjava3.kotlin.subscribeBy
import io.reactivex.rxjava3.subjects.PublishSubject

class MainActivity : FlutterActivity() {
    companion object {
        const val METHOD_CHANNEL = "app.ehredux/method"
        const val KEY_DOWN_EVENT_CHANNEL = "app.ehredux/event/keyDown"

        val KEYCODE_MAP = biMapOf(
            "volumeDown" to KeyEvent.KEYCODE_VOLUME_DOWN,
            "volumeUp" to KeyEvent.KEYCODE_VOLUME_UP
        )
    }

    private val interceptedKeyDownEvents = HashSet<Int>()
    private val keyDownSubject = PublishSubject.create<String>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.decorView.systemUiVisibility = View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                    View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor, KEY_DOWN_EVENT_CHANNEL).setStreamHandler(object : StreamHandler {
            var dispose: Disposable? = null

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                dispose = keyDownSubject.subscribeBy (
                    onNext = { events?.success(it) },
                    onError = { events?.error("KEY_DOWN_EVENT", it.message, it) },
                    onComplete = { events?.endOfStream() }
                )
            }

            override fun onCancel(arguments: Any?) {
                dispose?.dispose()
                dispose = null
            }
        })

        MethodChannel(flutterEngine.dartExecutor, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "interceptKeyDown" -> {
                    val arg = call.arguments
                    val code = KEYCODE_MAP[arg]

                    if (code != null) {
                        interceptedKeyDownEvents.add(code)
                        result.success(code)
                    } else {
                        result.error("UNKNOWN_KEY", "Unknown key: $arg", null)
                    }
                }
                "uninterceptKeyDown" -> {
                    val arg = call.arguments
                    val code = KEYCODE_MAP[arg]

                    if (code != null) {
                        interceptedKeyDownEvents.remove(code)
                        result.success(code)
                    } else {
                        result.error("UNKNOWN_KEY", "Unknown key: $arg", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        KEYCODE_MAP.inverse[keyCode]?.let {
            keyDownSubject.onNext(it)
        }

        if (interceptedKeyDownEvents.contains(keyCode)) {
            return true
        }

        return super.onKeyDown(keyCode, event)
    }
}
