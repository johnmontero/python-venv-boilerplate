# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import sys
import yaml
import boto3
import re
import logging

logger = logging.getLogger(__name__)


def main():
    try:
        logger.info('Process...')
    except exceptions.ExceptionHandler as error:
        logger.error(str(error), exc_info=True)
        

if __name__ == "__main__":
    main()