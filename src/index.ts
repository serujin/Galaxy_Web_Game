import * as PIXI from "pixi.js";

const app = new PIXI.Application({
    width: window.innerWidth,
    height: window.innerHeight,
    antialias: true
});

window.addEventListener('resize', (event) => {
    app.renderer.resize(window.innerWidth, window.innerHeight);
});

app.renderer.backgroundColor = 0x061639;

document.body.appendChild(app.view);