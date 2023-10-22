from flask import render_template
import config
from models import Route

app = config.connex_app
app.add_api(config.basedir / "swagger.yml")

@app.route("/")
def home():
    routes = Route.query.all()
    return render_template("home.html", routes=routes)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)