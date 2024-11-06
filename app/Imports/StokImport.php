<?php

namespace App\Imports;

use Carbon\Carbon;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use Maatwebsite\Excel\Concerns\ToModel;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;

class StokImport implements ToModel, WithHeadingRow, WithCalculatedFormulas
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        // dd($row);
        $fromExcel = $row['tanggal'];
        $dateTime = Date::excelToDateTimeObject($fromExcel);
        $formatedDate = Carbon::instance($dateTime)->format('Y-m-d');
        // $get_date = Carbon::parse($row['tanggal'])->format('Y-m-d');
        // $get_date = Carbon::parse($formatedDate)->format('Y-m-d');

        // ambil data barang untuk di relasikan dengan stok barang ketika di import
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
        // dd($row);
        return new StokBarangModel([
            'id_barang' => $barang->id_barang,
            'id_brg_masuk' => null,
            'tanggal' => $formatedDate,
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'barang_masuk' => $row['barang_masuk'],
            'barang_keluar' => $row['barang_keluar'],
            'stok_awal' => $row['stok_awal'],
            'stok_akhir' => $row['stok_akhir'],
            'keterangan' => $row['keterangan'],
        ]);
    }
    public function headingRow(): int
    {
        return 5;
    }
}
