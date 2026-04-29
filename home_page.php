<?php 
$registered = isset($_GET['registered']) ? true : false; 
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Career Navigator | Navigate Your Future with AI</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

/* ================= GLOBAL ================= */
body {
    font-family: 'Poppins', sans-serif;
    padding-top: 80px;
    color: #1E293B;
    scroll-behavior: smooth;

    background: linear-gradient(-45deg, #f4f7fa, #e0f7f5, #e6f0ff, #fdf6e3);
    background-size: 400% 400%;
    animation: gradientMove 15s ease infinite;
}

@keyframes gradientMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

:root {
    --primary: #2AA9A1;
    --dark-blue: #1F3B5B;
    --accent: #E3B23C;
}

/* ================= NAVBAR ================= */
.navbar { background: linear-gradient(90deg, #1F3B5B, #2AA9A1); box-shadow: 0 6px 25px rgba(0,0,0,0.3); }
.navbar-brand {
    margin-left: -55px;
}

.navbar-brand img {
    border-radius: 50%;
    transition: 0.4s ease;
    box-shadow: 0 0 15px rgba(255,255,255,0.4);
}

.navbar-brand img:hover {
    transform: rotate(10deg) scale(1.1);
}

.nav-link {
    color: rgba(255,255,255,0.85) !important;
    font-weight: 500;
    transition: 0.3s ease;
}

.nav-link:hover {
    color: #00e0ff !important;
}
.brand-text {
    font-weight: 700;
    font-size: 1.4rem;
    background: linear-gradient(90deg, #ffffff, #2AA9A1, #00e0ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* ================= HERO ================= */

/* ================= PREMIUM HERO STYLING ================= */

.hero {
    height: 100vh;
    background: url("images/banner1.png") no-repeat center center/cover;
    display: flex;
    align-items: center;
    position: relative;
}

/* Soft overlay */
.hero-overlay {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: flex-start; /* ensures left alignment */
    flex-direction: column; /* stack content correctly */
    background: linear-gradient(
        to right,
        rgba(15, 23, 42, 0.95) 0%,
        rgba(15, 23, 42, 0.7) 25%,
        rgba(15, 23, 42, 0.3) 45%,
        rgba(15, 23, 42, 0) 55%
    );
    padding-top: 50px; /* optional for spacing */
}

/* Move content more to left */
.hero-content {
    max-width: 520px;
    color: white;
    margin-left: -40px; /* pushes more left */
    padding: 35px;
    border-radius: 20px;

    /* Glass effect */
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(10px);

    border: 1px solid rgba(255,255,255,0.15);
    box-shadow: 0 20px 40px rgba(0,0,0,0.3);
}

/* Badge */
.hero-badge {
    display: inline-block;
    background: rgba(42,169,161,0.2);
    color: #2AA9A1;
    padding: 6px 14px;
    border-radius: 30px;
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 0.5px;
}

/* Heading */
.hero-content h1 {
    font-size: 3rem;
    font-weight: 700;
    line-height: 1.2;
}

/* Accent color */
.text-accent {
    color: #2AA9A1;
}

/* Paragraph */
.hero-content p {
    font-size: 1.05rem;
    color: #e2e8f0;
}

/* Buttons */
.btn-primary {
    background: linear-gradient(135deg, #2AA9A1, #00c6ff);
    border: none;
    padding: 12px 30px;
    border-radius: 50px;
    font-weight: 600;
    transition: 0.3s ease;
}

.btn-primary:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 25px rgba(0,198,255,0.4);
}

.btn-outline-light {
    border-radius: 50px;
    padding: 12px 30px;
    font-weight: 600;
}

/* Buttons */
.btn-primary {
    background: linear-gradient(135deg, #2AA9A1, #00c6ff);
    border: none;
    padding: 12px 30px;
    border-radius: 50px;
    font-weight: 600;
}

.btn-outline-light {
    border-radius: 50px;
    padding: 12px 30px;
    font-weight: 600;
}

/* Buttons */
.btn-primary {
    background: linear-gradient(135deg, #2AA9A1, #00c6ff);
    border: none;
    padding: 12px 30px;
    border-radius: 50px;
    font-weight: 600;
    transition: 0.3s ease;
}

.btn-primary:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 25px rgba(0,198,255,0.3);
}

.btn-outline-primary {
    border-radius: 50px;
    padding: 12px 30px;
    font-weight: 600;
}

/* ================= FEATURE CARDS ================= */
.feature-card {
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(15px);
    border-radius: 25px;
    border: 1px solid rgba(255,255,255,0.4);
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    transition: 0.4s ease;
    position: relative;
    overflow: hidden;
}

.feature-card:hover {
    transform: translateY(-15px) scale(1.05);
    box-shadow: 0 25px 50px rgba(0,0,0,0.2);
}

/* Shine effect */
.feature-card::before {
    content: "";
    position: absolute;
    width: 200%;
    height: 200%;
    background: linear-gradient(45deg, transparent, rgba(42,169,161,0.2), transparent);
    top: -100%;
    left: -100%;
    transform: rotate(25deg);
    transition: 0.7s;
}

.feature-card:hover::before {
    top: 100%;
    left: 100%;
}

/* CARD IMAGES (YOUR ORIGINAL IMAGES KEPT) */
.feature-card img {
    transition: 0.4s ease;
}

.feature-card:hover img {
    transform: scale(1.15) rotate(5deg);
}
/* Smooth carousel slide */
#careerCarousel .carousel-inner {
    transition: transform 0.8s ease-in-out;
}

/* Glass-style cards */
.feature-card {
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(15px);
    border-radius: 25px;
    border: 1px solid rgba(255,255,255,0.4);
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    transition: 0.4s ease;
    position: relative;
    overflow: hidden;
}

.feature-card:hover {
    transform: translateY(-15px) scale(1.05);
    box-shadow: 0 25px 50px rgba(0,0,0,0.2);
}

.feature-card::before {
    content: "";
    position: absolute;
    width: 200%;
    height: 200%;
    background: linear-gradient(45deg, transparent, rgba(42,169,161,0.2), transparent);
    top: -100%;
    left: -100%;
    transform: rotate(25deg);
    transition: 0.7s;
}

.feature-card:hover::before {
    top: 100%;
    left: 100%;
}

/* Carousel arrows */
.carousel-control-prev-icon,
.carousel-control-next-icon {
    background-color: rgba(42,169,161,0.8);
    border-radius: 50%;
    width: 45px;
    height: 45px;
    background-size: 100%, 100%;
}
/* ================= CAREER CARDS GLASS EFFECT ================= */
#careers .feature-card {
    background: rgba(255,255,255,0.9);       /* glass effect */
    backdrop-filter: blur(15px);
    border-radius: 25px;
    border: 1px solid rgba(255,255,255,0.4);
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    overflow: hidden;
}

/* Keep subtle lift on hover but no image zoom */
#careers .feature-card:hover {
    transform: translateY(-10px);  subtle lift
    box-shadow: 0 25px 50px rgba(0,0,0,0.2);
}
/* Remove image zoom and tilt in careers carousel */
#careers .feature-card img {
    width: 100%;
    height: auto;
    object-fit: cover;
    transition: none !important;
}

#careers .feature-card:hover img {
    transform: none !important;
}

/* Fade-in animation */
.fade-in {
    opacity: 0;
    transform: translateY(40px);
    transition: all 1s ease;
}
.fade-in.show {
    opacity: 1;
    transform: translateY(0);
}
/* ================= CTA ================= */
.cta-section {
    background: linear-gradient(to right, #ffffff, #e6f7f6);
}
/* ================= ABOUT & STATS ================= */
.stats-box {
    background: rgba(255,255,255,0.8);
    backdrop-filter: blur(15px);
    border-radius: 25px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.1);
    transition: 0.4s ease;
}

.stats-box:hover {
    transform: translateY(-10px);
}

.counter {
    font-size: 2.2rem;
    font-weight: 700;
    color: var(--primary);
}

/* Footer Advanced */
.footer-advanced {
    background: linear-gradient(135deg, #1F3B5B, #2AA9A1);
    color: white;
    padding: 60px 0 20px 0;
}

.footer-advanced a {
    color: rgba(255,255,255,0.8);
    text-decoration: none;
    transition: 0.3s;
}

.footer-advanced a:hover {
    color: #00e0ff;
    padding-left: 5px;
}

.footer-bottom {
    border-top: 1px solid rgba(255,255,255,0.2);
    margin-top: 40px;
    padding-top: 20px;
    text-align: center;
}
/* ================= FOOTER ================= */
footer {
    background: linear-gradient(90deg, #1F3B5B, #2AA9A1);
    color: white;
    letter-spacing: 1px;
}

/* ================= SCROLL ANIMATION ================= */
.fade-in {
    opacity: 0;
    transform: translateY(40px);
    transition: all 1s ease;
}
.fade-in.show {
    opacity: 1;
    transform: translateY(0);
}
/* Chat Window Styling */
#chatWindow {
    position: fixed;
    bottom: 90px;
    right: 20px;
    width: 300px;
    height: 4500px;
    background: #f4f7fa;
    border-radius: 15px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.3);
    display: none;
    flex-direction: column;
    overflow: hidden;
    z-index: 9999;
    font-family: 'Poppins', sans-serif;
}

#chatWindowHeader {
    background:#2AA9A1;
    color:white;
    padding:12px;
    font-weight:600;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:1rem;
}

