export const addTweenImpl = (config) => {
  // spread passed prop into the config object
  Object.assign(config, config.prop);

  config.onComplete = function () {
    config.callback(config.scene)();
  };

  return () => {
    config.scene.add.tween(config);
  };
};
