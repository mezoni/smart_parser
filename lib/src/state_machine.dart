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
