<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tia extends Model
{
    use HasFactory;

    protected $table = 'tia';
    protected $primaryKey = 'rut';
    public $incrementing = false;
    public $timestamps = false;
}
