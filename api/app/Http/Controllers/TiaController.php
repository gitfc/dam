<?php

namespace App\Http\Controllers;

use App\Models\Tia;
use Illuminate\Http\Request;

class TiaController extends Controller
{
    public function index()
    {
        return Tia::orderBy('rut')->get();
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Tia $tia)
    {
        //
    }

    public function edit(Tia $tia)
    {
        //
    }

    public function update(Request $request, Tia $tia)
    {
        //
    }

    public function destroy(Tia $tia)
    {
        $tia->delete();
    }
}
