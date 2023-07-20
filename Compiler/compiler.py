import os

print(os.path)


def compiler(instruct):

    ins = instruct.split(" ")

    bits=[0]

    diction = {"0" : [0,0,0], "1" : [0,0,1], "2" : [0,1,0], "3" : [0,1,1], "4" : [1,0,0], "5" : [1,0,1], "6" : [1,1,0], "7" : [1,1,1]}

    if ins[0] == "adi":
        
        bits=[0,0,0,0]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[1][1]])
        n=str(bin(int(ins[3])))[2:]
        bits.extend(list("0"*(6-len(n))+n))

    elif ins[0] == "ada":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([0,0,0])

    elif ins[0] == "adc":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([0,1,0])

    elif ins[0] == "adz":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([0,0,1])

    elif ins[0] == "awc":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([0,1,1])

    elif ins[0] == "aca":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([1,0,0])

    elif ins[0] == "acc":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([1,1,0])

    elif ins[0] == "acz":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([1,0,1])

    elif ins[0] == "acw":

        bits=[0,0,0,1]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([1,1,1])

    elif ins[0] == "ndu":

        bits=[0,0,1,0]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([0,0,0])

    elif ins[0] == "ndc":

        bits=[0,0,1,0]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([0,1,0])

    elif ins[0] == "ndz":

        bits=[0,0,1,0]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([0,0,1])


    elif ins[0] == "ncu":

        bits=[0,0,1,0]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([1,0,0])

    elif ins[0] == "ncc":

        bits=[0,0,1,0]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([1,1,0])

    elif ins[0] == "ncz":

        bits=[0,0,1,0]
        bits.extend(diction[ins[2][1]])
        bits.extend(diction[ins[3][1]])
        bits.extend(diction[ins[1][1]])
        bits.extend([1,0,1])

    elif ins[0] == "lli":

        bits=[0,0,1,1]
        bits.extend(diction[ins[1][1]])
        n=str(bin(int(ins[2])))[2:]
        bits.extend(list("0"*(9-len(n))+n))

    elif ins[0] == "lw":
        
        bits=[0,1,0,0]
        bits.extend(diction[ins[1][1]])
        bits.extend(diction[ins[2][1]])
        n=str(bin(int(ins[3])))[2:]
        bits.extend(list("0"*(6-len(n))+n))

    elif ins[0] == "sw":
        
        bits=[0,1,0,1]
        bits.extend(diction[ins[1][1]])
        bits.extend(diction[ins[2][1]])
        n=str(bin(int(ins[3])))[2:]
        bits.extend(list("0"*(6-len(n))+n))

    elif ins[0] == "lm":

        bits=[0,1,1,0]
        bits.extend(diction[ins[1][1]])
        n=str(bin(int(ins[2])))[2:]
        bits.extend(list("0"*(9-len(n))+n))

    elif ins[0] == "sm":

        bits=[0,1,1,1]
        bits.extend(diction[ins[1][1]])
        n=str(bin(int(ins[2])))[2:]
        bits.extend(list("0"*(9-len(n))+n))

    elif ins[0] == "beq":
        
        bits=[1,0,0,0]
        bits.extend(diction[ins[1][1]])
        bits.extend(diction[ins[2][1]])
        n=str(bin(int(ins[3])))[2:]
        bits.extend(list("0"*(6-len(n))+n))

    elif ins[0] == "blt":
        
        bits=[1,0,0,1]
        bits.extend(diction[ins[1][1]])
        bits.extend(diction[ins[2][1]])
        n=str(bin(int(ins[3])))[2:]
        bits.extend(list("0"*(6-len(n))+n))

    elif ins[0] == "ble":
        
        bits=[1,0,1,0]
        bits.extend(diction[ins[1][1]])
        bits.extend(diction[ins[2][1]])
        n=str(bin(int(ins[3])))[2:]
        bits.extend(list("0"*(6-len(n))+n))

    elif ins[0] == "jal":

        bits=[1,1,0,0]
        bits.extend(diction[ins[1][1]])
        n=str(bin(int(ins[2])))[2:]
        bits.extend(list("0"*(9-len(n))+n))

    elif ins[0] == "jlr":
        
        bits=[1,1,0,1]
        bits.extend(diction[ins[1][1]])
        bits.extend(diction[ins[2][1]])
        bits.extend([0,0,0,0,0,0])

    elif ins[0] == "jri":

        bits=[1,1,1,1]
        bits.extend(diction[ins[1][1]])
        n=str(bin(int(ins[2])))[2:]
        bits.extend(list("0"*(9-len(n))+n))

    bits=[str(elem) for elem in bits]

    return "".join(bits)

import os,sys

sys.path.append(os.getcwd())
sys.path.append(os.path.dirname(os.path.realpath(__file__)))
os.chdir(os.path.dirname(os.path.realpath(__file__)))

readFile = open("code.txt","r")

outFile = open("instructions.txt","w")
outfile1 = open("instruction.txt","w")

counter=0

for line in readFile:
    compiled=compiler(line)
    print(compiled)
    outFile.write(str(counter)+" => \""+compiled+"\",\n")
    outfile1.write(compiled+"\n")
    counter+=1

for _ in range(256-counter):
    outfile1.write("0000000000000000\n")

readFile.close()
outFile.close()