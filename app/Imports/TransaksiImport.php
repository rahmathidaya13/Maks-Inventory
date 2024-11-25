<?php

namespace App\Imports;

use App\Models\BarangKeluarModel;
use Carbon\Carbon;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use App\Models\TransaksiModel;
use Maatwebsite\Excel\Concerns\ToModel;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;

class TransaksiImport implements ToModel, WithHeadingRow, WithCalculatedFormulas
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        // dd($row);
        $fromExcel = $row['tanggal_transaksi'];
        $dateTime = Date::excelToDateTimeObject($fromExcel);
        $formatedDate = Carbon::instance($dateTime)->format('Y-m-d');

        $barang = BarangModel::where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->first();

        $stok = StokBarangModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('posisi', $row['posisi_barang'])
            ->whereDate('tanggal', $formatedDate)
            ->first();



        $transaksi = TransaksiModel::create([
            'id_barang' => $barang ? $barang->id_barang : null,
            'id_stok' => $stok ? $stok->id_stok : null,
            'tgl_transaksi' => $formatedDate,
            'kode_transaksi' => $row['kode_transaksi'],
            'nama_konsumen' => $row['nama_konsumen'],
            'no_handphone' => $row['no_handphone'],
            'alamat' => $row['alamat'],
            'nama_sales' => $row['sales'],
            'kode_barang' => $row['kode_barang'],
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'jumlah_barang' => $row['jumlah_barang'],
            'posisi' => $row['posisi_barang'],
            'harga_barang' => $row['harga_barang'],
            'status_pembayaran' => $row['status_pembayaran'],
            'status_transaksi' => $row['transaksi'],
            'dana_pertama' => $row['dana_pertama_dp'],
            'diskon' => $row['diskon'],
            'pembayaran' => $row['pembayaran'],
            'total_pembayaran' => $row['total_pembayaran'],
            'selisih_pembayaran' => $row['selisih_pembayaran'],
        ]);

        if ($row && $row['status_pembayaran'] === 'lunas') {
            $barangkeluar = BarangKeluarModel::where('id_barang', $barang->id_barang)
                ->where('nama_barang', $row['nama_barang'])
                ->where('nama_konsumen', $row['nama_konsumen'])
                ->where('tipe_barang', $row['tipe_barang'])
                ->where('posisi', $row['posisi_barang'])
                ->whereDate('tanggal', $formatedDate)
                ->first();
            if ($barangkeluar) {
                $barangkeluar->jumlah_barang += $row['jumlah_barang'];
                $barangkeluar->posisi = $row['posisi_barang'];
                $barangkeluar->save();
            } else {
                // $barangkeluarNew = new BarangKeluarModel();
                // $barangkeluarNew->id_barang = $barang->id_barang;
                // $barangkeluarNew->id_transaksi = $transaksi->id_transaksi;
                // $barangkeluarNew->tanggal = $formatedDate;
                // $barangkeluarNew->kode_transaksi = $row['kode_transaksi'];
                // $barangkeluarNew->nama_konsumen = $row['nama_konsumen'];
                // $barangkeluarNew->no_handphone = $row['no_handphone'];
                // $barangkeluarNew->alamat = $row['alamat'];
                // $barangkeluarNew->nama_sales = $row['sales'];
                // $barangkeluarNew->kode_barang = $row['kode_barang'];
                // $barangkeluarNew->nama_barang = $row['nama_barang'];
                // $barangkeluarNew->tipe_barang = $row['tipe_barang'];
                // $barangkeluarNew->jumlah_barang = $row['jumlah_barang'];
                // $barangkeluarNew->posisi = $row['posisi_barang'];
                // $barangkeluarNew->save();
            }
        }
        // return new TransaksiModel([
        //     'id_barang' => $barang ? $barang->id_barang : null,
        //     'id_stok' => $stok ? $stok->id_stok : null,
        //     'tgl_transaksi' => $formatedDate,
        //     'kode_transaksi' => $row['kode_transaksi'],
        //     'nama_konsumen' => $row['nama_konsumen'],
        //     'no_handphone' => $row['no_handphone'],
        //     'alamat' => $row['alamat'],
        //     'nama_sales' => $row['sales'],
        //     'kode_barang' => $row['kode_barang'],
        //     'nama_barang' => $row['nama_barang'],
        //     'tipe_barang' => $row['tipe_barang'],
        //     'jumlah_barang' => $row['jumlah_barang'],
        //     'posisi' => $row['posisi_barang'],
        //     'harga_barang' => $row['harga_barang'],
        //     'status_pembayaran' => $row['status_pembayaran'],
        //     'status_transaksi' => $row['transaksi'],
        //     'dana_pertama' => $row['dana_pertama_dp'],
        //     'diskon' => $row['diskon'],
        //     'pembayaran' => $row['pembayaran'],
        //     'total_pembayaran' => $row['total_pembayaran'],
        //     'selisih_pembayaran' => $row['selisih_pembayaran'],
        // ]);
    }
    public function headingRow(): int
    {
        return 4;
    }
}
