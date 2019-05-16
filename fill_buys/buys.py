#!/usr/bin/python
# -*- coding: utf-8 -*-


import random

inputFile = open("customers.csv", "r")
outputFile = open("buys.csv", "a")

packets = ["1252", "1253", "1254", "1452", "1453", "1454", "1455"]

for line in inputFile:
	data = line.split(";")

	outputString = ""
	outputString += data[0] + ";" + "\"" + packets[random.randint(0, 6)] + "\"" + ";" + data[3]

	outputFile.write(outputString+"\n")

outputFile.close()

