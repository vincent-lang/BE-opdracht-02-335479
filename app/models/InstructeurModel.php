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

    public function getbeschikbarevoertuigen()
    {
        $sql = "SELECT
            voer.Type
            ,voer.Kenteken
            ,voer.Bouwjaar
            ,voer.Brandstof
            ,typevoer.TypeVoertuig
            ,typevoer.Rijbewijscategorie
            ,voer.Id
            from Voertuig as voer

            left join VoertuigInstructeur as voerinstruc
            on voer.Id = voerinstruc.voertuigId
            
            inner join TypeVoertuig as typevoer
            on voer.TypeVoertuigId = typevoer.Id
            
            where voerinstruc.voertuigId is NUll";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getInstructeurById($Id)
    {
        $sql = "SELECT * FROM Instructeur WHERE Id = $Id";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function addVehicleToInstructeur($voertuigId, $instructeurId)
    {
        $sql =  "INSERT INTO VoertuigInstructeur (VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
        VALUES ($voertuigId, $instructeurId, SYSDATE(3), 1, NULL, SYSDATE(6), SYSDATE(6));";

        $this->db->query($sql);
        return $this->db->resultSet();
    }
}
