<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LigneFrais extends Model
{
    protected $fillable = [
        'Nom','Total','donner','id_note'
    ];


    public function ligneFrais(){
        return $this->belongsTo(NoteFrais::class,"ID_NOTE_DE_FRAIS");
    }

    protected $table = 'LIGNE_DE_FRAIS';
    protected $primaryKey = 'ID_NOTE_DE_FRAIS';
    Public $timestamps = false;
}

