export const newEventEmitterImpl = (a) =>
  new Phaser.Events.EventEmitter(a);

export const addListenerImpl = (a, b, obj) => obj.addListener(a, b);

export const destroyImpl = (obj) => obj.destroy();

export const emitImpl = (a, obj) => obj.emit(a);

export const eventNamesImpl = (obj) => obj.eventNames();

export const listenerCountImpl = (a, obj) => obj.listenerCount(a);

export const listenersImpl = (a, obj) => obj.listeners(a);

export const offImpl = (a, obj) => obj.off(a);

export const onImpl = (a, b, obj) => obj.on(a, b);

export const onceImpl = (a, b, obj) => obj.once(a, b);

export const removeAllListenersImpl = (obj) => obj.removeAllListeners();

export const removeListenerImpl = (a, obj) => obj.removeListener(a);

export const shutdownImpl = (obj) => obj.shutdown();
