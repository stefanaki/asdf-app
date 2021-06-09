import json,random
import numpy as np
import csv
from datetime import datetime, timedelta
from randomtimestamp import randomtimestamp
from random import randrange
import time

with open('./visits.json') as jfile:
  all_data = json.load(jfile)

visits = all_data

with open('./places.json') as jfile:
  all_data = json.load(jfile)

places = all_data


bar_menu = {'MOJITO':9, 'VODKA':7, 'GIN':7, 'TEQUILA':8, 'CUBA LIBRE':8, 'RUM':7, 'MAI TAI':9, 'WHISKEY':7, 'ZOMBIE':12, 'BEER': 5}
bar_menu_keys = bar_menu.keys()
bar_menu_keys = list(bar_menu_keys)

services_cost = {
            4:20,
            5:10,
            6:15,
            7:30,
            8:15}

costs_data = []
for v in visits:
  if int(v['place_id']) <=15 or int(v['place_id']) >= 52 or int(v['place_id']) == 26: continue
  else:
    for i in places:
      if i['place_id'] == int(v['place_id']):
        pd = i['place_description']
        break
    cost_dict = dict()
    cost_dict['customer_id'] = v['nfc_id']
    cost_dict['use_date_time'] = v['timestamp_out']
    if int(v['place_id']) >= 20 and int(v['place_id']) <= 25:
      temp = bar_menu_keys[random.randint(0,len(bar_menu)-1)]
      cost_dict['charge_amount'] = bar_menu[temp]
      cost_dict['description'] = pd + ": " + temp
      cost_dict['service_id'] = 3
    else:
      for i in places:
          if i['place_id'] == int(v['place_id']):
              pd = i['place_description']
              s = i['offered_service_id']
              break
      cost_dict['description'] = pd
      cost_dict['service_id'] = s
      cost_dict['charge_amount'] = services_cost[s]
    costs_data.append(cost_dict)

csv_columns = ['customer_id','service_id', 'use_date_time','description','charge_amount']
dict_data = costs_data
csv_file = "uses.csv"
try:
    with open(csv_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for datat in dict_data:
            writer.writerow(datat)
except IOError:
    print("I/O error")
