import pandas as pd
from tqdm import tqdm
import os, sys 

with open('CRND0103-202108020450/HEADERS.txt', 'rt') as header:
    headers = header.read()

headers = headers.splitlines()
header = headers[1].split(' ')[:-1] # extra space at end of row


BASE = 'CRND0103-202108020450' 
folders = [f"{BASE}/{f}" for f in next(os.walk(BASE))[1] if f[0] == '2']

df_list = []

for folder in tqdm(folders):
    file_set = next(os.walk(folder))[2]
    clean_files = [f"{folder}/{f}" for f in file_set if f[:3] == 'CRN']
    for myfile in clean_files:
        
        data = pd.read_csv(myfile, header=None, sep='\s+')
        data.columns = header

        file_data = myfile.split('/')[-1].split('-')[-1].split('.')[0]
        state, station = file_data.split('_',1)
        data['STATE'] = state
        data['STATION_CODE'] = station

        df_list.append(data)

df = pd.concat(df_list, axis=0)
df.to_csv('weather_data.csv')
