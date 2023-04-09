export const newGameImpl = (a) =>
  new Phaser.Game(a);

// export const animsImpl = obj => obj.anims;

// export const cacheImpl = obj => obj.cache;

// export const canvasImpl = obj => obj.canvas;

// export const configImpl = obj => obj.config;

// export const contextImpl = obj => obj.context;

// export const deviceImpl = obj => obj.device;

// export const domContainerImpl = obj => obj.domContainer;

export const eventsImpl = obj => obj.events;

// export const facebookImpl = obj => obj.facebook;

export const hasFocusImpl = obj => obj.hasFocus;

// export const inputImpl = obj => obj.input;

export const isBootedImpl = obj => obj.isBooted;

export const isPausedImpl = obj => obj.isPaused;

export const isRunningImpl = obj => obj.isRunning;

// export const loopImpl = obj => obj.loop;

// export const pluginsImpl = obj => obj.plugins;

// export const registryImpl = obj => obj.registry;

// export const rendererImpl = obj => obj.renderer;

// export const scaleImpl = obj => obj.scale;

// export const sceneImpl = obj => obj.scene;

// export const soundImpl = obj => obj.sound;

// export const texturesImpl = obj => obj.textures;

export const bootImpl = (obj) => obj.boot();

export const destroyImpl = (a, obj) => obj.destroy(a);

export const getFrameImpl = (obj) => obj.getFrame();

export const getTimeImpl = (obj) => obj.getTime();

export const headlessStepImpl = (a, b, obj) => obj.headlessStep(a, b);

export const onBlurImpl = (obj) => obj.onBlur();

export const onFocusImpl = (obj) => obj.onFocus();

export const onHiddenImpl = (obj) => obj.onHidden();

export const onVisibleImpl = (obj) => obj.onVisible();

export const pauseImpl = (obj) => obj.pause();

export const resumeImpl = (obj) => obj.resume();

export const startImpl = (obj) => obj.start();

export const stepImpl = (a, b, obj) => obj.step(a, b);
