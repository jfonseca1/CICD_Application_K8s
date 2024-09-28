FROM python:3.10 
# Or any preferred Python version.
ADD app.py .
RUN pip install requests beautifulsoup4 python-dotenv
CMD [“python”, “./app.py”] 
# Or enter the name of your unique directory and parameter set.
