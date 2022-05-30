export const __getProp = (path, obj) => obj[path];

export const __runFn = (fn, args) => fn(...args);

export const __method = (prop, args, obj) => obj[prop](...args);
