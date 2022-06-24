<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class NinoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'rut' => 'unique:nino|required|numeric|integer',
            'nombre' => 'required|alpha',
            'nombre_apoderado' => 'required|alpha',
            'telefono_emergencia' => 'required|numeric',
            'id_nivel' => 'required|exists:nivel,id',
        ];
    }
}
