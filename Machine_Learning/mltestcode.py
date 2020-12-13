# Imported from arcsight tool for testing and exploration
import pandas as pd 
import itertools
import numpy as np



output1 = {} #holds the times
output2 = {} #holds the diffs
output = []  #holds the results

data = pd.read_csv('') 

for index, row in data.iterrows():
	key=(row["sourceAddress"],row["destinationHostName"])
	output1.setdefault(key,[]).append(row["endTime"]) 
for key in output1 :
	for previous, current in zip(output1[key], output1[key][1:]):
		output2.setdefault(key,[]).append(current-previous) 
	
for key in output2 :
	stdv = np.std(output2[key])
	if(stdv<1) :
		output.append([key[0],key[1],stdv])
	
	

df=pd.DataFrame(output, columns = ['SourceAddress', 'URL' ,'STDV'])
df.to_csv('')

#ArcSight%20and%20Malware%20Beaconing%20-%2002-17-2010.pdf
