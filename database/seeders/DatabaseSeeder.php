<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
        $data = [
            [
                'name' => 'admin',
                'email' => 'admin@gmail.com',
                'password' => bcrypt('admin1234'),
                'role' => 'admin',
            ],
            [
                'name' => 'admin2',
                'email' => 'admin2@example.com',
                'password' => bcrypt('admin1234'),
                'role' => 'admin',
            ],
            [
                'name' => 'supervisior',
                'email' => 'spv@example.com',
                'password' => bcrypt('spv12345'),
                'role' => 'spv',
            ]
        ];
        foreach ($data as $rows) {
            \App\Models\User::factory()->create($rows);
        }
    }
}
