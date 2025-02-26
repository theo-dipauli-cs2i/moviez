<!DOCTYPE html>
<html lang="en">

<head>
    <?php include "includes/head.php" ?>
    <title>Document</title>

</head>

<body>
    <?php
    include "includes/navigation.php";

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


    $requeteFilms = <<< SQL
            SELECT id,titre, p.pays AS "pays", annee, affiche
            FROM films f
            INNER JOIN pays p ON f.codepays = p.codepays
            ORDER BY titre;
        SQL;

    $requete = $pdo->prepare($requeteFilms);
    $requete->execute();
    $donnees = $requete->fetchAll(PDO::FETCH_OBJ);
    $countFilms = $requete->rowCount();
    ?>

    <div class="container">
        <h1 class="d-flex align-items-center my-5">
            Liste des films
            <span class="badge bg-info text-white ms-2 d-flex align-items-center">
                <i class="bi bi-film me-1"></i> <?= $countFilms ?>
            </span>
        </h1>

        <div class="row mb-5">
            <div class="col-md-8 mt-5">
                <div class="table-responsive w-auto mx-auto">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Affiche</th>
                                <th scope="col">Titre</th>
                                <th scope="col">Année</th>
                                <th scope="col">Pays</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($donnees as $film): ?>
                                <tr>
                                    <td>
                                        <img class="img-fluid" style="max-width: 100px;" src="<?= $film->affiche ?>" alt="">
                                    </td>
                                    <td><a class="text-decoration-none" href="film-detail.php?id=<?= $film->id ?>">
                                            <?= $film->titre ?>
                                        </a>
                                    </td>

                                    <td><?= $film->annee ?></td>
                                    <td><?= $film->pays ?></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4 mt-5">
                <?php include "random_film.php" ?>
            </div>
        </div>

    </div>


    <?php include "includes/footer.php" ?>
</body>

</html>