#chatMessages {
    flex:1;
    padding:10px;
    overflow-y:auto;
    display:flex;
    flex-direction:column;
    gap:8px;
}

.chat-msg {
    max-width: 80%;
    padding: 10px 14px;
    border-radius: 15px;
    line-height: 1.4;
    word-wrap: break-word;
    opacity: 0;
    transition: opacity 0.4s ease, transform 0.3s ease;
}

.chat-msg.show {
    opacity:1;
    transform: translateY(0);
}

/* AI Message */
.ai-msg {
    background: #cfdcdb;
    color: black;
    align-self: flex-start;
    display: flex;
    align-items: flex-start;
    gap:8px;
}

/* User Message */
.user-msg {
    background: #e0f7f5;
    color: #1F3B5B;
    align-self: flex-end;
    display: flex;
    align-items: flex-start;
    gap:8px;
}

/* Chat Input Area */
#chatInputArea {
    display:flex;
    border-top:1px solid #ddd;
}

#chatInput {
    flex:1;
    border:none;
    padding:10px 12px;
    outline:none;
    font-size:0.95rem;
}

#chatSendBtn {
    background:#2AA9A1;
    color:white;
    border:none;
    padding:10px 15px;
    cursor:pointer;
    transition:0.3s;
}

#chatSendBtn:hover {
    background:#1f8c84;
}

