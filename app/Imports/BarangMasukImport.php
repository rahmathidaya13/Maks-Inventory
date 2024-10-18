<?php

namespace App\Imports;

use Carbon\Carbon;
use App\Models\BarangMasukModel;
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
    private $fileType;
    public function __construct($fileType)
    {
        $this->fileType = $fileType;
    }
    public function model(array $row)
    {
        if ($this->fileType == 'excel') {
            $get_date = Carbon::instance(Date::excelToDateTimeObject($row['tanggal_barang_masuk']))->format('Y-m-d');
        } elseif ($this->fileType == 'csv') {
            $get_date = Carbon::parse($row['tanggal_barang_masuk'])->format('Y-m-d');
        }
        return new BarangMasukModel([
            'id_barang' => uuid_create(),
            'tgl_brg_masuk' => $get_date,
            'no_warehouse' => $row['no_warehouse'],
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'asal_gudang' => $row['asal_gudang'],
            'jumlah_barang' => $row['quantity'],
            'status' => $row['status'],
            'nama_konsumen' => $row['customer'],
        ]);
    }
}
