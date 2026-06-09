from flask import Flask, request, jsonify

from course_fetcher import fetch_free_courses, fetch_paid_courses # pyright: ignore[reportMissingImports]

from recommend import recommend_courses # pyright: ignore[reportMissingImports]



app = Flask(__name__)


@app.route("/")
def home():
    return jsonify({
        "status": "Career Navigator API Running",
        "endpoint": "/recommend"
    })


@app.route("/recommend", methods=["POST"])

def recommend():



    data = request.json

    if not data:

        return jsonify({"error": "No data provided"}), 400



    career = data.get("aimed_career", "").strip()

    skills = data.get("skills", [])



    print("CAREER:", career)

    print("SKILLS:", skills)



    raw_free = fetch_free_courses(career, 10)

    raw_paid = fetch_paid_courses(career, 10)



    print("RAW FREE:", len(raw_free))

    print("RAW PAID:", len(raw_paid))



    processed = []



    for c in raw_free:

        processed.append({

            **c,

            "type": "free",

            "skills": [career.lower()],

            "level": "beginner"

        })



    for c in raw_paid:

        processed.append({

            **c,

            "type": "paid",

            "skills": [career.lower()],

            "level": "intermediate"

        })



    user_profile = {"skills": skills}



    recommendations = recommend_courses(processed, user_profile)



    # 🔥 CRITICAL FALLBACK (prevents empty UI)

    if not recommendations.get("free_courses") and raw_free:

        recommendations["free_courses"] = raw_free



    if not recommendations.get("paid_courses") and raw_paid:

        recommendations["paid_courses"] = raw_paid



    return jsonify(recommendations)





if __name__ == "__main__":

    app.run(host="0.0.0.0", port=5001, debug=True) 