def insert(tableName, valuesNamesList, inputFile):
    query = "INSERT INTO {table} ({valuesNames}) VALUES ({values});\n"
    
    outFile = open("query.sql", "a")
    data = []
    for line in inputFile:
        array = line[0:-1].split(";")
        data.append(", ".join(array))
            
    
    for i in inFile:
        i = i.split(";")
        print i[2]
    
    valNames = ""
    for i in range(len(valuesNamesList)-1):
        valNames += backticks(valuesNamesList[i]) + ", "
    valNames += backticks(valuesNamesList[len(valuesNamesList)-1])
    
    for line in data:
        outFile.write(query.format(
            table = backticks(tableName),
            valuesNames = valNames,
            values = line
        ))
    
def backticks(string):
    return "`{}`".format(string)
    

if __name__ == "__main__" :
    table1 = "customer"
    valNameList1 = [
        "Identity_Card_Number",
        "home_phone_number",
        "Mobile_Phone_Number",
        "registration date",
        "FirstName",
        "LastName",
        "Address",
        "City"
    ]
    inFile = open("data.csv", "r")
    insert(table1, valNameList1, inFile)