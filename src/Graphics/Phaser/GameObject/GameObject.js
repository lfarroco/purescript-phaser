export const newGameObjectImpl = (a, b) =>
  new Phaser.GameObjects.GameObject(a, b);

export const activeImpl = obj => obj.active;

export const bodyImpl = obj => obj.body;

export const cameraFilterImpl = obj => obj.cameraFilter;

export const dataImpl = obj => obj.data;

export const displayListImpl = obj => obj.displayList;

export const ignoreDestroyImpl = obj => obj.ignoreDestroy;

export const inputImpl = obj => obj.input;

export const nameImpl = obj => obj.name;

export const parentContainerImpl = obj => obj.parentContainer;

export const renderFlagsImpl = obj => obj.renderFlags;

export const sceneImpl = obj => obj.scene;

export const stateImpl = obj => obj.state;

export const tabIndexImpl = obj => obj.tabIndex;

export const typeImpl = obj => obj.type;

export const addToDisplayListImpl = (obj) => obj.addToDisplayList();

export const addtoUpdateListImpl = (obj) => obj.addtoUpdateList();

export const addToSceneImpl = (obj) => obj.addToScene();

export const destroyImpl = (obj) => obj.destroy();

export const disableInteractiveImpl = (obj) => obj.disableInteractive();

export const getDataImpl = (a, obj) => obj.getData(a);

export const getIndexListImpl = (obj) => obj.getIndexList();

export const incDataImpl = (a, obj) => obj.incData(a);

export const removeFromDisplayListImpl = (obj) => obj.removeFromDisplayList();

export const removeFromUpdateListImpl = (obj) => obj.removeFromUpdateList();

export const removeInteractiveImpl = (obj) => obj.removeInteractive();

export const removedFromSceneImpl = (obj) => obj.removedFromScene();

export const setActiveImpl = (a, obj) => obj.setActive(a);

export const setDataImpl = (a, obj) => obj.setData(a);

export const setDataEnabledImpl = (obj) => obj.setDataEnabled();

export const setInteractiveImpl = (obj) => obj.setInteractive();

export const setNameImpl = (a, obj) => obj.setName(a);

export const setStateImpl = (a, obj) => obj.setState(a);

export const toJSONImpl = (obj) => obj.toJSON();

export const toggleDataImpl = (a, obj) => obj.toggleData(a);

export const updateImpl = (obj) => obj.update();

export const willRenderImpl = (a, obj) => obj.willRender(a);
