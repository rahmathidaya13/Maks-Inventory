<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;

class LiveSearch extends Controller
{
    public function searchItem(Request $request)
    {
        $query = $request->get('query');
        if ($query != "") {
            $barang =  BarangModel::where("nama_barang", "like", "%" . $query . "%")
                ->orWhere("tipe_barang", "like", "%" . $query . "%")
                ->latest()->get();
        } else {
            // $barang = BarangModel::latest()->get();
        }
        return view('Barang.partials.table_item', ['barang' => $barang]);
    }
}
