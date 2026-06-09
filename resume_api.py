from flask import Flask, request, jsonify
import fitz  # PyMuPDF
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

app = Flask(__name__)

# -------- Career Knowledge Base --------
career_data = {
    "software_engineer": "java python c++ algorithms data structures oops software development git",
    "data_scientist": "python machine learning data analysis pandas numpy statistics sql visualization",
    "web_developer": "html css javascript php mysql react node bootstrap frontend backend",
    "ui_ux_designer": "figma adobe xd wireframing prototyping user experience user interface design",
    "project_manager": "project management agile scrum planning leadership risk management communication",
    "ai_engineer": "python deep learning tensorflow pytorch nlp computer vision neural networks",
    "cybersecurity_analyst": "network security encryption ethical hacking penetration testing firewalls security",
    "cloud_engineer": "aws azure cloud computing docker kubernetes infrastructure deployment",
    "devops_engineer": "ci cd docker kubernetes automation jenkins deployment monitoring",
    "mobile_app_developer": "android ios flutter react native kotlin swift mobile development",
    "network_engineer": "networking tcp ip routing switching firewall configuration troubleshooting"
}

# -------- PDF TEXT EXTRACTION --------
def extract_text_from_pdf(file_bytes):
    text = ""
    # Open using stream bytes directly
    pdf = fitz.open(stream=file_bytes, filetype="pdf")
    for page in pdf:
        text += page.get_text()
    return text.lower()


# -------- MAIN API --------
@app.route('/resume-analyze', methods=['POST'])
def analyze_resume():
    try:
        file = request.files.get('resume')
        career = request.form.get('career', '').lower()

        if not file or not career:
            return jsonify({"error": "Missing file or career"}), 400

        if career not in career_data:
            return jsonify({"error": "Invalid career"}), 400

        # Read file bytes once so we can safely reuse or decode them
        file_bytes = file.read()

        # -------- Extract Text --------
        if file.filename.endswith('.pdf'):
            resume_text = extract_text_from_pdf(file_bytes)
        else:
            resume_text = file_bytes.decode('utf-8', errors='ignore').lower()

        if not resume_text.strip():
            return jsonify({"error": "Empty resume text"}), 400

        # -------- FIXED TF-IDF PROCESSING --------
        # Build a complete vocabulary corpus containing the resume and ALL job descriptions
        corpus = [resume_text] + list(career_data.values())
        
        vectorizer = TfidfVectorizer()
        all_vectors = vectorizer.fit_transform(corpus)
        
        # Vector 0 is always the resume
        resume_vector = all_vectors[0]

        # Find specific score for target career
        # Get index of current target career track in the corpus list
        career_index = list(career_data.keys()).index(career) + 1
        target_career_vector = all_vectors[career_index]
        
        similarity = cosine_similarity(resume_vector, target_career_vector)[0][0]
        score = int(round(similarity * 100)) # Cast to integer for standard progress bars

        # -------- Missing Skills --------
        job_skills = career_data[career].split()
        missing_skills = [s for s in job_skills if s not in resume_text]

        # -------- Career Recommendation --------
        all_scores = []
        for i, (key, desc) in enumerate(career_data.items(), start=1):
            current_career_vector = all_vectors[i]
            sim = cosine_similarity(resume_vector, current_career_vector)[0][0]
            all_scores.append((key, int(round(sim * 100))))

        # Sort highest match to lowest
        all_scores.sort(key=lambda x: x[1], reverse=True)
        top_3 = all_scores[:3]

        return jsonify({
            "score": score,
            "missing_skills": missing_skills,
            "top_careers": top_3
        })

    except Exception as e:
        return jsonify({"error": f"Server processing error: {str(e)}"}), 500


# -------- RUN --------
if __name__ == '__main__':
    # Changed port to 5000 to instantly work with your PHP script
    app.run(debug=True, host='127.0.0.1', port=5000)