/* Avatars */
.chat-avatar {
    width:30px;
    height:30px;
    border-radius:50%;
    flex-shrink:0;
}
.chat-text h4 {
    font-size: 1rem;
    font-weight: 700;
    margin-bottom: 6px;
}

.chat-text h5 {
    font-size: 0.9rem;
    font-weight:200;
    margin-top: 8px;
    color: #052c28;
}

.chat-text p {
    font-size: 0.85rem;
    margin-bottom: 5px;
}

.chat-text ul {
    padding-left: 18px;
    margin: 5px 0;
}

.chat-text li {
    font-size: 0.85rem;
    margin-bottom: 3px;
}
</style>
</head>
<script>
/* ================= FADE-IN ANIMATION ================= */
document.addEventListener('DOMContentLoaded', () => {
    const faders = document.querySelectorAll('.fade-in');

    const fadeObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if(entry.isIntersecting){
                entry.target.classList.add('show');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.2 });

    faders.forEach(fader => fadeObserver.observe(fader));


    /* ================= COUNTER ANIMATION ================= */
    const counters = document.querySelectorAll('.counter');

    const counterObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if(entry.isIntersecting){
                const counter = entry.target;
                const target = +counter.getAttribute('data-target');
                let count = 0;
                const duration = 1500; // total time in ms
                const step = target / (duration / 16); // ~60fps

                const updateCounter = () => {
                    count += step;
                    if(count < target){
                        counter.innerText = Math.ceil(count);
                        requestAnimationFrame(updateCounter);
                    } else {
                        counter.innerText = target.toLocaleString(); // adds commas
                    }
                };

                updateCounter();
                observer.unobserve(counter);
            }
        });
    }, { threshold: 0.5 });

    counters.forEach(counter => counterObserver.observe(counter));
});
</script>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
<div class="container">
<a class="navbar-brand d-flex align-items-center" href="#">
<img src="images/logo.jpeg" width="47" class="me-2">
<span class="brand-text">Career Navigator</span>
</a>

