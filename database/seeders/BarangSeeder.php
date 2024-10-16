<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class BarangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('tb_barang')->insert(
            [
                [
                    'id_barang'=>uuid_create(),
                    'nama_barang' => 'Mesin Universal Fritter',
                    'tipe_barang' => 'MKS-UV44',
                    'harga_barang' => 2090000
                ],
                [
                    'id_barang'=>uuid_create(),
                    'nama_barang' => 'Mesin Cup Sealer',
                    'tipe_barang' => 'CPS-10A',
                    'harga_barang' => 4980000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Cetak Mie',
                    'tipe_barang' => 'MKS-140',
                    'harga_barang' => 1780000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Pencabut Rumput',
                    'tipe_barang' => 'AGR-PR238',
                    'harga_barang' => 4420000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Dough Mixer',
                    'tipe_barang' => 'MKS-DMIX002',
                    'harga_barang' => 2650000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Cetak Mie',
                    'tipe_barang' => 'MKS-180SS',
                    'harga_barang' => 4370000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Food Dehidrator',
                    'tipe_barang' => 'ARD-PM99',
                    'harga_barang' => 820000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Cetak Pelet',
                    'tipe_barang' => 'MKS-PLT25',
                    'harga_barang' => 6490000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Alat Sauce Pan/Ssauce Dispenser',
                    'tipe_barang' => 'MKS-SU-01',
                    'harga_barang' => 1490000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Cetak Mie',
                    'tipe_barang' => 'MCM-150',
                    'harga_barang' => 330000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Coffe Espresso',
                    'tipe_barang' => 'MKS-MKP60',
                    'harga_barang' => 10930000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Alat Giling Daging manual',
                    'tipe_barang' => 'MKS-SG10',
                    'harga_barang' => 1450000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Cetak Mie Manual',
                    'tipe_barang' => 'MKS-150B',
                    'harga_barang' => 1010000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Cetak Mie',
                    'tipe_barang' => 'MKS-200',
                    'harga_barang' => 3090000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Alat Pemotong Kerupuk Lontong',
                    'tipe_barang' => 'manual AGR-LTG22',
                    'harga_barang' => 2430000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Waffle Maker',
                    'tipe_barang' => 'MKS-WF48',
                    'harga_barang' => 7610000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Electric Kettle',
                    'tipe_barang' => 'KTL-DBL2',
                    'harga_barang' => 330000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Electric Kettle',
                    'tipe_barang' => 'ARD-KT12',
                    'harga_barang' => 540000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Coffe Grinder',
                    'tipe_barang' => 'MKS-GRD60A',
                    'harga_barang' => 5610000
                ],
                [
                    'id_barang'=>uuid_create(),

                    'nama_barang' => 'Mesin Coffe Bean Grinder',
                    'tipe_barang' => 'MKS-CG50',
                    'harga_barang' => 180000
                ]
            ]
        );
    }
}
