<?php

namespace App\Http\Controllers;

use App\Models\Evento;
use Illuminate\Http\Request;

class EventoController extends Controller
{
    public function index()
    {
        return Evento::orderBy('fecha', 'desc')->get();
    }

    public function store(Request $request)
    {
        $evento = new Evento();
        $evento->id = $request->id;
        $evento->descripcion = $request->descripcion;
        $evento->fecha = $request->fecha;
        $evento->rut_nino = $request->rut_nino;
        $evento->save();
    }

    public function show(Evento $evento)
    {
        return $evento;
    }

    public function edit(Evento $evento)
    {
        //
    }

    public function update(Request $request, Evento $evento)
    {
        //
    }

    public function destroy(Evento $evento)
    {
        $evento->delete();
    }
}
