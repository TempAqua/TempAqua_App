# Usage
## Processing scripts

### Script installation

To install:

1. In QGIS, go to Processing > Toolbox.
2. On the second icon from the left, select “Add a script to Toolbox…”.
3. Navigate to the `/qgis/` folder and select the script.

The script will appear at the bottom of the window.

### Script execusion

To run a script without logs

1. double click on the script 

To run a script with a log:

1. Right-click on the script.
2. Select "Edit Script...".
3. In the code window, click on the green arrow in the menu bar above.
4. Click "Run" on the new window that appears.

### tempAqua_archiving.py

This script performs the following actions:

- It validates the project by ensuring that it contains at least four layers, with at least two layers ending with '_archive', and at least two layers with names containing "media".
- It transfers new or modified features from the normal table to the archived counterpart.