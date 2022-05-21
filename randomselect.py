import os
import random
import subprocess
import numpy as np

for filename in os.listdir(os.getcwd()):
    num_lines = int(subprocess.run(['wc', '-l', filename], stdout=subprocess.PIPE).stdout.decode('utf-8').strip().split()[0])
    # get 10 random numbers
    random_line_numbers = np.random.randint(1,num_lines+1, 10)
    current_line = 1
    with open(filename, 'r') as f:
        with open( "selected_" + filename, 'w+') as g:
            for line in f:
                if current_line in random_line_numbers:
                    g.write(line)
                current_line += 1
