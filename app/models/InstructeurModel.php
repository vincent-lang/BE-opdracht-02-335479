<?php

class InstructeurModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $sql = "SELECT Id
                       ,Voornaam
                       ,Tussenvoegsel
                       ,Achternaam
                       ,Mobiel
                       ,DatumInDienst
                       ,AantalSterren
                FROM   Instructeur ORDER BY AantalSterren DESC";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getVoertuigen($Id = null)
    {
        $sql = "SELECT
            voer.Type
            ,voer.Kenteken
            ,voer.Bouwjaar
            ,voer.Brandstof
            ,typevoer.TypeVoertuig
            ,typevoer.Rijbewijscategorie
            from Instructeur as instruct

            inner join VoertuigInstructeur as voerinstruc
            on instruct.Id = voerinstruc.InstructeurId
            
            inner join Voertuig as voer
            on voerinstruc.VoertuigId = voer.Id
            
            inner join TypeVoertuig as typevoer
            on voer.TypeVoertuigId = typevoer.Id
            
            where instruct.Id = $Id
            order by typevoer.Rijbewijscategorie asc";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getInstructeurById($Id)
    {
        $sql = "SELECT * FROM Instructeur WHERE Id = $Id";

        $this->db->query($sql);
        return $this->db->resultSet();

    }
}
