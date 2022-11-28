import '@geckos.io/phaser-on-nodejs';
import 'phaser';

global.window.cancelAnimationFrame = () => {};

export const phaserJS = () => {
  console.log('Loaded test nodejs + jsdom + phaser environment');
};
