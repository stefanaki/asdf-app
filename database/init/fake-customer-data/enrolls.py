
# SERVICES

reg_services = []
no_reg_services = []

c = dict()
c['service_id'] = 1
c['service_type'] = 'RECEPTION'
no_reg_services.append(c)

#c = dict()
#c['service_id'] = 2
#c['service_type'] = 'ROOM'
#reg_services.append(c)

c = dict()
c['service_id'] = 3
c['service_type'] = 'BAR'
no_reg_services.append(c)

c = dict()
c['service_id'] = 4
c['service_type'] = 'RESTAURANT'
no_reg_services.append(c)

c = dict()
c['service_id'] = 5
# c['service_type'] = 'CONFERENCE'
reg_services.append(c)

c = dict()
c['service_id'] = 6
#c['service_type'] = 'GYM'
reg_services.append(c)

c = dict()
c['service_id'] = 7
#c['service_type'] = 'SAUNA'
reg_services.append(c)

c = dict()
c['service_id'] = 8
c['service_type'] = 'HAIR_SALON'
no_reg_services.append(c)

reg_services = [5, 6, 7]

# ENROLLS
enroll_data = []
for x,cust in enumerate(data):
  if x%100==0: continue
  randomran = random.randint(1,3)
  if randomran == 1:
    en = dict()
    en['nfc_id'] = cust['nfc_id']
    en['service_id'] = reg_services[random.randint(0,2)]
    en['enroll_date_time'] = randomtimestamp(start = datetime(2021, 5, 1, 0, 0, 0), end = datetime(2021, 6, 10, 0, 0, 0), pattern='%Y-%m-%d %H:%M:%S')
    enroll_data.append(en)
  elif randomran == 2:
    en = dict()
    en['nfc_id'] = cust['nfc_id']
    x = random.randint(0,2)
    en['service_id'] = reg_services[x]
    timestamp = randomtimestamp(start = datetime(2021, 5, 1, 0, 0, 0), end = datetime(2021, 6, 10, 0, 0, 0), pattern='%Y-%m-%d %H:%M:%S')
    en['enroll_date_time'] = timestamp
    enroll_data.append(en)
    en = dict()
    if x==0: x = random.choice([1,2])
    elif x==1: x = random.choice([0,2])
    else: x = random.choice([0,1])
    en['nfc_id'] = cust['nfc_id']
    en['service_id'] = reg_services[x]
    en['enroll_date_time'] = timestamp
    enroll_data.append(en)
  else:
    en = dict()
    en['nfc_id'] = cust['nfc_id']
    en['service_id'] = reg_services[0]
    timestamp = randomtimestamp(start = datetime(2021, 5, 1, 0, 0, 0), end = datetime(2021, 6, 10, 0, 0, 0), pattern='%Y-%m-%d %H:%M:%S')
    # en['enroll_date_time'] = randomtimestamp(start_year=2018, end_year=2021, pattern='%Y-%m-%d %H:%M:%S')
    en['enroll_date_time'] = timestamp
    enroll_data.append(en)
    en = dict()
    en['nfc_id'] = cust['nfc_id']
    en['service_id'] = reg_services[1]
    dt = timedelta(seconds=86200)
    timestamp2 = datetime.strptime(timestamp, "%Y-%m-%d %H:%M:%S") + dt
    timestamp2 = timestamp2.strftime("%Y-%m-%d %H:%M:%S")
    en['enroll_date_time'] = timestamp2
    enroll_data.append(en)
    en = dict()
    en['nfc_id'] = cust['nfc_id']
    x = random.randint(0,2)
    en['service_id'] = reg_services[2]
    dt = timedelta(seconds=1000)
    timestamp3 = datetime.strptime(timestamp2, "%Y-%m-%d %H:%M:%S") + dt
    timestamp3 = timestamp3.strftime("%Y-%m-%d %H:%M:%S")
    en['enroll_date_time'] = timestamp3
    enroll_data.append(en)

csv_columns = ['nfc_id', 'service_id', 'enroll_date_time']
dict_data = enroll_data
csv_file = "enrollservice.csv"
try:
    with open(csv_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for datat in dict_data:
            writer.writerow(datat)
except IOError:
    print("I/O error")
