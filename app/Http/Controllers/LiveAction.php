<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use PhpOffice\PhpSpreadsheet\Calculation\TextData\Search;
use Carbon\Carbon;

class LiveAction extends Controller
{
    public function searchItem(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'itemQuery' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('itemQuery', 10);
        $barang =  BarangModel::where("nama_barang", "like", "%" . $query . "%")
            ->orWhere("tipe_barang", "like", "%" . $query . "%")
            ->latest()->paginate(10);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('Barang.partials.table_item', compact('barang'))->render(),
                'pagination' => view('Barang.partials.paginate', compact('barang'))->render(),
                'info' => [
                    'firstItem' => $barang->firstItem(),
                    'lastItem' => $barang->lastItem(),
                    'total' => $barang->total()
                ],
            ]);
        } else {
            $barang = BarangModel::latest()->paginate(10);
        }
        return view('Barang.partials.table_item', compact('barang'));
    }
    public function stokSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'stokKeyword' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('stokKeyword', 10);
        $stok =  StokBarangModel::where("nama_barang", "like", "%" . $query . "%")
            ->orWhere("tipe_barang", "like", "%" . $query . "%")
            ->orWhere("posisi", "like", "%" . $query . "%")
            ->latest('tanggal')->paginate(10);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('StokBarang.table_partial.tableStok', compact('stok'))->render(),
                'pagination' => view('StokBarang.table_partial.paginate', compact('stok'))->render(),
                'info' => [
                    'firstItem' => $stok->firstItem(),
                    'lastItem' => $stok->lastItem(),
                    'total' => $stok->total()
                ],
            ]);
        } else {
            $stok = StokBarangModel::latest('tanggal')->paginate(10);
        }
        return view('StokBarang.table_partial.tableStok', compact('stok'));
    }
    public function searchBrgMasuk(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'itemInQuery' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('itemInQuery', 10);
        $barang_masuk =  BarangMasukModel::where("nama_barang", "like", "%" . $query . "%")
            ->orWhere("tipe_barang", "like", "%" . $query . "%")
            ->latest('tgl_brg_masuk')->paginate(10);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('BarangMasuk.partial.table_item', compact('barang_masuk'))->render(),
                'pagination' => view('BarangMasuk.partial.paginate', compact('barang_masuk'))->render(),
                'info' => [
                    'firstItem' => $barang_masuk->firstItem(),
                    'lastItem' => $barang_masuk->lastItem(),
                    'total' => $barang_masuk->total()
                ],
            ]);
        } else {
            $barang_masuk = BarangMasukModel::latest('tgl_brg_masuk')->paginate(10);
        }
        return view('BarangMasuk.partial.table_item', compact('barang_masuk', 'query'));
    }
    public function transaksiSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'transaksiQuery' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('transaksiQuery', 10);
        $transaksi =  TransaksiModel::where("nama_barang", "like", "%" . $query . "%")
            ->orWhere("tipe_barang", "like", "%" . $query . "%")
            ->orWhere("nama_konsumen", "like", "%" . $query . "%")
            ->orWhere("nama_sales", "like", "%" . $query . "%")
            ->latest()->paginate(10);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('transaksi.partial.table', compact('transaksi'))->render(),
                'pagination' => view('transaksi.partial.paginate', compact('transaksi'))->render(),
                'info' => [
                    'firstItem' => $transaksi->firstItem(),
                    'lastItem' => $transaksi->lastItem(),
                    'total' => $transaksi->total()
                ],
            ]);
        } else {
            $transaksi = TransaksiModel::latest('tgl_transaksi')->paginate(10);
        }
        return view('transaksi.partial.table',  compact('transaksi', 'query'));
    }
    public function homeSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'query' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('query');
        if (!empty($query)) {
            $transaksi = TransaksiModel::where(function ($q) use ($query) {
                $q->where("nama_barang", "like", "%" . $query . "%")
                    ->orWhere("tipe_barang", "like", "%" . $query . "%")
                    ->orWhere("nama_sales", "like", "%" . $query . "%");
            })
                ->where('status_pembayaran', 'lunas')
                ->select(
                    'nama_sales',
                    DB::raw('SUM(jumlah_barang) AS total_barang'),
                    DB::raw('SUM(jumlah_barang * harga_barang) AS total_pendapatan'),
                    'nama_barang',
                    'tipe_barang',
                    'tgl_transaksi'
                )
                ->groupBy('nama_sales', 'nama_barang', 'tipe_barang', 'tgl_transaksi')
                ->get();
        } else {
            $transaksi = TransaksiModel::whereMonth('tgl_transaksi', Carbon::now()->month)
                ->whereYear('tgl_transaksi', Carbon::now()->year)
                ->select(
                    'nama_sales',
                    DB::raw('SUM(jumlah_barang) AS total_barang'),
                    DB::raw('SUM(jumlah_barang * harga_barang) AS total_pendapatan'),
                    'nama_barang',
                    'tipe_barang',
                    'tgl_transaksi'
                )
                ->where('status_pembayaran', 'lunas')
                ->groupBy('nama_sales', 'nama_barang', 'tipe_barang', 'tgl_transaksi')
                ->get();
        }
        return view('home.partial.table',  compact('transaksi'))->render();
    }
    public function barangKeluarSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'itemOutKeyword' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('itemOutKeyword', 10);
        $barang_keluar =  BarangKeluarModel::where("nama_barang", "like", "%" . $query . "%")
            ->orWhere("tipe_barang", "like", "%" . $query . "%")
            ->orWhere("nama_konsumen", "like", "%" . $query . "%")
            ->orWhere("no_handphone", "like", "%" . $query . "%")
            ->latest('tanggal')->paginate(10);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('Barang_Keluar.partial.table', compact('barang_keluar'))->render(),
                'pagination' => view('Barang_Keluar.partial.paginate', compact('barang_keluar'))->render(),
                'info' => [
                    'firstItem' => $barang_keluar->firstItem(),
                    'lastItem' => $barang_keluar->lastItem(),
                    'total' => $barang_keluar->total()
                ],
            ]);
        } else {
            $barang_keluar = BarangKeluarModel::latest('tanggal')->paginate(10);
        }
        return view('Barang_Keluar.partial.table',  compact('barang_keluar', 'query'));
    }

    public function filterData(Request $request)
    {
        $offset = $request->get('barangLimit', 10);
        $barang = BarangModel::latest()->paginate($offset);
        if ($request->ajax()) {
            // return view('Barang.partials.table_item', compact('barang'))->render();
            return response()->json([
                'table' => view('Barang.partials.table_item', compact('barang'))->render(),
                'pagination' => view('Barang.partials.paginate', compact('barang'))->render(),
                'info' => [
                    'firstItem' => $barang->firstItem(),
                    'lastItem' => $barang->lastItem(),
                    'total' => $barang->total()
                ],
            ]);
        }
        return view('Barang.index', compact('barang'));
    }
    public function filterBrgMasuk(Request $request)
    {
        $offset = $request->get('barangMasukLimit', 10);
        $barang_masuk = BarangMasukModel::latest('tgl_brg_masuk')->paginate($offset);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('BarangMasuk.partial.table_item', compact('barang_masuk'))->render(),
                'pagination' => view('BarangMasuk.partial.paginate', compact('barang_masuk'))->render(),
                'info' => [
                    'firstItem' => $barang_masuk->firstItem(),
                    'lastItem' => $barang_masuk->lastItem(),
                    'total' => $barang_masuk->total()
                ],
            ]);
        }
        return view('BarangMasuk.index', compact('barang_masuk'));
    }
    public function transaksiFilter(Request $request)
    {
        $offset = $request->get('transaksiLimit', 10);
        $transaksi = TransaksiModel::latest()->paginate($offset);
        if ($request->ajax()) {
            // return view('transaksi.partial.table', compact('transaksi'))->render();
            return response()->json([
                'table' => view('transaksi.partial.table', compact('transaksi'))->render(),
                'pagination' => view('transaksi.partial.paginate', compact('transaksi'))->render(),
                'info' => [
                    'firstItem' => $transaksi->firstItem(),
                    'lastItem' => $transaksi->lastItem(),
                    'total' => $transaksi->total()
                ],
            ]);
        }
        return view('transaksi.index', compact('transaksi'));
    }
    public function barangKeluarFilter(Request $request)
    {
        $offset = $request->get('barangKeluarLimit', 10);
        $barang_keluar = BarangKeluarModel::latest('tanggal')->paginate($offset);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('Barang_Keluar.partial.table', compact('barang_keluar'))->render(),
                'pagination' => view('Barang_Keluar.partial.paginate', compact('barang_keluar'))->render(),
                'info' => [
                    'firstItem' => $barang_keluar->firstItem(),
                    'lastItem' => $barang_keluar->lastItem(),
                    'total' => $barang_keluar->total()
                ],
            ]);
        }
        return view('Barang_Keluar.index', compact('barang_keluar'));
    }

    public function deletedAll(Request $request)
    {
        $ids = $request->ids;
        BarangModel::whereIn('id_barang', $ids)->delete();
        return response()->json(['success' => 'Data barang berhasil terhapus'], 200, [
            'Content-Type' => 'application/json',
            'X-Content-Type-Options' => 'nosniff',
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    }
    public function deletedAllBrgMasuk(Request $request)
    {
        $ids = $request->get('ids');
        BarangMasukModel::whereIn('id_brg_masuk', $ids)->delete();
        return response()->json(['success' => 'Data barang berhasil terhapus'], 200, [
            'Content-Type' => 'application/json',
            'X-Content-Type-Options' => 'nosniff',
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    }
    public function deleteAllTransactions(Request $request)
    {
        $ids = $request->get('ids');
        TransaksiModel::whereIn('id_transaksi', $ids)->delete();
        return response()->json(['success' => 'Data transaksi berhasil terhapus'], 200, [
            'Content-Type' => 'application/json',
            'X-Content-Type-Options' => 'nosniff',
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    }

    public function deleteAllStok(Request $request)
    {
        $ids = $request->get('ids');
        StokBarangModel::whereIn('id_stok', $ids)->delete();
        return response()->json(['success' => 'Data Stok berhasil terhapus'], 200, [
            'Content-Type' => 'application/json',
            'X-Content-Type-Options' => 'nosniff',
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    }

    public function stokFilter(Request $request)
    {
        $offset = $request->get('stokLimit', 10);
        $stok = StokBarangModel::latest('tanggal')->paginate($offset);
        if ($request->ajax()) {
            return response()->json([
                'table' => view('StokBarang.table_partial.tableStok', compact('stok'))->render(),
                'pagination' => view('StokBarang.table_partial.paginate', compact('stok'))->render(),
                'info' => [
                    'firstItem' => $stok->firstItem(),
                    'lastItem' => $stok->lastItem(),
                    'total' => $stok->total()
                ],
            ]);
        }
        return view('StokBarang.index', compact('stok'));
    }

    public function filterDateStok(Request $request)
    {
        $start_date = $request->input('start_date');
        $end_date = $request->input('end_date');
        $stok = StokBarangModel::whereBetween('tanggal', [$start_date, $end_date])->latest('tanggal')->paginate(500);
        if ($request->ajax()) {
            return view('StokBarang.table_partial.tableStok', compact('stok'))->render();
        }
        return view('StokBarang.index', compact('stok'));
    }
    public function filterDateBarangMasuk(Request $request)
    {
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $barang_masuk = BarangMasukModel::whereBetween('tgl_brg_masuk', [$start_date, $end_date])->latest()->paginate(500);
        if ($request->ajax()) {
            return view('BarangMasuk.partial.table_item', compact('barang_masuk'))->render();
        }
        return view('BarangMasuk.index', compact('barang_masuk'));
    }

    public function filterDateBarangKeluar(Request $request)
    {
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $barang_keluar = BarangKeluarModel::whereBetween('tanggal', [$start_date, $end_date])->latest()->paginate(500);
        if ($request->ajax()) {
            return view('Barang_Keluar.partial.table', compact('barang_keluar'))->render();
        }
        return view('Barang_Keluar.index', compact('barang_keluar'));
    }
    public function filterDateTransaksi(Request $request)
    {
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $transaksi = TransaksiModel::whereBetween('tgl_transaksi', [$start_date, $end_date])->latest()->paginate(500);
        if ($request->ajax()) {
            return view('transaksi.partial.table', compact('transaksi'))->render();
        }
        return view('transaksi.index', compact('transaksi'));
    }

    public function selectStok(Request $request)
    {

        $id_barang = $request->input('id_barang');
        $nama_barang = $request->input('nama_barang');
        $tipe_barang = $request->input('tipe_barang');
        $posisi = $request->input('posisi');
        $stok = StokBarangModel::where('id_barang', $id_barang)
            ->where('nama_barang', $nama_barang)
            ->where('tipe_barang', $tipe_barang)
            ->where('posisi', $posisi)
            ->orderBy('tanggal', 'desc')
            ->first();
        return response()->json(['result' => $stok]);
    }
}
