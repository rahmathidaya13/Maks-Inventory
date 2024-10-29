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
}
