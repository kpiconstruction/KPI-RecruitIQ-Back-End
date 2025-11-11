<?php
class Job {
    public static function all() {
        $pdo = new PDO('mysql:host=' . getenv('DB_HOST') . ';dbname=' . getenv('DB_NAME'), getenv('DB_USER'), getenv('DB_PASS'));
        $stmt = $pdo->query('SELECT * FROM jobs');
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>