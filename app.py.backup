from flask import Flask, render_template, jsonify, request

app = Flask(__name__)

projects = [
    {"name": "DevOps Showcase", "description": "Docker + Kubernetes deployment"},
    {"name": "Mini Portfolio", "description": "Flask web app with pages and API"},
    {"name": "API Demo", "description": "Shows JSON response for projects"}
]

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/projects")
def project_page():
    return render_template("projects.html", projects=projects)

@app.route("/contact", methods=["GET", "POST"])
def contact():
    message = None
    if request.method == "POST":
        name = request.form.get("name")
        message = f"Thank you, {name}, your message has been received!"
    return render_template("contact.html", message=message)

@app.route("/api/projects")
def project_api():
    return jsonify(projects)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

