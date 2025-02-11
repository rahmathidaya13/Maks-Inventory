import "./bootstrap";
import profile from "@/frontend/profile.js";
profile(); // load profile agar bisa disemua halaman

// Agar kode tetap bisa berjalan di semua halaman tanpa terpengaruh query string, ubah kode menjadi:
const path = new URL(window.location.href).pathname;
// Sesuaikan path jika pakai alias dengan routes
const routes = {
    '/home': () => import('@/frontend/home.js'),
    '/list-item': () => import('@/frontend/barang.js'),
    '/transaksi': () => import('@/frontend/transaksi.js'),
    '/stok': () => import('@/frontend/stok_barang.js'),
    '/barang_masuk': () => import('@/frontend/barang_masuk.js'),
    '/barang_keluar': () => import('@/frontend/barang_keluar.js'),
    '/login': () => import('@/frontend/view_password.js'),
    '/register': () => import('@/frontend/view_password.js'),
}
// if (routes[path]) {
//     // Jalankan fungsi default dari file yang di-load
//     routes[path]().then((module) => {
//         module.default();
//         // console.log(module);
//     })
// }
for (const route in routes) {
    // Cocokkan dengan semua variasi jika menggunakan method startwith
    if (path.startsWith(route)) {
        routes[route]().then((module) =>
            module.default()
        );
        break;
    }
}

