class AcceptEvent<O> {
  final O output;

  final bool isConst;

  final String result;

  final String value;

  AcceptEvent({
    required this.output,
    required this.isConst,
    required this.result,
    required this.value,
  });
}

class EventSource<E> {
  final List<void Function(E event)> _listeners = [];

  void clear() {
    _listeners.clear();
  }

  void listen(void Function(E event) f) {
    _listeners.add(f);
  }

  void notify(E event) {
    final listeners = _listeners.toList();
    for (var i = 0; i < listeners.length; i++) {
      final listener = listeners[i];
      listener(event);
    }
  }
}

class State<O> {
  final EventSource<AcceptEvent<O>> onAccept = EventSource();

  final EventSource<O> onPreprocess = EventSource();

  final EventSource<O> onProcess = EventSource();

  final EventSource<O> onPostprocess = EventSource();

  final EventSource<O> onReject = EventSource();

  bool _processed = false;

  void accept(AcceptEvent<O> event) => onAccept.notify(event);

  void build(O event) {
    if (_processed) {
      throw StateError(
        'Unable to begin processing state, state state is already being processed',
      );
    }

    _processed = true;
    onPreprocess.notify(event);
    onProcess.notify(event);
    onPostprocess.notify(event);
    _processed = false;
  }

  void reject(O event) => onReject.notify(event);

  @override
  String toString() {
    return 'State $hashCode';
  }
}

class State2<O> {
  final EventSource<AcceptEvent<O>> _onAccept = EventSource();

  final EventSource<O> _onPreprocess = EventSource();

  final EventSource<O> _onProcess = EventSource();

  final EventSource<O> _onPostprocess = EventSource();

  final EventSource<O> _onReject = EventSource();

  String? _listener;

  bool _processed = false;

  void accept(AcceptEvent<O> event) {
    _onAccept.notify(event);
  }

  void build(O event) {
    if (_processed) {
      throw StateError(
        'Unable to begin processing state, state state is already being processed',
      );
    }

    _processed = true;
    _notify('onPreprocess', _onPreprocess, event);
    _notify('onProcess', _onProcess, event);
    _notify('onPostprocess', _onPostprocess, event);
    _processed = false;
  }

  void onAccept(void Function(AcceptEvent<O> event) listener) {
    _checkNotInsideListener('onAccept');
    _onAccept.listen(listener);
  }

  void onPostprocess(void Function(O event) listener) {
    _checkNotInsideListener('Postprocess');
    _onPostprocess.listen(listener);
  }

  void onPreprocess(void Function(O event) listener) {
    _checkNotInsideListener('onPreprocess');
    _onPreprocess.listen(listener);
  }

  void onProcess(void Function(O event) listener) {
    _checkNotInsideListener('onProcess');
    _onProcess.listen(listener);
  }

  void onReject(void Function(O event) listener) {
    _checkNotInsideListener('onReject');
    _onReject.listen(listener);
  }

  void reject(O event) => _onReject.notify(event);

  @override
  String toString() {
    return 'State $hashCode';
  }

  void _checkNotInsideListener(String name) {
    if (_listener != null) {
      throw StateError(
        'Unable notify about \'$name\' inside \'$_listener\' listener',
      );
    }
  }

  void _notify<T>(String name, EventSource<T> eventSource, T event) {
    if (_listener != null) {
      throw StateError(
        'Unable listen to \'$name\' inside \'$_listener\' listener',
      );
    }

    _listener = name;
    eventSource.notify(event);
    _listener = null;
  }
}
