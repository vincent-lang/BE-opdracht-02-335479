<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../public/css/style.css">
    <title>Document</title>
</head>
<body>
    <h3><?= $data['title']; ?></h3>
    <h3>Naam: <?= $data['voornaam'] . " " . $data['tussenvoegsel'] . " " . $data['achternaam']; ?></h3>
    <h3>Datum in Dienst: <?= $data['dienst']; ?></h3>
    <h3>Aantal sterren: <?= $data['sterren']; ?></h3>
    <h3><?= $data['nothing']; ?></h3>
    <h3>
        <a href="<?= URLROOT; ?>/intructeuradd/index">Toevoegen voertuig</a>
    </h3>
    <table>
        <thead>
            <?= $data['table']; ?>
        </thead>
        <tbody>
            <?= $data['rows'];  ?>
        </tbody>
    </table>
    <a href="<?= URLROOT; ?>/instructeur/index">instructeur page</a>
</body>
</html>