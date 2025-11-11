<?php
class Application {
    public static function create($job_id, $name, $email) {
        $pdo = new PDO('mysql:host=' . getenv('DB_HOST') . ';dbname=' . getenv('DB_NAME'), getenv('DB_USER'), getenv('DB_PASS'));
        $stmt = $pdo->prepare('INSERT INTO applications (job_id, applicant_name, applicant_email) VALUES (?, ?, ?)');
        $stmt->execute([$job_id, $name, $email]);
    }
}
?>