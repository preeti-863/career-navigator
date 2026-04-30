<?php
session_start();
header("Content-Type: application/json");

include 'config.php';

// =========================
// OPTIONAL LOGIN
// =========================
$user_id = $_SESSION['user_id'] ?? null;

$education = 'Not specified';
$experience = 'Not specified';
$skills_text = 'No skills provided';

// =========================
// GET USER MESSAGE
// =========================
$input = json_decode(file_get_contents("php://input"), true);
$user_message = trim($input['message'] ?? '');

if (empty($user_message)) {
    echo json_encode(["reply" => "<p>Please ask something.</p>"]);
    exit();
}

// =========================
// FETCH USER DATA (ONLY IF LOGGED IN)
// =========================
if ($user_id) {

    $user_id = (int)$user_id;

    // Fetch profile
    $profile_query = $conn->query("
        SELECT education_level, experience_level 
        FROM user_profile 
        WHERE user_id = $user_id
    ");

    if ($profile_query && $profile_query->num_rows > 0) {
        $profile = $profile_query->fetch_assoc();
        $education = $profile['education_level'] ?? 'Not specified';
        $experience = $profile['experience_level'] ?? 'Not specified';
    }

    // Fetch skills
    $skills = [];
    $skills_result = $conn->query("
        SELECT skill_name 
        FROM user_skill_mapping 
        WHERE user_id = $user_id
    ");

    if ($skills_result) {
        while ($row = $skills_result->fetch_assoc()) {
            $skills[] = $row['skill_name'];
        }
    }

    if (!empty($skills)) {
        $skills_text = implode(", ", $skills);
    }
}

// =========================
// CREATE AI PROMPT
// =========================
$prompt = "
You are a Career Guidance AI inside a web app called Career Navigator.

User Profile:
- Education: $education
- Experience: $experience
- Skills: $skills_text

IMPORTANT INSTRUCTIONS:
- Answer ONLY career-related questions
- If question is unrelated, politely refuse
- Keep answers SHORT and structured
- ALWAYS return HTML formatted response

FORMAT RULES:
- Use <h4> for headings
- Use <h5> for subheadings
- Use <ul><li> for points
- Use <p> for text
- DO NOT return plain text
- DO NOT use markdown

- If user is NOT logged in:
  Give general advice + suggest signing up for personalized guidance

FORMAT EXAMPLE:
<h4>💼 Career Option: Data Scientist</h4>
<p>This career focuses on analyzing data.</p>

<h5>🧠 Skills Required</h5>
<ul>
<li>Python</li>
<li>Machine Learning</li>
<li>Statistics</li>
</ul>

<h5>🚀 How to Start</h5>
<ul>
<li>Learn Python</li>
<li>Build projects</li>
</ul>

User Question:
$user_message
";

// =========================
// GEMINI API CALL
// =========================
$apiKey = ""; // ⚠️ IMPORTANT: keep this secure

$model = "gemini-flash-latest";
$url = "https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey";

$data = [
    "contents" => [
        [
            "parts" => [
                ["text" => $prompt]
            ]
        ]
    ]
];

$options = [
    "http" => [
        "header"  => "Content-Type: application/json",
        "method"  => "POST",
        "content" => json_encode($data),
        "ignore_errors" => true
    ]
];

$context = stream_context_create($options);
$response = file_get_contents($url, false, $context);

// =========================
// ERROR HANDLING
// =========================
if ($response === FALSE) {
    echo json_encode(["reply" => "<p>⚠️ Unable to connect to AI service</p>"]);
    exit();
}

$result = json_decode($response, true);

// =========================
// EXTRACT RESPONSE
// =========================
$reply = "<p>⚠️ No response from AI</p>";

if (isset($result['candidates'][0]['content']['parts'][0]['text'])) {
    $reply = $result['candidates'][0]['content']['parts'][0]['text'];
} elseif (isset($result['error']['message'])) {
    $reply = "<p>⚠️ API Error: " . $result['error']['message'] . "</p>";
}

// =========================
// CLEAN RESPONSE
// =========================
$reply = str_replace(["```html", "```"], "", $reply);

// =========================
// RETURN RESPONSE
// =========================
echo json_encode(["reply" => $reply]);
