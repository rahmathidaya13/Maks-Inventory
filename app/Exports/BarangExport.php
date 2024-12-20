<?php

namespace App\Exports;

use App\Models\BarangModel;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class BarangExport implements FromView, WithHeadings, WithStyles, ShouldAutoSize, WithColumnWidths
{
    /**
     * @return \Illuminate\Support\Collection
     */
    // public function collection()
    // {
    //     return BarangModel::all(['nama_barang','tipe_barang','harga_barang']);
    // }

    public function view(): View
    {
        return view('Barang.print_out.page', [
            'barang' => BarangModel::all()
        ]);
    }

    public function headings(): array
    {
        return [
            'Nama Barang',
            'Tipe Barang',
            'Harga Barang',
        ];
    }
    public function columnWidths(): array
    {
        return [
            'A' => 40,
            'B' => 25,
            'c' => 20,
        ];
    }

    public function styles(Worksheet $sheet)
    {
        //  Merge cell A1 sampai C2 untuk judul
        $sheet->mergeCells('A1:C2')
            ->getStyle('A1')->applyFromArray([
                'alignment' => [
                    'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER, // Perataan vertikal ke bawah
                ],
            ]);

        // Styling untuk judul
        $sheet->getStyle('A1')->applyFromArray([
            'font' => [
                'bold' => true,
                'size' => 16,
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ]);
        // $sheet->getStyle('A2')->applyFromArray([
        //     'font' => [
        //         'bold' => true,
        //         'size' => 16,
        //     ],
        //     'alignment' => [
        //         'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        //     ],
        // ]);

        // Styling untuk header tabel
        $sheet->getStyle('A4:C4')->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['argb' => '000000'],
                'size' => 12,
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => ['argb' => 'ABBA7C'], // Warna background
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],

        ]);

        $sheet->getStyle('A4:C4')->getAlignment()->setWrapText(true);

        // Set border untuk seluruh tabel mulai dari baris
        $sheet->getStyle('A4:C' . $sheet->getHighestRow())->applyFromArray([
            'font' => [
                'size' => 12,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    'color' => ['argb' => 'FF000000'],
                ],
            ],
        ]);
        // $sheet->setCellValue('A2', 'Nama Barang');
        // $sheet->setCellValue('B2', 'Tipe Barang');
        // $sheet->setCellValue('C2', 'Harga Barang');


        // Style untuk baris ganjil (Zebra striping)
        for ($row = 5; $row <= $sheet->getHighestRow(); $row += 2) {
            $sheet->getStyle("A$row:C$row")->applyFromArray([
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'startColor' => ['argb' => 'f4f4f4'], // Warna abu-abu muda
                ],
            ]);
        }
    }
}
