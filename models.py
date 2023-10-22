from config import db, ma

class Route(db.Model):
    __tablename__ = "routes"
    route_id = db.Column(db.Integer, primary_key=True)
    route_short_name = db.Column(db.String(32))
    route_long_name = db.Column(db.String(32))
    
class RouteSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Route
        load_instance = True
        sqla_session = db.session

route_schema = RouteSchema()
routes_schema = RouteSchema(many=True)