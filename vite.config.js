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
        rollupOptions: {
            plugins: [
                obfuscator({
                    compact: true, // Hilangkan spasi
                    controlFlowFlattening: true, // Membuat logika sulit dibaca
                    stringArray: true, // Konversi string ke array
                    stringArrayThreshold: 0.75, // Ambang konversi string menjadi array
                }),
            ],
        },
        sourcemap: false, // Jangan menghasilkan sourcemap
    },
});
