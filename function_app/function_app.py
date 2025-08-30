import azure.functions as func
from funcs.http_example_func import bp as http_example_bp

app = func.FunctionApp()

# Register the blueprint
app.register_blueprint(http_example_bp)