import sys
import re
def get_log():
  
  infile_name = 'rdata/20210903_access.log'
  infile = open(infile_name, 'r')
  
  line_re = re.compile(r'''(?P<remote_host>\S+)\s+
            (?P<log_nm>\S+)\s+
            (?P<remote_usr>\S+)\s+
            \[(?P<datetime>[^\[\]]+)\]\s+
            ''', re.VERBOSE)
  
  for ln in infile:
    m = line_re.match(ln)
    d = m.groupdict()
    # print(d['remote_host'],
    #   d['log_nm'],
    #   d['remote_usr'],
    #   d['datetime'])
    
  return d
  



