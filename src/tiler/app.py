from chalice import Chalice, Response
import logging
from chalicelib import tile

app = Chalice(app_name='tiler')
app.log.setLevel(logging.DEBUG)


@app.route('/')
def index():
    return "ghost mouse"


@app.route('/tile/{z}/{x}/{y}')
def render(z, x, y):
    return Response(body=tile.render(app, int(z), int(x), int(y)),
                    status_code=200,
                    headers={
                        'Content-Type': 'image/png'
                        }
                    )


@app.route('/favicon.ico')
def favicon():
    pass