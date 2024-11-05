<?php

namespace App\Http\Controllers;

use App\Models\BarangMasukModel;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use App\Models\TransaksiModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use PhpOffice\PhpSpreadsheet\Calculation\TextData\Search;

class LiveAction extends Controller
{
    public function searchItem(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'query' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('query');
        if (!empty($query)) {
            $barang =  BarangModel::where("nama_barang", "like", "%" . $query . "%")
                ->orWhere("tipe_barang", "like", "%" . $query . "%")
                ->latest()->paginate(10)->appends(['query' => $query]);;
        } else {
            $barang = BarangModel::latest()->paginate(10);
        }
        return view('Barang.partials.table_item', compact('barang', 'query'));
    }
    public function stokSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'query' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('query');
        if (!empty($query)) {
            $stok =  StokBarangModel::where("nama_barang", "like", "%" . $query . "%")
                ->orWhere("tipe_barang", "like", "%" . $query . "%")
                ->latest()->paginate(10)->appends(['query' => $query]);;
        } else {
            $stok = StokBarangModel::latest()->paginate(10);
        }
        return view('StokBarang.table_partial.tableStok', compact('stok', 'query'));
    }
    public function searchBrgMasuk(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'query' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('query');
        if (!empty($query)) {
            $barang_masuk =  BarangMasukModel::where("nama_barang", "like", "%" . $query . "%")
                ->orWhere("tipe_barang", "like", "%" . $query . "%")
                ->latest()->paginate(10)->appends(['query' => $query]);;
        } else {
            $barang_masuk = BarangMasukModel::latest()->paginate(10);
        }
        return view('BarangMasuk.partial.table_item', compact('barang_masuk', 'query'));
    }
    public function transaksiSearch(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'query' => 'nullable|string|min:1|max:255|regex:/^[a-zA-Z0-9\s\-]+$/', // Hanya izinkan huruf, angka, spasi, dan simbol '-'
        ]);

        $query = $request->get('query');
        if (!empty($query)) {
            $transaksi =  TransaksiModel::where("nama_barang", "like", "%" . $query . "%")
                ->orWhere("tipe_barang", "like", "%" . $query . "%")
                ->orWhere("nama_konsumen", "like", "%" . $query . "%")
                ->latest()->paginate(10)->appends(['query' => $query]);;
        } else {
            $transaksi = TransaksiModel::latest()->paginate(10);
        }
        return view('transaksi.partial.table',  compact('transaksi', 'query'));
    }

    public function filterData(Request $request)
    {
        $offset = $request->get('offset');
        $barang = BarangModel::latest()->paginate($offset);
        if ($request->ajax()) {
            return view('Barang.partials.table_item', compact('barang'))->render();
        }
        return view('Barang.index', compact('barang'));
    }
    public function filterBrgMasuk(Request $request)
    {
        $offset = $request->get('limit');
        $barang_masuk = BarangMasukModel::paginate($offset);
        if ($request->ajax()) {
            return view('BarangMasuk.partial.table_item', compact('barang_masuk'))->render();
        }
        return view('BarangMasuk.index', compact('barang_masuk'));
    }
    public function transaksiFilter(Request $request)
    {
        $offset = $request->get('offset');
        $transaksi = TransaksiModel::paginate($offset);
        if ($request->ajax()) {
            return view('transaksi.partial.table', compact('transaksi'))->render();
        }
        return view('transaksi.index', compact('transaksi'));
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
        $offset = $request->get('offset');
        $stok = StokBarangModel::paginate($offset);
        if ($request->ajax()) {
            return view('StokBarang.table_partial.tableStok', compact('stok'))->render();
        }
        return view('StokBarang.index', compact('stok'));
    }

    public function filterDateStok(Request $request)
    {
         $request->validate([
        'start_date' => 'required|date',
        'end_date' => 'required|date|after_or_equal:start_date',
    ], [
        'start_date.required' => 'Masukkan tanggal awal yang valid.',
        'start_date.date' => 'Tanggal awal harus dalam format yang valid.',
        'end_date.required' => 'Masukkan tanggal akhir yang valid.',
        'end_date.date' => 'Tanggal akhir harus dalam format yang valid.',
        'end_date.after_or_equal' => 'Tanggal akhir harus lebih besar atau sama dengan tanggal awal.',
    ]);
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $stok = StokBarangModel::whereBetween('tanggal', [$start_date, $end_date])->latest()->paginate(500);
        if ($request->ajax()) {
            return view('StokBarang.table_partial.tableStok', compact('stok'))->render();
        }
        return view('StokBarang.index', compact('stok'));
    }
    public function filterDateBarangMasuk(Request $request)
    {
         $request->validate([
        'start_date' => 'required|date',
        'end_date' => 'required|date|after_or_equal:start_date',
    ], [
        'start_date.required' => 'Masukkan tanggal awal yang valid.',
        'start_date.date' => 'Tanggal awal harus dalam format yang valid.',
        'end_date.required' => 'Masukkan tanggal akhir yang valid.',
        'end_date.date' => 'Tanggal akhir harus dalam format yang valid.',
        'end_date.after_or_equal' => 'Tanggal akhir harus lebih besar atau sama dengan tanggal awal.',
    ]);
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $barang_masuk = BarangMasukModel::whereBetween('tgl_brg_masuk', [$start_date, $end_date])->latest()->paginate(500);
        if ($request->ajax()) {
            return view('BarangMasuk.partial.table_item', compact('barang_masuk'))->render();
        }
        return view('BarangMasuk.index', compact('barang_masuk'));
    }
}
