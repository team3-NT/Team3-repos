<?php
// Connection details
$host = getenv('DB_HOST');
$dbname = getenv('DB_NAME');
$user = getenv('DB_USER');
$password = getenv('DB_PASSWORD');

$dsn = "pgsql:host=$host;dbname=$dbname";

try {
    // Connect to PostgreSQL database
    $pdo = new PDO($dsn, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

    // Fetch data from the users table
    $stmt = $pdo->query("SELECT * FROM users");
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "<h1>Users List</h1>";
    foreach ($users as $user) {
        echo "<p>ID: {$user['id']}, Name: {$user['name']}, Email: {$user['email']}</p>";
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>