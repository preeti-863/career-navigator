# recommend.py
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

def recommend_courses(courses_list, user_profile, top_n=5):
    if not courses_list:
        return {
            "free_courses": [],
            "paid_courses": []
        }

    df = pd.DataFrame(courses_list)

    df['skills'] = df['skills'].astype(str)
    df['level'] = df['level'].astype(str)

    df['skills_text'] = df['skills'].str.lower().str.replace(",", " ")
    df['skills_text'] = df['skills_text'] + " " + df['level'].str.lower()

    skills = user_profile.get('skills', [])
    if not skills:
        skills = ["general"]

    skills = user_profile.get('skills', [])
    skills = [s.lower().strip() for s in skills]
    
    user_skills = " ".join(skills + ["beginner"])

    vectorizer = CountVectorizer(stop_words='english')
    course_vectors = vectorizer.fit_transform(df['skills_text'])
    user_vector = vectorizer.transform([user_skills])

    similarity = cosine_similarity(user_vector, course_vectors).flatten()
    df['similarity'] = similarity
    df['type'] = df['type'].str.lower().str.strip()

    free_courses = df[df['type'] == 'free'].sort_values(by='similarity', ascending=False)
    paid_courses = df[df['type'] == 'paid'].sort_values(by='similarity', ascending=False)

    return {
        "free_courses": free_courses[['course_name', 'platform', 'url']].head(top_n).to_dict(orient='records'),
        "paid_courses": paid_courses[['course_name', 'platform', 'url']].head(top_n).to_dict(orient='records')
    }