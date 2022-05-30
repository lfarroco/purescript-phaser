export const _getProp = (path, obj) => obj[path];

export const _runFn = (fn, args) => fn(...args);

export const _method = (prop, args, obj) => obj[prop](...args);
