export const phaser = () => Phaser;

export const __getProp = (path, obj) => obj[path];
export const __setProp = (path, val, obj) => {
  obj[path] = val;
};

export const __new0 = (fn) => new fn();
export const __new1 = (v1, fn) => new fn(v1);

export const __return0 = (prop, obj) => obj[prop]();
export const __return1 = (prop, v1, obj) => obj[prop](v1);
export const __return2 = (prop, v1, v2, obj) => obj[prop](v1, v2);
export const __return3 = (prop, v1, v2, v3, obj) => obj[prop](v1, v2, v3);
export const __return4 = (prop, v1, v2, v3, v4, obj) =>
  obj[prop](v1, v2, v3, v4);
export const __return5 = (prop, v1, v2, v3, v4, v5, obj) =>
  obj[prop](v1, v2, v3, v4, v5);
export const __return6 = (prop, v1, v2, v3, v4, v5, v6, obj) =>
  obj[prop](v1, v2, v3, v4, v5, v6);

export const _listener0 = (fn) => () => fn();
export const _listener1 = (fn) => (v1) => fn(v1)();
export const _listener2 = (fn) => (v1, v2) => fn(v1)(v2)();
export const _listener3 = (fn) => (v1, v2, v3) => fn(v1)(v2)(v3)();
export const _listener4 = (fn) => (v1, v2, v3, v4) => fn(v1)(v2)(v3)(v4)();
export const _listener5 = (fn) => (v1, v2, v3, v4, v5) =>
  fn(v1)(v2)(v3)(v4)(v5)();
