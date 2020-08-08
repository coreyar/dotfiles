#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
from time import localtime



class IPythonPromptPS1(object):
  def __init__(self):
    pass

  def __str__(self):
    tm = localtime()
    return "\033[0;94m[%d:%d]\033[0m \033[0;93m∆\033[0m\033[0;95m∆\033[0m\033[0;93m∆\033[0m " % (tm.tm_hour, tm.tm_min)

sys.ps1 = IPythonPromptPS1()
sys.ps2 = "    \033[0;94m...\033[0m "