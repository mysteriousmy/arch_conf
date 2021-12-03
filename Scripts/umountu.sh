#!/bin/bash
udisksctl unmount -b /dev/sdc1 && udisksctl power-off -b /dev/sdc1
