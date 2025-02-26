<?php
include_once 'data/configuration.php';

$requeteRandomFilm = <<< SQL
            SELECT *
            FROM films 
            ORDER BY RANDOM()
            LIMIT 1;
        SQL;

$requete = $pdo->prepare($requeteRandomFilm);
$requete->execute();
$randomFilm = $requete->fetch(PDO::FETCH_OBJ);

?>

<h2><i class="bi bi-shuffle mt-5"></i> Un film au hasard</h2>
<div class="card">
    <img class="card-img-top img-fluid" src="<?= $randomFilm->affiche ?>" alt="<?= $randomFilm->titre ?>">
    <h5 class="card-header"><?= $randomFilm->titre ?></h5>
    <div class="card-body">
        <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                Année
                <span class="text-end"><?= $randomFilm->annee ?></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                Note
                <span class="badge bg-success fs-6"><?= $randomFilm->note ?></span>
            </li>
        </ul>
    </div>
</div>