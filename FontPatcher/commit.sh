#!/bin/bash

fontforge -script font-patcher ./CommitMono/CommitMono-450-Regular.otf --removeligatures --complete
fontforge -script font-patcher ./CommitMono/CommitMono-700-Regular.otf --removeligatures --complete
fontforge -script font-patcher ./CommitMono/CommitMono-450-Italic.otf --removeligatures --complete
fontforge -script font-patcher ./CommitMono/CommitMono-700-Italic.otf --removeligatures --complete
