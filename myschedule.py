import schedule
import time
from datetime import datetime
def job():
    dateTimeObj = datetime.now()
    print(f"I'm working...{dateTimeObj}")

schedule.every(1).minutes.do(job)

while True:
    schedule.run_pending()
    time.sleep(1)