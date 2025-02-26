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

    $id = $_GET['id'];
    $requeteFilm = <<< SQL
            SELECT id,titre, p.pays AS "pays", annee, affiche, note, duree, producteur, resume
            FROM films f
            INNER JOIN pays p ON f.codepays = p.codepays
            WHERE id like :id;
        SQL;

    $requete = $pdo->prepare($requeteFilm);
    $requete->execute(['id' => $id]);
    $film = $requete->fetch(PDO::FETCH_OBJ);

    $requeteacteurs = <<< SQL
        SELECT nomacteur, prenomacteur 
        FROM acteurs a
        INNER JOIN roles r ON r.idacteur = a.id
        WHERE r.idfilm LIKE :id;
    SQL;

    $requete = $pdo->prepare($requeteacteurs);
    $requete->execute(['id' => $id]);
    $acteurs = $requete->fetchAll(PDO::FETCH_OBJ);

    $requeteRealisateurs = <<< SQL
        SELECT nomrealisateur, prenomrealisateur 
        FROM realisateurs real
        INNER JOIN realisations rea ON rea.idrealisateur = real.id
        WHERE rea.idfilm LIKE :id;
    SQL;

    $requete = $pdo->prepare($requeteRealisateurs);
    $requete->execute(['id' => $id]);
    $realisateurs = $requete->fetchAll(PDO::FETCH_OBJ);

    $requetegenres = <<< SQL
        SELECT libellegenre 
        FROM genres g
        INNER JOIN classificationsfilms c ON g.codegenre = c.codegenre
        WHERE c.idfilm LIKE :id;
    SQL;

    $requete = $pdo->prepare($requetegenres);
    $requete->execute(['id' => $id]);
    $genres = $requete->fetchAll(PDO::FETCH_OBJ);

    $countFilms = $requete->rowCount();
    ?>

    <div class="container">
        <h1 class="d-flex align-items-center my-5">
            <?= $film->titre ?>
            <span class="badge bg-info text-white ms-2 d-flex align-items-center">
                <i class="bi bi-film me-1"></i> <?= $film->note ?>
            </span>
        </h1>
        <div class="row mb-5">
            <div class="col-md-8">
                <div class="table-responsive w-auto mx-auto">
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <td>
                                    <p><i class="bi bi-person-video"></i> Réalisateurs</p>
                                </td>
                                <td>
                                    <?php foreach ($realisateurs as $realisateur) : ?>
                                        <span class="badge rounded-pill bg-danger"><?= $realisateur->prenomrealisateur . ' ' . $realisateur->nomrealisateur ?></span>
                                    <?php endforeach; ?>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><i class="bi bi-person-video2"></i> Acteurs</p>
                                </td>
                                <td>
                                    <?php foreach ($acteurs as $acteur) : ?>
                                        <span class="badge rounded-pill bg-warning"><?= $acteur->prenomacteur . ' ' . $acteur->nomacteur ?></span>
                                    <?php endforeach; ?>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><i class="bi bi-flag"></i> Pays</p>
                                </td>
                                <td><strong><?= $film->pays ?></strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><i class="bi bi-calendar"></i> Année</p>
                                </td>
                                <td><strong><?= $film->annee ?></strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><i class="bi bi-currency-exchange"></i> Producteur</p>
                                </td>
                                <td><strong><?= $film->producteur ?></strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><i class="bi bi-clock"></i> durée</p>
                                </td>
                                <td><strong><?= $film->duree ?> mn</strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><i class="bi bi-book"></i> Résumé</p>
                                </td>
                                <td><?= $film->resume ?></td>
                            </tr>
                            <tr>
                                <td>
                                    <p><i class="bi bi-tag"></i> Genres</p>
                                </td>
                                <td>
                                    <?php foreach ($genres as $genre) : ?>
                                        <span class="badge rounded-pill bg-primary"><?= $genre->libellegenre ?></span>
                                    <?php endforeach; ?>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4">
                <img class="img-fluid" src="<?= $film->affiche ?>" alt="">
                <div class="table-responsive w-auto mx-auto">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>
                                    <h3><?= $film->titre ?></h3>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Année</p>
                                </td>
                                <td><?= $film->annee ?></td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Note</p>
                                </td>
                                <td><span class="badge bg-success"><?= $film->note ?></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-primary" onclick="window.location.href='films_liste.php'"><i class="bi bi-arrow-left"></i></button>

    </div>


    <?php include "includes/footer.php" ?>
</body>

</html>