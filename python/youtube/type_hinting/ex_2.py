from datetime import datetime
from dateutil.relativedelta import relativedelta

print(datetime.now() - relativedelta(years=32))
# >>> 1990-06-24 18:32:35.875711