<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarNav">
<ul class="navbar-nav ms-auto">
<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
<li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
<li class="nav-item"><a class="nav-link" href="register.php">Register</a></li>
<li class="nav-item"><a class="nav-link" href="login.php">Login</a></li>
</ul>
</div>
</div>
</nav>

<?php if($registered): ?>
<div class="alert alert-success text-center mt-3">
🎉 Registration successful! Welcome to Career Navigator.
</div>
<?php endif; ?>

<!-- Hero -->
<!-- Hero Section -->
<!-- Hero Section -->
<section class="hero">
    <div class="hero-overlay">
        <div class="container">
            <div class="hero-content">
                <span class="hero-badge">AI Powered Career Platform</span>
                <h1 class="mt-3">
                    Navigate Your <span class="text-accent">Future</span> with AI
                </h1>
                
                <p class="mt-4">
                    Career Navigator analyzes your skills, interests, and goals
                    to create a personalized roadmap and deliver AI-recommended
                    courses for smarter career decisions.
                </p>
<div class="mt-4">
    <input type="text" id="aiInput" class="form-control mb-2" 
         placeholder="Ask AI: Which career is best for me?">
    <button onclick="askAI()" class="btn btn-primary w-100">
         Ask AI
    </button>
        <div id="aiResponse" style="
         display: none; 
         max-height: 100px; 
         overflow-y: auto; 
         background: rgba(42,169,161,0.1); 
         color: #1E293B;
         padding: 10px; 
         border-radius: 10px; 
         margin-top: 10px;
         font-size: 0.95rem;
         ">
    </div>
</div>
                <div class="mt-4">
                    <a href="register.php" class="btn btn-primary btn-lg me-3">
                        Get Started
                    </a>
                    <a href="#features" class="btn btn-outline-light btn-lg">
                        Explore Features
                    </a>
                </div>
            </div>
            <!-- <div class="col-lg-6 text-center">
                <img src="images/banner1.png" class="img-fluid hero-image" alt="Career Navigator Banner">
            </div> -->
        </div>
    </div>
</section>

<!-- Features -->
<section id="features" class="py-5 fade-in">
<div class="container">
<h2 class="text-center fw-bold mb-5">Key Features</h2>

<div class="row g-4">

<div class="col-md-4">
<div class="card feature-card h-100 text-center p-4">
<img src="images/ai.png" width="70" class="mx-auto mb-3">
<h5 class="fw-semibold">AI Career Recommendation</h5>
<p class="text-muted">Intelligent suggestions tailored to your strengths.</p>
</div>
</div>

<div class="col-md-4">
<div class="card feature-card h-100 text-center p-4">
<img src="images/skill.png" width="70" class="mx-auto mb-3">
<h5 class="fw-semibold">Skill Gap Analysis</h5>
<p class="text-muted">Identify missing skills and improvement plans.</p>
</div>
</div>

