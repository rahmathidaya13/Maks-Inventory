import './bootstrap';
$(document).ready(function () {
    const modules = import.meta.glob('./frontend/*.js');
    for (const path in modules) {
        modules[path]().then((module) => {
            console.log(`Module ${path} loaded`);
        });
    }
});
