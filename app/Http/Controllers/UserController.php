<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function show(string $id)
    {
        $user = User::find($id);
        return response()->json(
            ['success' => 'Updated successfully', 'result' => $user],
            200,
            [
                'Content-Type' => 'application/json',
                'X-Content-Type-Options' => 'nosniff',
            ],
            JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
        );
    }
    public function update(Request $request, string $id)
    {

        $user = User::findOrFail($id);
        if ($request->has('photo-user')) {
            $file = $request->file('photo-user');
            $nameFile = time() . "." . $file->getClientOriginalExtension();
            $file->move(public_path('assets/profile'), $nameFile);

            if ($user->photo) {
                $old = public_path('assets/profile/' . $user->photo);
                if (file_exists($old)) {
                    unlink($old);
                }
            }
            $user->name = $request->input('name-user');
            $user->email = $request->input('email-user');
            $user->photo = $nameFile;
        } else {
            $user->name = $request->input('name-user');
            $user->email = $request->input('email-user');
        }
        $user->update();

        return back()->with('success', 'Profile berhasil diupdate');
    }
}
