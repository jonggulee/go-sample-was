from fastapi import FastAPI, Request
import pymysql
import uvicorn
from fastapi.templating import Jinja2Templates

app = FastAPI()
templates = Jinja2Templates(directory="templates")

@app.middleware("http")
async def json_content_type_middleware(request: Request, call_next):
    response = await call_next(request)
    response.headers["Content-Type"] = "application/json"
    return response

@app.get("/")
async def root():
    return "Hello!"

@app.get("/healthcheck")
async def healthcheck():
    return {"status": "OK"}

@app.get("/api/csp")
async def csp(request: Request):
    db_connection = DatabaseConnection()
    data = db_connection.get_all_csp_records()
    return templates.TemplateResponse("index.html", {"request": request, "data": data})

def main():
    uvicorn.run(app, host="0.0.0.0", port=3000)

class DatabaseConnection:
    def __init__(self):
        self.connection = pymysql.connect(
            host='localhost',
            user='cspadmin',
            password='cspadmin!',
            database='csp_db',
            charset='utf8',
            autocommit=True,
            cursorclass=pymysql.cursors.DictCursor
        )

    def get_all_csp_records(self):
        cur = self.connection.cursor()
        sql = "SELECT * FROM list"
        cur.execute(sql)
        rows = cur.fetchall()
        return rows

if __name__ == "__main__":
    main()
