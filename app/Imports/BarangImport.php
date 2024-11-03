<?php

namespace App\Imports;

use App\Models\BarangModel;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BarangImport implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        try {
            return new BarangModel([
                'nama_barang' => $row['nama_barang'],
                'tipe_barang' => $row['tipe_barang'],
                'harga_barang' => floatval($row['harga_barang']),
            ]);
        } catch (\Exception $e) {
            Log::error('Error importing row: ', ['row' => $row, 'error' => $e->getMessage()]);
            return null; // Skip row if error occurs
        }
    }
    public function headingRow(): int
    {
        return 3;
    }
}
