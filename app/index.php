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
    ?>

    <header class="container-fluid">
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/dune_h800.jpg" class="d-block w-100" alt="dune">
                    <div class="carousel-caption d-none d-md-block">
                        <div class="d-flex justify-content-center align-items-center">
                            <img class="rounded w-25 mx-2" src="images/dune-logo.jpg" alt="Dune Logo">
                            <h1 class="mb-0">Denis Villeneuve</h1>
                        </div>
                        <p>Paul atreides & Lady Jessica Atreides</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/dune_bene_gesserit_h800.jpg" class="d-block w-100" alt="dune1">
                    <div class="carousel-caption d-none d-md-block">
                        <div class="d-flex justify-content-center align-items-center">
                            <img class="rounded w-25 mx-2" src="images/dune-logo.jpg" alt="Dune Logo">
                            <h1 class="mb-0">Denis Villeneuve</h1>
                        </div>
                        <p>Paul atreides & Lady Jessica Atreides</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/dune2_h800.jpg" class="d-block w-100" alt="dune2">
                    <div class="carousel-caption d-none d-md-block">
                        <div class="d-flex justify-content-center align-items-center">
                            <img class="rounded w-25 mx-2" src="images/dune-logo.jpg" alt="Dune Logo">
                            <h1 class="mb-0">Denis Villeneuve</h1>
                        </div>
                        <p>Paul atreides & Lady Jessica Atreides</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </header>

    <div class="container">
        <div class="row mb-5">
            <div class="col-md-9 mt-5">
                <h1>Mis en avant aujourd'hui</h1>
                <hr>
                <h2><i class="bi bi-cup-hot-fill"> Sorties de la semaine</i></h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corrupti sint dolorem sequi saepe omnis, dolores voluptate alias laborum inventore nesciunt necessitatibus quo veritatis velit distinctio ut veniam, eveniet consequatur? Dolores, debitis delectus corrupti odio facilis, quidem porro optio veniam recusandae, tempora qui quibusdam? Blanditiis, accusantium laudantium nulla perspiciatis tempora sunt itaque adipisci esse atque unde facere doloribus quos? Et, consequatur veritatis. Architecto vitae perspiciatis, soluta praesentium odio rerum voluptate, illo cupiditate, nemo ipsum quasi eaque! Nihil, reprehenderit ducimus tempore quisquam enim vitae, ea distinctio maiores alias, tenetur minus odio accusantium est voluptatem. Quibusdam aliquam reprehenderit mollitia, atque repudiandae consequatur officiis?</p>
                <div class="row mb-5">
                    <div class="col-md-4 mt-5">
                        <h3>> Top #1</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, perspiciatis facere veniam vero accusamus eaque quo optio velit repudiandae sapiente ipsum ad fuga! Consequuntur beatae amet fugit ipsa aliquam possimus!</p>
                    </div>
                    <div class="col-md-4 mt-5">
                        <h3>> Top #2</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, perspiciatis facere veniam vero accusamus eaque quo optio velit repudiandae sapiente ipsum ad fuga! Consequuntur beatae amet fugit ipsa aliquam possimus!</p>
                    </div>
                    <div class="col-md-4 mt-5">
                        <h3>> Top #3</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, perspiciatis facere veniam vero accusamus eaque quo optio velit repudiandae sapiente ipsum ad fuga! Consequuntur beatae amet fugit ipsa aliquam possimus!</p>

                    </div>
                </div>

                <div class="text-center">
                    <a href="films_liste.php" class="btn btn-outline-warning m-5 btn-lg" role="button"><i class="bi bi-film"></i> Tous les films</a>
                </div>


                <h2><i class="bi bi-person-circle"></i> Acteurs en vue</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reprehenderit illo voluptas, officiis cumque molestias unde nostrum deleniti voluptatum a. Doloremque, sint odit? Laboriosam, obcaecati voluptatem porro esse tenetur rem nihil ad tempore laborum nisi accusantium blanditiis cupiditate eum placeat eos labore harum dolore amet aut animi illo exercitationem. Saepe, sunt provident repudiandae autem quasi quisquam recusandae enim atque cumque vitae soluta minus animi ut aliquid omnis quo deserunt facere, eaque sequi dolores praesentium corporis sit ducimus! Necessitatibus ducimus corrupti suscipit, eveniet mollitia voluptatibus ad modi quidem quas porro quisquam saepe quia deleniti placeat maiores quaerat aperiam perferendis aliquid consectetur voluptatem.</p>



            </div>
            <div class="col-md-3 mt-5">
                <h2><i class="bi bi-eye"></i> Que regarder ?</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum quibusdam architecto labore hic? Molestias eius dolor voluptatum. Reiciendis, ullam debitis.</p>
                <div class="mt-5">
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
                </div>
            </div>
        </div>
    </div>


    <?php include "includes/footer.php" ?>
</body>

</html>