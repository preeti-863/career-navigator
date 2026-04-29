<?php

$skill = $_GET['skill'] ?? 'python';

// 🔑 Replace with your API key
$apiKey = "AIzaSyDC-Eqsw_s-ZCuG2ipEzhx1olhqVlkcBmI";

$query = urlencode($skill . " beginner to advanced full course");


$url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&maxResults=10&videoDuration=medium&key=$apiKey";
$response = file_get_contents($url);
$data = json_decode($response, true);

$result = [];


foreach ($data['items'] as $item) {

    $title = $item['snippet']['title'];

    // ❌ Skip Shorts
    if (stripos($title, "short") !== false) {
        continue;
    }

    $result[] = [
        'title' => $title,
        'videoId' => $item['id']['videoId']
    ];
}

echo json_encode($result);