<?php

namespace App\Http\Controllers;

use App\Models\Nino;
use Illuminate\Http\Request;
use App\Http\Requests\NinoRequest;

class NinoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Nino::orderBy('rut')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function show(Nino $nino)
    {
        return $nino;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function edit(Nino $nino)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function update(NinoRequest $request, Nino $nino)
    {
        //$nino->rut = $request->rut;
        $nino->nombre = $request->nombre;
        $nino->nombre_apoderado = $request->nombre_apoderado;
        $nino->telefono_emergencia = $request->telefono_emergencia;
        $nino->id_nivel = $request->id_nivel;
        $nino->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function destroy(Nino $nino)
    {
        $nino->delete();
    }
}
