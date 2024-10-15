<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;

class LiveSearch extends Controller
{
    public function searchItem(Request $request)
    {
        if ($request->ajax()) {
            $query = $request->get('query');
            if ($query != "") {
                BarangModel::where("nama_barang", "like", "{$query}")
                    ->orderBy("nama_barang", "asc")->get();
            } else {
                $data = BarangModel::orderBy(
                    'nama_barang',
                    'asc'
                );
            }
            return response()->json($data, 200);
        }
    }
}
