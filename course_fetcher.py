# course_fetcher.py
import requests
import googleapiclient.discovery # pyright: ignore[reportMissingImports]


YOUTUBE_API_KEY = ""
RAPIDAPI_KEY = ""


# =========================

# PAID COURSES

# =========================

def fetch_paid_courses(career_name, max_results=5):



    career_name = career_name.strip().lower()



    career_map = {

        "software engineer": [

            {"course_name": "CS50's Introduction to Computer Science", "platform": "edX/Harvard", "url": "https://www.edx.org/course/introduction-computer-science-harvard-cs50x"},

            {"course_name": "Software Engineering Masterclass", "platform": "Udemy", "url": "https://www.udemy.com"}

        ],

        "data scientist": [

            {"course_name": "IBM Data Science Professional Certificate", "platform": "Coursera", "url": "https://www.coursera.org/professional-certificates/ibm-data-science"},

            {"course_name": "Data Science MicroMasters", "platform": "edX", "url": "https://www.edx.org/micromasters/uc-san-diegox-data-science"}

        ],

        "ai engineer": [

            {"course_name": "Deep Learning Specialization", "platform": "Coursera", "url": "https://www.coursera.org/specializations/deep-learning"},

            {"course_name": "AI Engineer Nanodegree", "platform": "Udacity", "url": "https://www.udacity.com"}

        ],

        "web developer": [

            {"course_name": "The Complete Web Development Bootcamp", "platform": "Udemy", "url": "https://www.udemy.com"}

        ],

        "cybersecurity analyst": [

            {"course_name": "Google Cybersecurity Certificate", "platform": "Coursera", "url": "https://www.coursera.org"}

        ],

        "cloud engineer": [

            {"course_name": "AWS Solutions Architect", "platform": "Udemy", "url": "https://www.udemy.com"}

        ],

        "devops engineer": [

            {"course_name": "Docker & Kubernetes Mastery", "platform": "Udemy", "url": "https://www.udemy.com"}

        ],

        "network engineer": [

            {"course_name": "Cisco CCNA Complete Course", "platform": "Udemy", "url": "https://www.udemy.com"}

        ]

    }



    if career_name in career_map:

        return [

            {**c, "type": "paid", "skills": [career_name], "level": "intermediate"}

            for c in career_map[career_name]

        ]



    # fallback API

    try:

        url = "https://udemy-course-scraper-api.p.rapidapi.com/rapidapi/courses/search"

        headers = {

            "X-RapidAPI-Key": RAPIDAPI_KEY,

            "X-RapidAPI-Host": "udemy-course-scraper-api.p.rapidapi.com"

        }



        response = requests.get(url, headers=headers, params={"query": career_name})

        data = response.json()



        courses = []

        for c in data.get("courses", [])[:max_results]:

            courses.append({

                "course_name": c.get("title", "No Title"),

                "platform": "Udemy",

                "url": c.get("url", "#"),

                "type": "paid",

                "skills": [career_name],

                "level": "intermediate"

            })



        return courses



    except Exception as e:

        print("RapidAPI Error:", e)

        return []





# =========================

# FREE COURSES (YouTube)

# =========================

def fetch_free_courses(query, max_results=5):

    try:
        youtube = googleapiclient.discovery.build(
            "youtube",
            "v3",
            developerKey=YOUTUBE_API_KEY
        )

        request = youtube.search().list(
            q=f"{query} full course roadmap tutorial",
            part="snippet",
            type="video",
            maxResults=max_results
        )

        response = request.execute()

        courses = []

        for item in response.get("items", []):
            video_id = item["id"].get("videoId")

            if video_id:
                courses.append({
                    "course_name": item["snippet"]["title"],
                    "platform": "YouTube",
                    "url": f"https://www.youtube.com/watch?v={video_id}",
                    "type": "free",
                    "skills": [query.lower()],
                    "level": "beginner"
                })

        if courses:
            return courses

    except Exception as e:
        print("YouTube Error:", e)

    # Fallback free courses
    return [
        {
            "course_name": f"{query} Full Course",
            "platform": "YouTube",
            "url": f"https://www.youtube.com/results?search_query={query}+full+course",
            "type": "free",
            "skills": [query.lower()],
            "level": "beginner"
        },
        {
            "course_name": f"{query} Roadmap",
            "platform": "YouTube",
            "url": f"https://www.youtube.com/results?search_query={query}+roadmap",
            "type": "free",
            "skills": [query.lower()],
            "level": "beginner"
        }
    ]
