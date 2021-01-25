import * as PIXI from "pixi.js";

export class Main {
    constructor() {
        let type = "WebGL"
    if(!PIXI.utils.isWebGLSupported()){
        type = "canvas"
    }
        PIXI.utils.sayHello(type);
    }
}