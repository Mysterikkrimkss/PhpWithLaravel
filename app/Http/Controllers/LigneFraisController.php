<?php

namespace App\Http\Controllers;

use App\NoteFrais;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LigneFraisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        // $membre = \App\NoteFrais::find($id)->ID_NOTE_DE_FRAIS;

        // $idMission = DB::select("select * from NOTE_DE_FRAIS where ID_MISSION = $membre");

        // $missions = (array) $idMission;
        // return view('note.listeNoteFrais',['missions'=>$missions]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        
        $Visiteurs = NoteFrais::all();
             $tab = array();
             foreach($Visiteurs as $v){

                 if($v){
                     $tab[]=$v;
                 }                
             }

             return view('ligne.create',['ID_PERS'=>$tab]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //$membre = \App\NoteFrais::find($request->input('ID_PERS'))->ID_NOTE_DE_FRAIS;
        
        $LigneFrais = new \App\LigneFrais();
        //$notefrais2 = new \App\Mission();

        $LigneFrais->Nom = $request->input('NOM');

        $LigneFrais->Total = $request->input('frais');

        

        $LigneFrais->donner = $request->input('donner');

        $LigneFrais->id_note = $request->input('ID_PERS');


        //$LigneFrais->ID_NOTE_DE_FRAIS  = $membre->ID_NOTE_DE_FRAIS;

        $LigneFrais->save();

        //return view('ligne.listLigneFrais',['missions'=>$missions]);

        //return $this->show($LigneFrais->ID_NOTE_DE_FRAIS);
        return redirect()->action('LigneFraisController@show',[$LigneFrais->ID_NOTE_DE_FRAIS = $request->input('ID_PERS')]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
       // $membre = \App\NoteFrais::find($id)->ID_NOTE_DE_FRAIS;

        $idMission = DB::select("select * from LIGNE_DE_FRAIS where id_note = $id");

        $missions = (array) $idMission;

        //dd($id);

        return view('ligne.listLigneFrais',['missions'=>$missions]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        
        $mission = \App\LigneFrais::find($id);

        $Visiteurs = NoteFrais::all();
        $tab = array();
        foreach($Visiteurs as $v){

            if($v){
                $tab[]=$v;
            }                
        }

        return view('ligne/edit',compact('mission', 'id'),['ID_PERS'=>$tab]);
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        //$membre = \App\NoteFrais::find($id)->ID_NOTE_DE_FRAIS;
        
        $LigneFrais = \App\LigneFrais::find($id);
        //$notefrais2 = new \App\Mission();

        $LigneFrais->Nom = $request->input('Nom');

        $LigneFrais->Total = $request->input('Total');

        $LigneFrais->donner = $request->input('donner');

        $LigneFrais->id_note = $request->input('ID_PERS');

        $id_mission = $LigneFrais->ID_NOTE_DE_FRAIS;


        $LigneFrais->save();

        return redirect('LigneFraisController@show', $id_mission);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //


        $mission = \App\LigneFrais::find($id);

        $id_mission = $mission->ID_NOTE_DE_FRAIS;

        $mission->delete($id);

        return redirect()->action('LigneFraisController@show', $id_mission);
    }
}
