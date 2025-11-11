<?php
require_once __DIR__ . '/../Models/Job.php';

class JobsController {
    public static function getJobs() {
        header('Content-Type: application/json');
        echo json_encode(Job::all());
    }
}
?>