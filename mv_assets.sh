#!/bin/bash
cd
tar -cvzf assets.tgz assets
mv assets.tgz /tmp
cd /tmp
tar -xvzf assets.tgz
