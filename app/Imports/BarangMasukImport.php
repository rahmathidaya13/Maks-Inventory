<?php

namespace App\Imports;

use Carbon\Carbon;
use App\Models\BarangMasukModel;
use App\Models\BarangModel;
use Maatwebsite\Excel\Concerns\ToModel;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use PhpOffice\PhpSpreadsheet\IOFactory;

class BarangMasukImport implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */

    public function model(array $row)
    {
        $fromExcel = $row['tanggal_barang_masuk'];
        $dateTime = Date::excelToDateTimeObject($fromExcel);
        $formatedDate = Carbon::instance($dateTime)->format('Y-m-d');
        // $get_date = Carbon::parse($row['tanggal'])->format('Y-m-d');
        $get_date = Carbon::parse($formatedDate)->format('Y-m-d');

        $barang = BarangModel::where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->first();
        if (!$barang) {
            $barang = BarangModel::create([
                'nama_barang' => $row['nama_barang'],
                'tipe_barang' => $row['tipe_barang'],
                'harga_barang' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
        // $dateNow = Carbon::now()->format('Y-m-d');
        return new BarangMasukModel([
            'id_barang' => $barang->id_barang,
            'tgl_brg_masuk' => $get_date,
            'no_warehouse' => $row['no_warehouse'],
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'asal_gudang' => $row['asal_gudang'],
            'jumlah_barang' => $row['quantity'],
            'status' => $row['status'],
            'nama_konsumen' => $row['customer'],
        ]);
        // dd($formatedDate);
    }
    public function headingRow(): int
    {
        return 4;
    }
}
