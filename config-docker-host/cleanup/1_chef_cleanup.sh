#!/bin/bash
echo "Unlinking chef files from $(pwd)/chef"
umount chef
echo "Unlinking chef files from $(pwd)/librarian"
umount librarian