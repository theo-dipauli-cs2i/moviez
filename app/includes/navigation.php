<?php
    $current_page = basename($_SERVER['REQUEST_URI']);
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.php"><i class="bi bi-film"></i> Moviez</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle <?php echo ($current_page == '') ? 'active' : ''; ?>" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Cinéma
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="films_liste.php"><i class="bi bi-film"></i> Films</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link <?php echo ($current_page == 'apropos.php') ? 'active' : ''; ?>" href="apropos.php">À propos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>