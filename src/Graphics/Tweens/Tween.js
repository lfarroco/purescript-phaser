export const addTweenImpl = (config) => {
  let tweenConfig = {...config,  ...config.prop };

  delete tweenConfig.scene

  tweenConfig.onComplete = function () {
    config.callback(config.scene)();
  };

  return () => {
    config.scene.add.tween(tweenConfig);
  };
};
