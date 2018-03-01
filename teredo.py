# -*- coding: utf-8 -*- # 
import time
import socket
import subprocess,re
import os
def getPING(domain):  
    p = subprocess.Popen(["ping.exe", domain], stdin = subprocess.PIPE, stdout = subprocess.PIPE, stderr = subprocess.PIPE, shell = True)  
    out = p.stdout.read().decode('gbk')    
    regAverage = u'Average = \d+ms|平均 = \d+ms'  
    average = re.search(regAverage, out)  
    if average:  
        average = filter(lambda x:x.isdigit(),average.group())  
    return average

def check(add, port):
    #print ('++++++++++UDP connection testing+++++++++')
    try:
        sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
        sock.settimeout(5)
        sock.connect((add, port))
        a=sock.sendto("123",(add, port))
        if a==3:
            #print ip,'accessible'
            return True
    except socket.error, e:
        return False
    finally:
        sock.close() 
if __name__ == "__main__":
    import ConfigParser
    iplist = [
    'teredo.remlab.net',
    'teredo2.remlab.net',
    'teredo-debian.remlab.net',
    'teredo.ngix.ne.kr',
    'teredo.trex.fi',
    'teredo.autotrans.consulintel.com',
    'teredo.managemydedi.com',
    'teredo.ipv6.microsoft.com',
    'win10.ipv6.microsoft.com' ,
    'teredo.iks-jena.de',
    'win1710.ipv6.microsoft.com',
	'debian-miredo.progsoc.org',
	'teredo.ginzado.ne.jp',
	'teredo.iks-jena.de']
    port = 3544
    okiplist =[]
    b =   {}
    print ('\n++++++++++UDP connection testing+++++++++\n')
    for ip in iplist:
        stat = check(ip, port)
        if stat == True:
            print '%s:%s is accessible' % (ip, port) 
            okiplist.append(ip)
        if stat != True:
            print '%s:%s isn\'t accessible' % (ip, port)       
    print ('\n++++++++++ping testing+++++++++\n')   
    for i in okiplist:
        a = getPING(i)
        if not a :a=9999
        a = int(a)
        b[i] = a
        print  i,a,'ms'
        
    d=min(b, key=b.get)
    print u'\n+++++++最佳teredo为：',d,'+++++++'
    sett='netsh interface teredo set state server='+d
    os.system(sett)


