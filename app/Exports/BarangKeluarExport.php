<?php

namespace App\Exports;

use Illuminate\View\View;
use App\Models\BarangKeluarModel;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;


class BarangKeluarExport implements FromView, WithHeadings, WithStyles, ShouldAutoSize
{
    /**
     * @return \Illuminate\Support\Collection
     */
    protected $start_date;
    protected $end_date;
    public function __construct($start_date, $end_date)
    {
        $this->start_date = $start_date;
        $this->end_date = $end_date;
    }
    public function view(): View
    {
        return view('Barang_Keluar.print.index', [
            'barang_keluar' => BarangKeluarModel::whereBetween('tanggal', [$this->start_date, $this->end_date])->get(),
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
        ]);
    }
    public function headings(): array
    {
        return [
            'Tanggal Barang Keluar',
            'Kode Transaksi',
            'Nama Konsumen',
            'No Handphone',
            'Alamat',
            'Kode Barang',
            'Nama Barang',
            'Tipe Barang',
            'Jumlah Barang',
        ];
    }
    public function styles(Worksheet $sheet)
    {
        //  Merge cell A1 sampai C1 untuk judul
        $sheet->mergeCells('A1:I1');
        $sheet->mergeCells('A2:I2');
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

        // Styling untuk header tabel
        $sheet->getStyle('A4:I4')->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['argb' => '000000'],
                'size' => 12,
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => ['argb' => 'C5D3E8'], // Warna background
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],

        ]);

        $sheet->getStyle('A4:I4')->getAlignment()->setWrapText(true);

        // Set border untuk seluruh tabel mulai dari baris
        $sheet->getStyle('A4:I' . $sheet->getHighestRow())->applyFromArray([
            'font' => [
                'size' => 12,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    'color' => ['argb' => 'FF000000'], // warna border
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
        for ($row = 5; $row <= $sheet->getHighestRow(); $row += 2) {
            $sheet->getStyle("A$row:I$row")->applyFromArray([
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'startColor' => ['argb' => 'F5F5F5'], // Warna abu-abu muda
                ],
            ]);
        }
    }
}
