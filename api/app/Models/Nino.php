<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Nino extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'nino';
    protected $primaryKey = 'rut';
    public $incrementing = false;
    public $timestamps = false;
}
