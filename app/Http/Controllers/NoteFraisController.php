<?php

namespace App\Http\Controllers;

use App\Mission;
use App\NoteFrais;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NoteFraisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //        
        // $membre = \App\Mission::find($id)->ID_MISSION;

        // $idMission = DB::select("select * from NOTE_DE_FRAIS where ID_MISSION = $membre");

        // $missions = (array) $idMission;
        // return view('note.listeNoteFrais',['missions'=>$missions]);
        //return view('note.listeNoteFrais');
        //

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {


        $Visiteurs = Mission::all();
        $tab = array();
        foreach ($Visiteurs as $v) {

            if ($v) {
                $tab[] = $v;
            }
        }


        //
        return view('note.create', ['ID_PERS' => $tab]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //

        //$membre = \App\Mission::find()->ID_MISSION;

        $notefrais = new \App\NoteFrais();
        //$notefrais2 = new \App\Mission();

        $notefrais->DATE_DEPOT = $request->input('DATE_DEPOT');

        $notefrais->Nom = $request->input('NOM');

        $notefrais->ID_MISSION = $request->input('ID_PERS');

        //$notefrais->total = $request->input('TOTAL');





        //$notefrais->ID_NOTE_DE_FRAIS  = $membre->ID_MISSION;

        $notefrais->save();

        //return redirect('notefrais');
        return redirect()->action('NoteFraisController@show', [$notefrais->ID_MISSION = $request->input('ID_PERS')]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //$membre = \App\Mission::find($id)->ID_MISSION;

        $idMission = DB::select("select * from NOTE_DE_FRAIS where ID_MISSION = $id");

        $missions = (array) $idMission;

        //$moneyy = DB::select("select Total - donner from LIGNE_DE_FRAIS
        //where ID_NOTE_DE_FRAIS = $membre");

        //$missionss = (array) $moneyy;

        return view('note.listeNoteFrais', ['missions' => $missions]);

        //
        //$membre = \App\Mission::find($id);

        //$missions = $membre->missions;

        //return view('missions.listeNoteFrais')->with('missions', $missions);
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
         
        // $tab = array();


        // return view('note.edit',['ID_PERS'=>$tab],compact('id'));

        $mission = \App\NoteFrais::find($id);

        $Visiteurs = Mission::all();
        $tab = array();
        foreach($Visiteurs as $v){

            if($v){
                $tab[]=$v;
            }                
        }
        

        //
        return view('note/edit', compact('mission', 'id'),['ID_PERS'=>$tab]);
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

        //$membre = \App\Mission::find();
        $notefrais = \App\NoteFrais::find($id);
        //$notefrais2 = new \App\Mission();

        $notefrais->DATE_DEPOT = $request->input('DATE_DEPOT');

        $notefrais->Nom = $request->input('NOM');

        $notefrais->ID_MISSION = $request->input('ID_PERS');




        $id_mission = $notefrais->ID_MISSION;


        //$notefrais->ID_MISSION = $membre->ID_MISSION;

        $notefrais->save();

        //return redirect('notefrais');
        return redirect()->action('NoteFraisController@show', $id_mission);
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
        $mission = \App\NoteFrais::find($id);

        $id_mission = $mission->ID_MISSION;

        $mission->delete();



        return redirect()->action('NoteFraisController@show', $id_mission);
    }
}
