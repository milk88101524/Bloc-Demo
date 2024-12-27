import 'dart:async';

// 定義事件類型的基類
abstract class CounterEvent {}

// 定義增加事件
class Increment extends CounterEvent {}

// 定義減少事件
class Decrement extends CounterEvent {}

// CounterStreamBloc 負責處理事件流與數據流的邏輯
class CounterStreamBloc {
  // 用於管理數據流的 StreamController，Stream 的數據類型為 int
  final _countController = StreamController<int>();

  // 用於接收事件的 StreamController，Stream  的數據類型為 CounterEvent
  final _countEventController = StreamController<CounterEvent>();

  // 保存當前的計數值
  int _count = 0;

  // Bloc 的構造函數，負責監聽事件的 Stream 並處理事件
  CounterStreamBloc() {
    // 監聽事件 Stream ，當事件發生時執行 _counterEvent 方法
    _countEventController.stream.listen(_counterEvent);
  }

  // 處理事件的方法
  void _counterEvent(CounterEvent event) {
    // 如果事件是 Increment，則計數值加 1
    if (event is Increment) {
      _count++;
    }
    // 如果事件是 Decrement，則計數值減 1
    else if (event is Decrement) {
      _count--;
    }

    // 將更新後的計數值推送到數據 Stream
    _countController.sink.add(_count);
  }

  // 提供數據 Stream 供外部監聽
  Stream<int> get steam => _countController.stream;

  // 提供事件入口供外部觸發事件
  Sink<CounterEvent> get counterEvent => _countEventController.sink;

  // 關閉所有 StreamController，釋放資源
  void dispose() {
    _countEventController.close();
    _countController.close();
  }
}
