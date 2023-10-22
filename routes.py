
from flask import abort
from config import db
from models import Route, routes_schema, route_schema

def read_all():
    people = Route.query.all()
    return routes_schema.dump(people)

def read_one(route_id):
    route = Route.query.filter(Route.route_id == route_id).one_or_none()

    if route is not None:
        return route_schema.dump(route)
    else:
        abort(
            404, f"Route with id {route_id} not found"
        )