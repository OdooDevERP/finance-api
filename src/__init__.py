from fastapi import FastAPI


app = FastAPI(
    title="REST API",
    summary="WebService",
    description="Financial WebService",
    version="1.0.0",
    docs_url="/ReDux",
    redoc_url="/ReDuceX"
)


@app.get("/", tags=["Main"])
async def index():
    """
        Index Route
    """
    return {
        "route": "Index Route"
    }
