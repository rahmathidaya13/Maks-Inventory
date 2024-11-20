import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import obfuscator from "rollup-plugin-obfuscator";
export default defineConfig({
    plugins: [
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: true,
        }),
    ],
    build: {
        // Jangan menghasilkan sourcemap
        sourcemap: false,
    },
});
