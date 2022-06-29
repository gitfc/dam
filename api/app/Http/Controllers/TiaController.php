<?php

namespace App\Http\Controllers;

use App\Models\Tia;
use Illuminate\Http\Request;
use DB;

class TiaController extends Controller
{
    public function index()
    {
        return Tia::select('tia.*', DB::raw('(select count(*) from tia_nivel where tia_nivel.rut_tia = tia.rut) as cursos'))->orderBy('rut')->get();
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
