const path = require('path');

module.exports = {
    entry: "./src/index.ts",
    watch: true,
    output: {
        filename: "bundle.js",
        path: path.resolve(__dirname, 'dist')
    },
    module: {
        rules: [{
            exclude: /node_modules/
        }]
    }
}