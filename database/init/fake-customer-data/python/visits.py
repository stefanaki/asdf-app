import json,random
import numpy as np
import csv
from datetime import datetime, timedelta
from randomtimestamp import randomtimestamp
from random import randrange
import time

def randomtimes(start, end, n):
    frmt = "%Y-%m-%d %H:%M"
    stime = datetime.strptime(start, frmt)
    etime = datetime.strptime(end, frmt)
    td = etime - stime
    return [random.random() * td + stime for _ in range(n)]

with open('./customers.json') as jfile:
  all_data = json.load(jfile)


cust_data = all_data

with open('./enrolls.json') as jfile:
  all_data = json.load(jfile)

enroll_data = all_data

with open('./rooms.json') as jfile:
  all_data = json.load(jfile)

rooms_data = all_data

print(rooms_data)

import csv

services_ids = {
            'RECEPTION':1,
            'ROOM':2,
            'BAR':3,
            'RESTAURANT':4,
            'CONFERENCE':5,
            'GYM':6,
            'SAUNA':7,
            'HAIR_SALON':8}

service_places = {
            1:[26],
            2:[i for i in range(52, 452)],
            3:[20,21,22,23,24,25],
            4:[16,17,18,19],
            5:[i for i in range(27, 37)],
            6:[37,38,39,40],
            7:[i for i in range(41, 51)],
            8:[51]
            }

visits = []
idx = 1
for ed in enroll_data:
  if int(ed['service_id']) == 2: continue
  for _ in range(random.randint(1,3)):
    newdict = dict()
    newdict['v_log_id'] = idx
    newdict['nfc_id'] = ed['nfc_id']
    serv = service_places[ed['service_id']]
    end = len(serv)-1
    random_place = random.randint(0, end)
    newdict['place_id'] = serv[random_place]
    en_datetime = ed['enroll_date_time']
    dt = timedelta(
                  days=random.randint(0,3),
                  seconds=random.randint(300, 86200),
                  minutes=5,
                  hours=8
                 )
    in_time = datetime.strptime(en_datetime, "%Y-%m-%d %H:%M:%S") + dt
    in_time = in_time.strftime("%Y-%m-%d %H:%M:%S")
    sec = random.randint(360, 7200)
    dt_out = timedelta(seconds=sec)
    out_time = datetime.strptime(in_time, "%Y-%m-%d %H:%M:%S") + dt_out
    out_time = out_time.strftime("%Y-%m-%d %H:%M:%S")
    newdict['timestamp_in'] = in_time
    newdict['timestamp_out'] = out_time
    visits.append(newdict)
    idx+=1

for cust in rooms_data:
  # if customer not in nfc_checkin: continue
  in_times = randomtimes(cust['start_date_time'], cust['end_date_time'], 100)
  for i in range(30):
    newdict = dict()
    newdict['v_log_id'] = idx
    newdict['nfc_id'] = cust['customer_id']
    newdict['place_id'] = cust['place_id']
    newdict['timestamp_in'] = in_times[i].strftime("%Y-%m-%d %H:%M:%S")
    dt = timedelta(
              seconds=random.randint(300, 86200),
              minutes=5,
              hours=random.randint(0,9)
              )
    out_time = in_times[i] + dt
    # out_time = datetime.strptime(newdict['IN'], "%Y-%m-%d %H:%M:%S") + dt
    newdict['timestamp_out'] = out_time.strftime("%Y-%m-%d %H:%M:%S")
    visits.append(newdict)
    idx+=1
  # in_times_lift = randomtimes(nfc_checkin[customer], nfc_checkout[customer], 50)
  for i in range(50):
    newdict = dict()
    newdict['v_log_id'] = idx
    newdict['nfc_id'] = cust['customer_id']
    newdict['place_id'] = random.randint(11,15) # elevators 11 eos 15
    newdict['timestamp_in'] = in_times[i+30].strftime("%Y-%m-%d %H:%M:%S")
    dt = timedelta(seconds=random.randint(20, 100))
    out_time = in_times[i+30] + dt
    # out_time = datetime.strptime(newdict['IN'], "%Y-%m-%d %H:%M:%S") + dt
    newdict['timestamp_out'] = out_time.strftime("%Y-%m-%d %H:%M:%S")
    visits.append(newdict)
    idx+=1
  for i in range(5):
    newdict = dict()
    newdict['v_log_id'] = idx
    newdict['nfc_id'] = cust['customer_id']
    newdict['place_id'] = random.randint(20,25) # bars 20 eos 25
    newdict['timestamp_in'] = in_times[i+80].strftime("%Y-%m-%d %H:%M:%S")
    dt = timedelta(minutes=random.randint(10, 120))
    out_time = in_times[i+80] + dt
    # out_time = datetime.strptime(newdict['IN'], "%Y-%m-%d %H:%M:%S") + dt
    newdict['timestamp_out'] = out_time.strftime("%Y-%m-%d %H:%M:%S")
    visits.append(newdict)
    idx+=1
  for i in range(5):
    newdict = dict()
    newdict['v_log_id'] = idx
    newdict['nfc_id'] = cust['customer_id']
    newdict['place_id'] = random.randint(16,19) # RESTAURANT 16 19
    newdict['timestamp_in'] = in_times[i+85].strftime("%Y-%m-%d %H:%M:%S")
    dt = timedelta(minutes=random.randint(10, 120))
    out_time = in_times[i+85] + dt
    # out_time = datetime.strptime(newdict['IN'], "%Y-%m-%d %H:%M:%S") + dt
    newdict['timestamp_out'] = out_time.strftime("%Y-%m-%d %H:%M:%S")
    visits.append(newdict)
    idx+=1
  if random.randint(0,1) == 1:
    newdict = dict()
    newdict['v_log_id'] = idx
    newdict['nfc_id'] = cust['customer_id']
    newdict['place_id'] = 51 #hair
    newdict['timestamp_in'] = in_times[90].strftime("%Y-%m-%d %H:%M:%S")
    dt = timedelta(minutes=random.randint(10, 120))
    out_time = in_times[90] + dt
    # out_time = datetime.strptime(newdict['IN'], "%Y-%m-%d %H:%M:%S") + dt
    newdict['timestamp_out'] = out_time.strftime("%Y-%m-%d %H:%M:%S")
    visits.append(newdict)
    idx+=1
  if random.randint(0,1) == 1:
    newdict = dict()
    newdict['v_log_id'] = idx
    newdict['nfc_id'] = cust['customer_id']
    newdict['place_id'] = 26 #recp
    newdict['timestamp_in'] = in_times[90].strftime("%Y-%m-%d %H:%M:%S")
    dt = timedelta(seconds=random.randint(60, 360))
    out_time = in_times[91] + dt
    # out_time = datetime.strptime(newdict['IN'], "%Y-%m-%d %H:%M:%S") + dt
    newdict['timestamp_out'] = out_time.strftime("%Y-%m-%d %H:%M:%S")
    visits.append(newdict)
    idx+=1



csv_columns = ['v_log_id','timestamp_in', 'timestamp_out','nfc_id', 'place_id']
dict_data = visits
csv_file = "visits.csv"
try:
    with open(csv_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for datat in dict_data:
            writer.writerow(datat)
except IOError:
    print("I/O error")