<div class="col-md-4">
<div class="card feature-card h-100 text-center p-4">
<img src="images/roadmap.png" width="70" class="mx-auto mb-3">
<h5 class="fw-semibold">Personalized Roadmap</h5>
<p class="text-muted">Step-by-step structured learning path.</p>
</div>
</div>

</div>
</div>
</section>

    
<section id="careers" class="py-5 bg-body-tertiary">
  <div class="container">
    <h2 class="text-center fw-bold mb-5">In-Demand IT Careers</h2>

    <div id="careerCarousel" class="carousel slide" data-bs-ride="false" data-bs-interval="false" data-bs-pause="hover">
      <div class="carousel-inner">
        <?php
        $careers = [
            ["Software Developer","Build scalable applications and services.","images/software_developer.jpg"],
            ["Cybersecurity Expert","Protect digital assets against evolving threats.","images/cyber_security.webp"],
            ["Data Scientist","Turn data into actionable insights & ML models.","images/data_science.jpg"],
            ["Network Engineer","Design, implement and optimise resilient networks.","images/network_engineer.png"],
            ["AI/ML Engineer","Create intelligent systems that learn and adapt.","images/ai-ml.webp"],
            ["Cloud Engineer","Architect secure, scalable cloud infrastructure.","images/cloud.png"]
        ];

        $chunks = array_chunk($careers, 3); // 3 cards per slide
        foreach($chunks as $index => $group){
            $active = $index === 0 ? 'active' : '';
            echo '<div class="carousel-item '.$active.'">';
            echo '<div class="row g-4 justify-content-center">';
            foreach($group as $c){
                echo '
                <div class="col-md-4 fade-in">
                  <div class="card feature-card h-100 text-center p-4">
                    <div class="career-img-wrapper mb-3">
                    <img src="'.$c[2].'" class="img-fluid w-100 rounded-top" alt="'.$c[0].'">
                    </div>
                    <h5 class="fw-semibold">'.$c[0].'</h5>
                    <p class="text-muted">'.$c[1].'</p>
                    <a href="#" class="btn btn-primary mt-2">Explore</a>
                  </div>
                </div>';
            }
            echo '</div></div>';
        }
        ?>
      </div>

      <!-- Carousel Controls -->
      <button class="carousel-control-prev" type="button" data-bs-target="#careerCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#careerCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
</section>


<!-- CTA -->
<section class="cta-section py-5 text-center fade-in">
<div class="container">
<h2 class="fw-bold">Start Building Your Future Today</h2>
<p class="text-muted mt-3">Let AI guide your journey.</p>
<a href="register.php" class="btn btn-primary btn-lg mt-3">Create Free Account</a>
</div>
</section>
<!-- About Section -->
<section class="py-5 bg-light position-relative overflow-hidden">
    <div class="container">
        <div class="row align-items-center">
            
            <div class="col-lg-6 fade-in">
                <h2 class="fw-bold mb-4">Why Choose Career Navigator?</h2>
                <p class="text-muted">
                    Our AI-driven platform analyzes your skills, interests,
                    and career goals to provide intelligent career paths,
                    personalized roadmaps, and curated learning recommendations.
                </p>
                <p class="text-muted">
                    We combine technology with career psychology to help
                    you make confident, future-proof decisions.
                </p>
                <a href="register.php" class="btn btn-primary mt-3">
                    Start Your Journey
                </a>
            </div>

            <div class="col-lg-6 text-center fade-in">
                <div class="stats-box p-4">
                    <div class="row">
                        <div class="col-6 mb-4">
                            <h3 class="counter" data-target="5000">0</h3>
                            <p class="text-muted">Students Guided</p>
                        </div>
                        <div class="col-6 mb-4">
                            <h3 class="counter" data-target="120">0</h3>
                            <p class="text-muted">Career Paths</p>
                        </div>
                        <div class="col-6">
                            <h3 class="counter" data-target="98">0</h3>
                            <p class="text-muted">Success Rate %</p>
                        </div>
                        <div class="col-6">
                            <h3 class="counter" data-target="24">0</h3>
                            <p class="text-muted">AI Support</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- Footer -->
