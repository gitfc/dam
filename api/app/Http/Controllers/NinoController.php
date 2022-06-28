<?php

namespace App\Http\Controllers;

use App\Models\Nino;
use Illuminate\Http\Request;
use App\Http\Requests\NinoRequest;

class NinoController extends Controller
{
    public function index()
    {
        return Nino::orderBy('rut')->get();
    }

    public function store(NinoRequest $request)
    {
        $nino = new Nino();
        $nino->rut = $request->rut;
        $nino->nombre = $request->nombre;
        $nino->nombre_apoderado = $request->nombre_apoderado;
        $nino->telefono_emergencia = $request->telefono_emergencia;
        $nino->id_nivel = $request->id_nivel;
        $nino->save();
    }

    public function show(Nino $nino)
    {
        return $nino;
    }

    public function edit(Nino $nino)
    {
        //
    }

    public function update(NinoRequest $request, Nino $nino)
    {
        //$nino->rut = $request->rut;
        $nino->nombre = $request->nombre;
        $nino->nombre_apoderado = $request->nombre_apoderado;
        $nino->telefono_emergencia = $request->telefono_emergencia;
        $nino->id_nivel = $request->id_nivel;
        $nino->save();
    }

    public function destroy(Nino $nino)
    {
        $nino->delete();
    }
}
