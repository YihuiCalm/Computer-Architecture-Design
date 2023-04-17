import os
import re

file = "string_3"
debug_file = open("/home/ead/yihui/Downloads/gem5/m5out/"+ file + ".txt")

if os.path.exists("/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/"+ file + ".din"):
    os.remove("/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/"+ file + ".din")
trace_output = open("/home/ead/yihui/Downloads/gem5/lab4/lab4/stringsearch/"+ file + ".din", 'w')

re_exp = r"(.*)system.mem_ctrls: (.*) from(.*) address (\S*)"
line = debug_file.readline()
while line:
    if line.find("access") == -1:
        if re.search(re_exp, line): 
            match = re.match(r"(.*)system.mem_ctrls: (.*) from(.*) address 0x(\S*)", line)
            if re.search("Write", match.groups()[1]):
                access = "1"
            elif re.search("Read", match.groups()[1]):
                access = "0"
            elif re.search("IFetch", match.groups()[1]):
                access = "2"
            trace_output.writelines(access + ' ' + match.groups()[3] + '\n')
            print(access + ' ' + match.groups()[3] + '\n')
    else:
        print("not fit")
    line = debug_file.readline()
debug_file.close()
trace_output.close()