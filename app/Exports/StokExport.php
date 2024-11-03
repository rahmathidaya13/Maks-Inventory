<?php

namespace App\Exports;

use App\Models\StokBarangModel;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class StokExport implements FromView, WithHeadings, WithStyles, ShouldAutoSize
{
    /**
     * @return \Illuminate\Support\Collection
     */
    // public function collection()
    // {
    //     return StokBarangModel::all();
    // }

    public function view(): View
    {
        return view('StokBarang.print.index', [
            'stok' => StokBarangModel::all(),

        ]);
    }

    public function headings(): array
    {
        return [
            'Tanggal',
            'Nama Barang',
            'Tipe Barang',
            'Stok Awal',
            'Barang Masuk',
            'Barang Keluar',
            'Stok Akhir',
            'Keterangan',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        //  Merge cell A1 sampai C1 untuk judul
        $sheet->mergeCells('A1:H1');
        $sheet->mergeCells('A2:H2');
        $sheet->mergeCells('A3:H3');
        // // Set judul di A1
        // // $sheet->setCellValue('A1', 'Daftar Barang Cabang Pekanbaru');
        // Styling untuk judul
        $sheet->getStyle('A1')->applyFromArray([
            'font' => [
                'bold' => true,
                'size' => 14,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ]);
        $sheet->getStyle('A2')->applyFromArray([
            'font' => [
                'bold' => true,
                'size' => 14,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ]);
        $sheet->getStyle('A3')->applyFromArray([
            'font' => [
                'bold' => true,
                'size' => 14,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ]);

        // Styling untuk header tabel
        $sheet->getStyle('A5:H5')->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['argb' => '000000'],
                'size' => 12,
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => ['argb' => '9fffff'], // Warna background
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],

        ]);

        $sheet->getStyle('A5:H5')->getAlignment()->setWrapText(true);

        // Set border untuk seluruh tabel mulai dari baris
        $sheet->getStyle('A5:H' . $sheet->getHighestRow())->applyFromArray([
            'font' => [
                'size' => 12,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    'color' => ['argb' => 'FF000000'],
                ],
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ]);
        // $sheet->setCellValue('A2', 'Nama Barang');
        // $sheet->setCellValue('B2', 'Tipe Barang');
        // $sheet->setCellValue('C2', 'Harga Barang');


        // Style untuk baris ganjil (Zebra striping)
        for ($row = 6; $row <= $sheet->getHighestRow(); $row += 2) {
            $sheet->getStyle("A$row:H$row")->applyFromArray([
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'startColor' => ['argb' => 'f4f4f4'], // Warna abu-abu muda
                ],
            ]);
        }
    }
}