<footer class="footer-advanced">
    <div class="container">
        <div class="row">

            <div class="col-md-4 mb-4">
                <h5 class="fw-bold">Career Navigator</h5>
                <p>
                    AI-powered career guidance platform helping students
                    and professionals discover smarter paths.
                </p>
            </div>

            <div class="col-md-2 mb-4">
                <h6 class="fw-bold">Quick Links</h6>
                <ul class="list-unstyled">
                    <li><a href="#">Home</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="register.php">Register</a></li>
                    <li><a href="login.php">Login</a></li>
                </ul>
            </div>

            <div class="col-md-3 mb-4">
                <h6 class="fw-bold">Resources</h6>
                <ul class="list-unstyled">
                    <li><a href="#">Career Blog</a></li>
                    <li><a href="#">Learning Paths</a></li>
                    <li><a href="#">Support</a></li>
                    <li><a href="#">FAQs</a></li>
                </ul>
            </div>

            <div class="col-md-3 mb-4">
                <h6 class="fw-bold">Contact</h6>
                <p>Email: support@careernavigator.ai</p>
                <p>Phone: +123 456 7890</p>
            </div>

        </div>

        <div class="footer-bottom">
            <p class="mb-0">
                © <?php echo date("Y"); ?> Career Navigator AI | All Rights Reserved
            </p>
        </div>
    </div>
</footer>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
const faders = document.querySelectorAll('.fade-in');
const observer = new IntersectionObserver(entries => {
entries.forEach(entry => {
if(entry.isIntersecting){
entry.target.classList.add('show');
}
});
}, {threshold:0.3});

faders.forEach(fader => observer.observe(fader));
</script>
<script>
function askAI() {
    let inputField = document.getElementById("aiInput");
    let message = inputField.value.trim();

    if (!message) {
        alert("Please type something");
        return;
    }

    document.getElementById("aiResponse").innerHTML = "🤖 Thinking...";

    fetch("ai_chat.php", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ message: message })
    })
    .then(res => res.json())
    .then(data => {
        const responseDiv = document.getElementById("aiResponse");
        responseDiv.innerHTML += "<div><strong>AI:</strong> " + data.reply + "</div>";
        responseDiv.scrollTop = responseDiv.scrollHeight;
        
    })
    .catch(err => {
        console.error(err);
        document.getElementById("aiResponse").innerHTML =
            "⚠️ Error connecting to AI";
    });

    inputField.value = "";
}
</script>
<script>
function toggleChat() {
    let chat = document.getElementById("chatWindow");
    chat.style.display = (chat.style.display === "flex") ? "none" : "flex";
}

</script>

