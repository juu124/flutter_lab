package com.example.flutter_lab

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        //channel 준비.. flutter 와 동일 이름..
        val channel = BasicMessageChannel<String>(flutterEngine.dartExecutor, "myMessageChannel",
            StringCodec.INSTANCE);
        //flutter 의 메시지 수신..
        channel.setMessageHandler { message, reply ->
            //B/L 실행하고..
            //결과 반환..
            reply.reply("Reply from Android")
            //only test....
            //native -> flutter..
            channel.send("Hello from Android") { reply ->
                Log.d("kkang", "reply : $reply")
            }
        }

        //method..........................................
        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "myMethodChannel")
        methodChannel.setMethodCallHandler { call, result ->
            if(call.method == "oneMethod"){
                //데이터 획득..
                val map = call.arguments as Map<String, String>
                Log.d("kkang", "argument : ${map.get("data1")}")
                result.success(mapOf("one" to  10, "two" to 20))

                //only test...
                methodChannel.invokeMethod("twoMethod", "Hello from Android Method",
                    object : MethodChannel.Result {
                        override fun success(result: Any?) {
                            Log.d("kkang", "result : ${result as String}")
                        }

                        override fun error(
                            errorCode: String,
                            errorMessage: String?,
                            errorDetails: Any?
                        ) {

                        }

                        override fun notImplemented() {

                        }
                    })
            }
        }
    }
}