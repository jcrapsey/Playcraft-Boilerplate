/*
Playcraft Shim
*/

define(["playcraft/input", "playcraft/hashmap", "playcraft/tools", "playcraft/color", "playcraft/debug", "playcraft/device", "playcraft/sound", "playcraft/layer", "playcraft/entitylayer", "playcraft/tileset", "playcraft/tilemap", "playcraft/tilelayer", "playcraft/entity", "playcraft/sprite", "playcraft/spritesheet", "playcraft/math", "playcraft/image", "playcraft/scene", "playcraft/game", "playcraft/loader", "playcraft/dataresource", "playcraft/components/component", "playcraft/components/physics", "playcraft/components/alpha", "playcraft/components/joint", "playcraft/components/expiry", "playcraft/components/originshifter", "playcraft/components/spatial", "playcraft/components/overlay", "playcraft/components/clip", "playcraft/components/activator", "playcraft/components/input", "playcraft/components/fade", "playcraft/components/rect", "playcraft/components/text", "playcraft/components/sprite", "playcraft/components/layout", "playcraft/components/particleemitter", "playcraft/es/entitymanager", "playcraft/es/systemmanager", "playcraft/systems/system", "playcraft/systems/entitysystem", "playcraft/systems/physics", "playcraft/systems/effects", "playcraft/systems/particles", "playcraft/systems/input", "playcraft/systems/expiry", "playcraft/systems/activation", "playcraft/systems/render", "playcraft/systems/layout"], function() {
  var pc;
  console.log('Script -> Lib : Playcraft -- Loaded');
  pc = window.pc;
  return pc;
});