<!-- Chat Icon -->
<div id="chatIcon" onclick="toggleChat()" style="
position: fixed;
bottom: 25px;
right: 25px;
background: linear-gradient(135deg,#2AA9A1,#1F3B5B);
color: white;
width: 60px;
height: 60px;
border-radius: 50%;
display: flex;
align-items: center;
justify-content: center;
font-size: 28px;
cursor: pointer;
box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    padding: 12px 18px;
    font-weight: 600;
    z-index: 999;
    transition: 0.3s;
">
🤖
</div>

<!-- Chat Window -->
<div id="chatWindow" style="
position: fixed;
bottom: 90px;
right: 20px;
width: 320px;
height: 420px;
background: white;
border-radius: 15px;
box-shadow: 0 15px 40px rgba(0,0,0,0.3);
display: none;
flex-direction: column;
overflow: hidden;
z-index: 9999;
">

<div style="background:#2AA9A1;color:white;padding:12px;font-weight:600;">
    Career AI Assistant
</div>

<div id="chatMessages" style="flex:1;padding:10px;overflow-y:auto;"></div>

<div style="display:flex;border-top:1px solid #ddd;">
    <input id="chatInput" placeholder="Ask something..." 
        style="flex:1;border:none;padding:10px;outline:none;">
    <button onclick="sendChat()" 
        style="background:#2AA9A1;color:white;border:none;padding:10px 15px;">
        Send
    </button>
</div>

</div>
<script>
function sendChat() {
    const chatInput = document.getElementById("chatInput");
    const message = chatInput.value.trim();

    if (!message) return;

    const chatMessages = document.getElementById("chatMessages");

    // Show user message
    const userMsg = document.createElement("div");
    userMsg.style.textAlign = "right";
    userMsg.style.marginBottom = "8px";
    userMsg.innerHTML = "<strong>You:</strong> " + message;
    chatMessages.appendChild(userMsg);

    chatInput.value = "";

    // Call backend (Flask)
    fetch("ai_chat.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: message })
    })
    .then(res => res.json())
    .then(data => {
        const botMsg = document.createElement("div");
        botMsg.style.textAlign = "left";
        botMsg.style.marginBottom = "8px";
        botMsg.innerHTML = "<strong>AI:</strong> " + data.reply;
        chatMessages.appendChild(botMsg);

        chatMessages.scrollTop = chatMessages.scrollHeight;
    })
    .catch(err => {
        const errorMsg = document.createElement("div");
        errorMsg.style.color = "red";
        errorMsg.innerHTML = "⚠️ Server not running";
        chatMessages.appendChild(errorMsg);
    });
}
</script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const chatInput = document.getElementById("chatInput");

    chatInput.addEventListener("keypress", function(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            sendChat();
        }
    });
});
</script>
<script>
const chatIcon = document.getElementById("chatIcon");
const chatWindow = document.getElementById("chatWindow");
const chatMessages = document.getElementById("chatMessages");
const chatInput = document.getElementById("chatInput");
const chatSendBtn = document.getElementById("chatSendBtn");

// Toggle Chat Window
function toggleChat() {
    chatWindow.style.display = (chatWindow.style.display === "flex") ? "none" : "flex";
}

// Send message
function sendChat() {
    const message = chatInput.value.trim();
    if (!message) return;

    // User message
    const userMsg = document.createElement("div");
    userMsg.classList.add("chat-msg","user-msg");
    userMsg.innerHTML = `
        <div>${message}</div>
        <img src="images/user_icon.png" class="chat-avatar">
    `;
    chatMessages.appendChild(userMsg);
    fadeIn(userMsg);

    chatInput.value = "";
    chatMessages.scrollTop = chatMessages.scrollHeight;

    // AI call
    fetch("ai_chat.php", {
        method:"POST",
        headers:{"Content-Type":"application/json"},
        body: JSON.stringify({message: message})
    })
    .then(res => res.json())
    .then(data => {
        const botMsg = document.createElement("div");
        botMsg.classList.add("chat-msg","ai-msg");
        botMsg.innerHTML = `
            <img src="images/robot_icon.webp" class="chat-avatar">
            <div class="chat-text">${data.reply}</div>
        `;
        chatMessages.appendChild(botMsg);
        fadeIn(botMsg);
        chatMessages.scrollTop = chatMessages.scrollHeight;
    })
    .catch(err => {
        const errMsg = document.createElement("div");
        errMsg.classList.add("chat-msg","ai-msg");
        errMsg.innerHTML = `
            <img src="images/robot_icon.webp" class="chat-avatar">
            <div>⚠️ Server not responding</div>
        `;
        chatMessages.appendChild(errMsg);
        fadeIn(errMsg);
    });
}

// Fade-in helper
function fadeIn(element){
    setTimeout(()=> element.classList.add("show"),50);
}

// Enter key to send
chatInput.addEventListener("keypress", function(event){
    if(event.key==="Enter"){
        event.preventDefault();
        sendChat();
    }
});

chatSendBtn.addEventListener("click", sendChat);
</script>
</body>
</html>