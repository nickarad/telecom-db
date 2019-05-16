#!/usr/bin/python
# -*- coding: utf-8 -*-


import random

inputFile = open("stoixeia.csv", "r")

for i in inputFile:
    i = i.split(";")
    
    i[0] = "\"AK" + i[0][1:]
    
    home_phone = "\"210"
    for k in range(7):
        home_phone += str(random.randint(0, 9))
    home_phone += "\""
    i.insert(1, home_phone)
        
    mob_phone = "\"69"
    for k in range(7):
        mob_phone += str(random.randint(0, 9))
    mob_phone += "\""
    i.insert(2, mob_phone)
    
    date = i[5][:-2]
    i.insert(3, date)
    
    streets = ["Μεσολογγίου", "Ηρακλείου", "Γιαννιτσών", "Καρπάθου", "Ζακύνθου", "Ερμού", "Πατησσίων"]
    addr = ""
    addr += "\"" + streets[random.randint(0, 6)] + " " + str(random.randint(0, 100)) + "\""
    i.insert(6, addr)
    
    cities = ["Αθήνα", "Πάτρα", "Θεσσαλονίκη"]
    i[7] = "\"" + cities[random.randint(0, 2)] + "\""
    
    outputFile = open("data.csv", "a")
    outputString = ""
    for k in range(len(i)-1):
        outputString += i[k] + ";"
    outputString += i[len(i)-1]
    outputFile.write(outputString+"\n")
    
    for j in i:
        print j