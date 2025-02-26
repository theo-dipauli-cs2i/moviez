<?php
    // POSTGRESQL
    // Fichier data/configuration.php
    // Configuration de la base de données
    $config = [
        'DRIVER' => 'pgsql',
        'HOST' => 'pgdb',
        'DATABASE' => 'appdb',
        'SCHEMA' => 'moviez',
        'PORT' => 5432,
        'USER' => 'postgres',
        'PASSWORD' => 'letmein',
    ];

    $dsn = "{$config['DRIVER']}:host={$config['HOST']};port={$config['PORT']};dbname={$config['DATABASE']}";
    $pdo = new PDO($dsn, $config['USER'], $config['PASSWORD'], array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    $pdo->query("SET SEARCH_PATH TO " . $config['SCHEMA']);
