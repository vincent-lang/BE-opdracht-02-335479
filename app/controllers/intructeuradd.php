<?php

class intructeuradd extends BaseController
{

    private $intructeuraddinfo;

    public function __construct()
    {
        $this->intructeuraddinfo = $this->model('InstructeurModel');
    }

    public function index($Id = null)
    {
        $instructeur = $this->intructeuraddinfo->getInstructeurById($Id);
        // var_dump($instructeur);

        $result = $this->intructeuraddinfo->getVoertuigen($Id);
        $rows = '';
        $table = '';
        $head = '';
        if ($result == null) {
            $table = "Er zijn op dit moment nog geen voertuigen toegewezen aan deze instructeur";
                header('Refresh:3;url=/instructeur/index');
        } else {
            foreach ($result as $Voertuigen) {
                $head = "<th>Type voertuig</th>
                <th>Type</th>
                <th>Kenteken</th>
                <th>Bouwjaar</th>
                <th>Brandstof</th>
                <th>Rijbewijscategorie</th>";
                $rows .= "<tr>
                <td>$Voertuigen->TypeVoertuig</td>
                <td>$Voertuigen->Type</td>
                <td>$Voertuigen->Kenteken</td>
                <td>$Voertuigen->Bouwjaar</td>
                <td>$Voertuigen->Brandstof</td>
                <td>$Voertuigen->Rijbewijscategorie</td>
                </tr>";
            }
        }

        $data = [
            'title' => 'Alle beschikbare voertuigen',
            'records' => 'info uit de database',
            'nothing' => $table,
            'id' => $Id,
            'voornaam' => $instructeur[0]->Voornaam,
            'tussenvoegsel' => $instructeur[0]->Tussenvoegsel,
            'achternaam' => $instructeur[0]->Achternaam,
            'dienst' => $instructeur[0]->DatumInDienst,
            'sterren' => $instructeur[0]->AantalSterren,
            'table' => $head,
            'rows' => $rows
        ];

        $this->view('intructeuradd/index', $data);
    }
}
