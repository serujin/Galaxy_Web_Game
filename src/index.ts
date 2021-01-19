import * as PIXI from "pixi.js";

const app = new PIXI.Application({
    width: 256,
    height: 256,
    antialias: true
});

app.renderer.backgroundColor = 0x061639;

document.body.appendChild(app.view);