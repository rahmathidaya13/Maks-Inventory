<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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
                ->latest()->paginate(10);
        } else {
            $barang = BarangModel::latest()->paginate(10);
        }
        return view('Barang.partials.table_item', compact('barang'));
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
}
