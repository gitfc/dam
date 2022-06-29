<?php

namespace App\Http\Controllers;

use App\Models\Nivel;
use Illuminate\Http\Request;
use DB;

class NivelController extends Controller
{
    public function index()
    {
        //return Nivel::orderBy('id')->get();
        return Nivel::select('nivel.*', DB::raw('(select count(*) from nino where nino.id_nivel = nivel.id) as ninos_cursando'))->orderBy('id')->get();
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Nivel $nivel)
    {
        return $nivel;
    }

    public function edit(Nivel $nivel)
    {
        //
    }

    public function update(Request $request, Nivel $nivel)
    {
        //
    }

    public function destroy(Nivel $nivel)
    {
        $nivel->delete();
    }
}
